output "bootstrap.os_user" {
  description = "Bootstrap instance OS default user"
  value       = "${module.bootstrap.os_user}"
}

output "bootstrap.prereq-id" {
  description = "Returns the ID of the prereq script for bootstrap (if user_data or ami are not used)"
  value       = "${module.bootstrap.prereq-id}"
}

output "masters.os_user" {
  description = "Master instances private OS default user"
  value       = "${module.masters.os_user}"
}

output "forwarding_rules.masters" {
  description = "Master Forwarding Rules"
  value       = "${module.dcos-forwarding-rules.masters_ip_address}"
}

output "forwarding_rules.public_agents" {
  description = "Public Agent Forwarding Rules"
  value       = "${module.dcos-forwarding-rules.public_agents_ip_address}"
}

output "masters.prereq-id" {
  description = "Returns the ID of the prereq script for masters (if user_data or ami are not used)"
  value       = "${module.masters.prereq-id}"
}

output "private_agents.os_user" {
  description = "Private Agent instances private OS default user"
  value       = "${module.private_agents.os_user}"
}

output "private_agents.prereq-id" {
  description = "Returns the ID of the prereq script for private agents (if user_data or ami are not used)"
  value       = "${module.private_agents.prereq-id}"
}

output "public_agents.os_user" {
  description = "Private Agent instances private OS default user"
  value       = "${module.public_agents.os_user}"
}

output "public_agents.prereq-id" {
  description = "Returns the ID of the prereq script for public agents (if user_data or ami are not used)"
  value       = "${module.public_agents.prereq-id}"
}

output "bootstrap.private_ip" {
  description = "Private IP of the bootstrap instance"
  value       = "${module.bootstrap.private_ip}"
}

output "bootstrap.public_ip" {
  description = "Public IP of the bootstrap instance"
  value       = "${module.bootstrap.public_ip}"
}

output "masters.public_ips" {
  description = "Master instances public IPs"
  value       = "${module.masters.public_ips}"
}

output "masters.private_ips" {
  description = "Master instances private IPs"
  value       = "${module.masters.private_ips}"
}

output "masters.subnetwork_name" {
  description = "Master instances subnetwork name"
  value       = "${module.masters.master_subnetwork_name}"
}

output "private_agents.public_ips" {
  description = "Private Agent public IPs"
  value       = "${module.private_agents.public_ips}"
}

output "private_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value       = "${module.private_agents.private_ips}"
}

output "private_agents.subnetwork_name" {
  description = "Private Agent instances subnetwork name"
  value       = "${module.private_agents.private_agent_subnetwork_name}"
}

output "public_agents.public_ips" {
  description = "Public Agent public IPs"
  value       = "${module.public_agents.public_ips}"
}

output "public_agents.private_ips" {
  description = "Public Agent instances private IPs"
  value       = "${module.public_agents.private_ips}"
}

output "public_agents.subnetwork_name" {
  description = "Public Agent instances subnetwork name"
  value       = "${module.public_agents.public_agent_subnetwork_name}"
}
