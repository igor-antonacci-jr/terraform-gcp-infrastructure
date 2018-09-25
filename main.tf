data "http" "whatismyip" {
  url = "http://whatismyip.akamai.com/"
}

provider "google" {}

data "google_compute_zones" "available" {}

resource "random_id" "id" {
  byte_length = 2
  prefix      = "${var.name_prefix}-tf"
}

module "network" {
  source  = "dcos-terraform/network/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  master_cidr_range = "${var.master_cidr_range}"
  agent_cidr_range  = "${var.agent_cidr_range}"
  name_prefix       = "${random_id.id.hex}"
}

module "compute-firewall" {
  source  = "dcos-terraform/compute-firewall/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  name_prefix      = "${random_id.id.hex}"
  network          = "${module.network.self_link}"
  admin_ips        = ["${coalescelist(var.admin_ips, list("${data.http.whatismyip.body}/32"))}"]
  internal_subnets = ["${var.master_cidr_range}", "${var.agent_cidr_range}"]
}

module "dcos-forwarding-rules" {
  source  = "dcos-terraform/compute-forwarding-rule-dcos/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  name_prefix             = "${random_id.id.hex}"
  masters_self_link       = ["${module.masters.instances_self_link}"]
  public_agents_self_link = ["${module.public_agents.instances_self_link}"]
}

module "bootstrap" {
  source  = "dcos-terraform/bootstrap/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  disk_size                 = "${coalesce(var.bootstrap_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.bootstrap_disk_type, var.infra_disk_type)}"
  machine_type              = "${coalesce(var.bootstrap_machine_type, var.infra_machine_type)}"
  name_prefix               = "${random_id.id.hex}"
  public_ssh_key            = "${coalesce(var.bootstrap_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user                  = "${coalesce(var.bootstrap_ssh_user, var.infra_ssh_user)}"
  bootstrap_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                     = "${var.bootstrap_image}"
  dcos_instance_os          = "${coalesce(var.bootstrap_dcos_instance_os, var.infra_dcos_instance_os)}"

  # Determine if we need to force a particular region
  zone_list    = "${data.google_compute_zones.available.names}"
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "masters" {
  source  = "dcos-terraform/masters/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  num_masters            = "${var.num_masters}"
  disk_size              = "${coalesce(var.master_disk_size, var.infra_disk_size)}"
  disk_type              = "${coalesce(var.master_disk_type, var.infra_disk_type)}"
  machine_type           = "${coalesce(var.master_machine_type, var.infra_machine_type)}"
  name_prefix            = "${random_id.id.hex}"
  public_ssh_key         = "${coalesce(var.master_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user               = "${coalesce(var.master_ssh_user, var.infra_ssh_user)}"
  master_subnetwork_name = "${module.network.master_subnetwork_name}"
  image                  = "${var.master_image}"
  dcos_instance_os       = "${coalesce(var.master_dcos_instance_os, var.infra_dcos_instance_os)}"

  # Determine if we need to force a particular region
  zone_list    = "${data.google_compute_zones.available.names}"
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "private_agents" {
  source  = "dcos-terraform/private-agents/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  num_private_agents            = "${var.num_private_agents}"
  disk_size                     = "${coalesce(var.private_agent_disk_size, var.infra_disk_size)}"
  disk_type                     = "${coalesce(var.private_agent_disk_type, var.infra_disk_type)}"
  machine_type                  = "${coalesce(var.private_agent_machine_type, var.infra_machine_type)}"
  name_prefix                   = "${random_id.id.hex}"
  public_ssh_key                = "${coalesce(var.private_agent_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user                      = "${coalesce(var.private_agent_ssh_user, var.infra_ssh_user)}"
  private_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                         = "${var.private_agent_image}"
  dcos_instance_os              = "${coalesce(var.private_agent_dcos_instance_os, var.infra_dcos_instance_os)}"

  # Determine if we need to force a particular region
  zone_list    = "${data.google_compute_zones.available.names}"
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "public_agents" {
  source  = "dcos-terraform/public-agents/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  num_public_agents            = "${var.num_public_agents}"
  disk_size                    = "${coalesce(var.public_agent_disk_size, var.infra_disk_size)}"
  disk_type                    = "${coalesce(var.public_agent_disk_type, var.infra_disk_type)}"
  machine_type                 = "${coalesce(var.public_agent_machine_type, var.infra_machine_type)}"
  name_prefix                  = "${random_id.id.hex}"
  public_ssh_key               = "${coalesce(var.public_agent_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user                     = "${coalesce(var.public_agent_ssh_user, var.infra_ssh_user)}"
  public_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                        = "${var.public_agent_image}"
  dcos_instance_os             = "${coalesce(var.public_agent_dcos_instance_os, var.infra_dcos_instance_os)}"

  # Determine if we need to force a particular region
  zone_list    = "${data.google_compute_zones.available.names}"
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}
