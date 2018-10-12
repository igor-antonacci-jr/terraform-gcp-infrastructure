[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-infrastructure/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-infrastructure/job/master/)

# DC/OS GCP Infrastucture

This module creates typical DS/OS infrastructure in GCP.

## EXAMPLE

```hcl
module "dcos-infrastructure" {
  source  = "terraform-dcos/infrastructure/gcp"
  version = "~> 0.1"

  infra_public_ssh_key_path = "~/.ssh/id_rsa.pub"

  num_masters = "3"
  num_private_agents = "2"
  num_public_agents = "1"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_ips | List of CIDR admin IPs | list | - | yes |
| agent_cidr_range | agent cidr range | string | `10.65.0.0/16` | no |
| bootstrap_dcos_instance_os | bootstrap dcos instance os | string | `` | no |
| bootstrap_disk_size | bootstrap disk size | string | `` | no |
| bootstrap_disk_type | bootstrap disk type | string | `` | no |
| bootstrap_image | bootstrap image | string | `` | no |
| bootstrap_machine_type | [BOOTSTRAP] Machine type | string | `` | no |
| bootstrap_public_ssh_key_path | bootstrap public ssh key path | string | `` | no |
| bootstrap_ssh_user | bootstrap ssh user | string | `` | no |
| cluster_name | Cluster Name | string | - | yes |
| dcos_version | Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list. | string | `1.11.4` | no |
| infra_dcos_instance_os | infra dcos instance os | string | `coreos_1576.5.0` | no |
| infra_disk_size | infra disk size | string | `128` | no |
| infra_disk_type | infra disk type | string | `pd-ssd` | no |
| infra_machine_type | infra machine type | string | `n1-standard-8` | no |
| infra_public_ssh_key_path | infra public ssh key path | string | - | yes |
| infra_ssh_user | infra ssh user | string | `` | no |
| labels | Add custom labels to all resources | map | `<map>` | no |
| master_cidr_range | master cidr range | string | `10.64.0.0/16` | no |
| master_dcos_instance_os | master dcos instance os | string | `` | no |
| master_disk_size | master disk size | string | `` | no |
| master_disk_type | master disk type | string | `` | no |
| master_image | master image | string | `` | no |
| master_machine_type | master machine type | string | `` | no |
| master_public_ssh_key_path | master public ssh key path | string | `` | no |
| master_ssh_user | master ssh user | string | `` | no |
| num_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | `3` | no |
| num_private_agents | Specify the amount of private agents. These agents will provide your main resources | string | `1` | no |
| num_public_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | `1` | no |
| private_agent_dcos_instance_os | private agent dcos instance os | string | `` | no |
| private_agent_disk_size | private agent disk size | string | `` | no |
| private_agent_disk_type | private agent disk type | string | `` | no |
| private_agent_image | private agent image | string | `` | no |
| private_agent_machine_type | private agent machine type | string | `` | no |
| private_agent_public_ssh_key_path | private agent public ssh key path | string | `` | no |
| private_agent_ssh_user | private agent ssh user | string | `` | no |
| public_agent_dcos_instance_os | public agent dcos instance os | string | `` | no |
| public_agent_disk_size | public agent disk size | string | `` | no |
| public_agent_disk_type | public agent disk type | string | `` | no |
| public_agent_image | public agent image | string | `` | no |
| public_agent_machine_type | public agent machine type | string | `` | no |
| public_agent_public_ssh_key_path | public agent public ssh key path | string | `` | no |
| public_agent_ssh_user | public agent ssh user | string | `` | no |
| public_agents_additional_ports | List of additional ports allowed for public access on public agents (80 and 443 open by default) | list | `<list>` | no |
| tags | Add custom tags to all resources | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap.prereq_id | Returns the ID of the prereq script (if image are not used) |
| bootstrap.private_ip | Bootstrap private ip |
| bootstrap.public_ip | Bootstrap public ip |
| bootstrap.ssh_user | Deployed bootstrap agent SSH user |
| forwarding_rules.masters | Master Google Front End Load Balancer Address |
| forwarding_rules.public_agents | Public Agents Google Front End Load Balancer Address |
| masters.prereq_id | Returns the ID of the prereq script (if image are not used) |
| masters.private_ips | masters private ip |
| masters.public_ips | masters public ip |
| masters.ssh_user | Deployed masters agent SSH user |
| private_agents.prereq_id | Returns the ID of the prereq script (if image are not used) |
| private_agents.private_ips | private_agent private ip |
| private_agents.public_ips | private_agent public ip |
| private_agents.ssh_user | Deployed private agent SSH user |
| public_agents.prereq_id | Returns the ID of the prereq script (if image are not used) |
| public_agents.private_ips | public_agent private ip |
| public_agents.public_ips | public_agent public ip |
| public_agents.ssh_user | Deployed public agent SSH user |

