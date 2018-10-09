/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-infrastructure/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-infrastructure/job/master/)
 *
 * # DC/OS GCP Infrastucture
 *
 * This module creates typical DS/OS infrastructure in GCP.
 *
 * ## EXAMPLE
 *
 * ```hcl
 * module "dcos-infrastructure" {
 *   source  = "terraform-dcos/infrastructure/gcp"
 *   version = "~> 0.1"
 *
 *   infra_public_ssh_key_path = "~/.ssh/id_rsa.pub"
 *
 *   num_masters = "3"
 *   num_private_agents = "2"
 *   num_public_agents = "1"
 * }
 * ```
 */

provider "google" {}

data "google_compute_zones" "available" {}

module "network" {
  source  = "dcos-terraform/network/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  master_cidr_range = "${var.master_cidr_range}"
  agent_cidr_range  = "${var.agent_cidr_range}"
  name_prefix       = "${var.name_prefix}"
}

module "compute-firewall" {
  source  = "dcos-terraform/compute-firewall/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  name_prefix      = "${var.name_prefix}"
  network          = "${module.network.self_link}"
  admin_ips        = ["${var.admin_ips}"]
  internal_subnets = ["${var.master_cidr_range}", "${var.agent_cidr_range}"]
}

module "dcos-forwarding-rules" {
  source  = "dcos-terraform/compute-forwarding-rule-dcos/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  name_prefix             = "${var.name_prefix}"
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
  name_prefix               = "${var.name_prefix}"
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
  name_prefix            = "${var.name_prefix}"
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
  name_prefix                   = "${var.name_prefix}"
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
  name_prefix                  = "${var.name_prefix}"
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
