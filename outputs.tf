# Deployed Name Prefix
output "name_prefix" {
  description = "Cluster Name"
  value       = "${var.cluster_name}"
}

# Deployed Bootstrap disk size
output "bootstrap.disk_size" {
  description = "bootstrap.disk size"
  value       = "${module.bootstrap.disk_size}"
}

# Deployed Bootstrap disk type
output "bootstrap.disk_type" {
  description = "bootstrap.disk type"
  value       = "${module.bootstrap.disk_type}"
}

# Deployed bootstrap machine type
output "bootstrap.machine_type" {
  description = "bootstrap.machine type"
  value       = "${module.bootstrap.machine_type}"
}

# Deployed bootstrap image
output "bootstrap.image" {
  description = "bootstrap.image"
  value       = "${module.bootstrap.image}"
}

# Deployed bootstrap agent SSH user
output "bootstrap.ssh_user" {
  description = "bootstrap.ssh user"
  value       = "${module.bootstrap.ssh_user}"
}

# Returns the ID of the prereq script (if image are not used)
output "bootstrap.prereq_id" {
  description = "bootstrap.prereq id"
  value       = "${module.bootstrap.prereq_id}"
}

# Number of Masters
output "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  value       = "${var.num_masters}"
}

# Deployed master disk size
output "masters.disk_size" {
  description = "masters.disk size"
  value       = "${module.masters.disk_size}"
} #

# Deployed master disk type
output "masters.disk_type" {
  description = "masters.disk type"
  value       = "${module.masters.disk_type}"
}

# Deployed master machine type
output "masters.machine_type" {
  description = "masters.machine type"
  value       = "${module.masters.machine_type}"
}

# Deployed master image
output "masters.image" {
  description = "masters.image"
  value       = "${module.masters.image}"
}

# Deployed masters agent SSH user
output "masters.ssh_user" {
  description = "masters.ssh user"
  value       = "${module.masters.ssh_user}"
}

# Master Google Front End Load Balancer Address
output "forwarding_rules.masters" {
  description = "forwarding rules.masters"
  value       = "${module.dcos-forwarding-rules.masters_ip_address}"
}

# Public Agents Google Front End Load Balancer Address
output "forwarding_rules.public_agents" {
  description = "forwarding rules.public agents"
  value       = "${module.dcos-forwarding-rules.public_agents_ip_address}"
}

# Returns the ID of the prereq script (if image are not used)
output "masters.prereq_id" {
  description = "masters.prereq id"
  value       = "${module.masters.prereq_id}"
}

# Number of private agents
output "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
  value       = "${var.num_private_agents}"
}

# Deployed private agent disk size
output "private_agents.disk_size" {
  description = "private agents.disk size"
  value       = "${module.private_agents.disk_size}"
}

# Deployed private agent disk type
output "private_agents.disk_type" {
  description = "private agents.disk type"
  value       = "${module.private_agents.disk_type}"
}

# Deployed private agent machine type
output "private_agents.machine_type" {
  description = "private agents.machine type"
  value       = "${module.private_agents.machine_type}"
}

# Deployed private agent image
output "private_agents.image" {
  description = "private agents.image"
  value       = "${module.private_agents.image}"
}

# Deployed private agent SSH user
output "private_agents.ssh_user" {
  description = "private agents.ssh user"
  value       = "${module.private_agents.ssh_user}"
}

# Returns the ID of the prereq script (if image are not used)
output "private_agents.prereq_id" {
  description = "private agents.prereq id"
  value       = "${module.private_agents.prereq_id}"
}

# Number of public agents
output "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
  value       = "${var.num_public_agents}"
}

# Deployed public agent disk size
output "public_agents.disk_size" {
  description = "public agents.disk size"
  value       = "${module.public_agents.disk_size}"
}

# Deployed public agent disk type
output "public_agents.disk_type" {
  description = "public agents.disk type"
  value       = "${module.public_agents.disk_type}"
}

# Deployed public agent machine type
output "public_agents.machine_type" {
  description = "public agents.machine type"
  value       = "${module.public_agents.machine_type}"
}

# provided public agent OS image
output "public_agents.image" {
  description = "public agents.image"
  value       = "${module.public_agents.image}"
}

# Deployed public agent SSH user
output "public_agents.ssh_user" {
  description = "public agents.ssh user"
  value       = "${module.public_agents.ssh_user}"
}

# Returns the ID of the prereq script (if image are not used)
output "public_agents.prereq_id" {
  description = "public agents.prereq id"
  value       = "${module.public_agents.prereq_id}"
}

# Bootstrap private ip
output "bootstrap.private_ip" {
  description = "Private IP of the bootstrap instance"
  value       = "${module.bootstrap.private_ip}"
}

# Bootstrap public ip
output "bootstrap.public_ip" {
  description = "Public IP of the bootstrap instance"
  value       = "${module.bootstrap.public_ip}"
}

# masters public ip
output "masters.public_ips" {
  description = "Master instances public IPs"
  value       = "${module.masters.public_ips}"
}

# masters private ip
output "masters.private_ips" {
  description = "Master instances private IPs"
  value       = "${module.masters.private_ips}"
}

# private_agent public ip
output "private_agents.public_ips" {
  description = "Private Agent public IPs"
  value       = "${module.private_agents.public_ips}"
}

# private_agent private ip
output "private_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value       = "${module.private_agents.private_ips}"
}

# public_agent public ip
output "public_agents.public_ips" {
  description = "Private Agent public IPs"
  value       = "${module.public_agents.public_ips}"
}

# public_agent private ip
output "public_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value       = "${module.public_agents.private_ips}"
}

# Master node tested OSes image
output "masters.dcos_instance_os" {
  description = "masters.dcos instance os"
  value       = "${module.masters.dcos_instance_os}"
}

# Public Agent node tested OSes image
output "public_agents.dcos_instance_os" {
  description = "public agents.dcos instance os"
  value       = "${module.public_agents.dcos_instance_os}"
}

# Private agent node tested OSes image
output "private_agents.dcos_instance_os" {
  description = "private agents.dcos instance os"
  value       = "${module.private_agents.dcos_instance_os}"
}

# Bootstrap node tested OSes image
output "bootstrap.dcos_instance_os" {
  description = "bootstrap.dcos instance os"
  value       = "${module.bootstrap.dcos_instance_os}"
}

# DCOS Version
output "dcos_version" {
  description = "Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list."
  value       = "${var.dcos_version}"
}
