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
