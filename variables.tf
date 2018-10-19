#
variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

# Master CIDR Range
variable "master_cidr_range" {
  description = "Master CIDR Range"
  default     = "10.64.0.0/16"
}

# Agent CIDR Range
variable "agent_cidr_range" {
  description = "Agent CIDR Range"
  default     = "10.65.0.0/16"
}

# Bootstrap node disk size (gb)
variable "bootstrap_disk_size" {
  description = "Bootstrap node disk size (gb)"
  default     = ""
}

# Bootstrap node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "bootstrap_disk_type" {
  description = "Bootstrap node disk type"
  default     = ""
}

# Bootstrap node machine type
variable "bootstrap_machine_type" {
  description = "Bootstrap node machine type"
  default     = ""
}

# Bootstrap node OS image
variable "bootstrap_image" {
  description = "Bootstrap node OS image"
  default     = ""
}

# Master node disk size (gb)
variable "master_disk_size" {
  description = "Master node disk size (gb)"
  default     = ""
}

# Master node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "master_disk_type" {
  description = "Master node disk type."
  default     = ""
}

# Master node machine type
variable "master_machine_type" {
  description = "Master node machine type"
  default     = ""
}

# Master node OS image
variable "master_image" {
  description = "Master node OS image"
  default     = ""
}

# Private agent node disk size (gb)
variable "private_agent_disk_size" {
  description = "Private agent node disk size (gb)"
  default     = ""
}

# Private agent node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "private_agent_disk_type" {
  description = "Private agent node disk type."
  default     = ""
}

# Private agent node machine type
variable "private_agent_machine_type" {
  description = "Private agent node machine type"
  default     = ""
}

# Private agent node OS image
variable "private_agent_image" {
  description = "Private agent node OS image"
  default     = ""
}

# Public agent disk size (gb)
variable "public_agent_disk_size" {
  description = "Public agent disk size (gb)"
  default     = ""
}

# Public agent node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "public_agent_disk_type" {
  description = "Public agent node disk type."
  default     = ""
}

# Public agent machine type
variable "public_agent_machine_type" {
  description = "Public agent machine type"
  default     = ""
}

# Public agent node OS image
variable "public_agent_image" {
  description = "Public agent node OS image"
  default     = ""
}

# Master node Public SSH Key
variable "master_public_ssh_key_path" {
  description = "Master node Public SSH Key"
  default     = ""
}

# Private Agent node Public SSH Key
variable "private_agent_public_ssh_key_path" {
  description = "Private Agent node Public SSH Key"
  default     = ""
}

# Public Agent node Public SSH Key
variable "public_agent_public_ssh_key_path" {
  description = "Public Agent node Public SSH Key"
  default     = ""
}

# Bootstrap Node Public SSH Key
variable "bootstrap_public_ssh_key_path" {
  description = "Bootstrap Node Public SSH Key"
  default     = ""
}

# Master node SSH User
variable "master_ssh_user" {
  description = "Master node SSH User"
  default     = ""
}

# Bootstrap node SSH User
variable "bootstrap_ssh_user" {
  description = "Bootstrap node SSH User"
  default     = ""
}

# Public Agent node SSH User
variable "public_agent_ssh_user" {
  description = "Public Agent node SSH User"
  default     = ""
}

# Private Agent ndoe SSH User
variable "private_agent_ssh_user" {
  description = "Private Agent node SSH User"
  default     = ""
}

# Global Infra SSH User
variable "infra_ssh_user" {
  description = "Global Infra SSH User"
  default     = ""
}

# Global Infra Public SSH Key
variable "infra_public_ssh_key_path" {
  description = "Global Infra Public SSH Key"
}

# Global Infra Disk Type
variable "infra_disk_type" {
  description = "Global Infra Disk Type"
  default     = "pd-ssd"
}

# Global Infra Disk Size
variable "infra_disk_size" {
  description = "Global Infra Disk Size"
  default     = "128"
}

# Global Infra Machine Type
variable "infra_machine_type" {
  description = "Global Infra Machine Type"
  default     = "n1-standard-8"
}

# Global Infra Tested OSes Image
variable "infra_dcos_instance_os" {
  description = "Global Infra Tested OSes Image"
  default     = "coreos_1576.5.0"
}

# Master node tested OSes image
variable "master_dcos_instance_os" {
  description = "Master node tested OSes image"
  default     = ""
}

# Public Agent node tested OSes image
variable "public_agent_dcos_instance_os" {
  description = "Public Agent node tested OSes image"
  default     = ""
}

# Private agent node tested OSes image
variable "private_agent_dcos_instance_os" {
  description = "Private agent node tested OSes image"
  default     = ""
}

# Bootstrap node tested OSes image
variable "bootstrap_dcos_instance_os" {
  description = "Bootstrap node tested OSes image"
  default     = ""
}

variable "admin_ips" {
  description = "List of CIDR admin IPs"
  type        = "list"
}

##############################
#                            #
#  Terraform DCOS Variables  #
##############################

# Number of Masters
variable "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  default     = "3"
}

# Number of Private Agents
variable "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
  default     = "1"
}

# Number of Public Agents
variable "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
  default     = "1"
}

# DCOS Version
variable "dcos_version" {
  description = "Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list."
  default     = "1.11.4"
}

# Add special tags to the resources created by this module
variable "tags" {
  description = "Add custom tags to all resources"
  type        = "list"
  default     = []
}

variable "labels" {
  description = "Add custom labels to all resources"
  type        = "map"
  default     = {}
}

variable "public_agents_additional_ports" {
  description = "List of additional ports allowed for public access on public agents (80 and 443 open by default)"
  type        = "list"
  default     = []
}
