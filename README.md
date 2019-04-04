[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-infrastructure/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-infrastructure/job/master/)

# DC/OS GCP Infrastucture

This module creates typical DS/OS infrastructure in GCP.

## EXAMPLE

```hcl
module "dcos-infrastructure" {
  source  = "dcos-terraform/infrastructure/gcp"
  version = "~> 0.2.0"

  infra_public_ssh_key_path = "~/.ssh/id_rsa.pub"

  num_masters = "3"
  num_private_agents = "2"
  num_public_agents = "1"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_ips | List of CIDR admin IPs | list | n/a | yes |
| agent\_cidr\_range | Agent CIDR Range | string | `"10.65.0.0/16"` | no |
| bootstrap\_dcos\_instance\_os | Bootstrap node tested OSes image | string | `""` | no |
| bootstrap\_disk\_size | Bootstrap node disk size (gb) | string | `""` | no |
| bootstrap\_disk\_type | Bootstrap node disk type. | string | `""` | no |
| bootstrap\_image | [BOOTSTRAP] Image to be used | string | `""` | no |
| bootstrap\_machine\_type | [BOOTSTRAP] Machine type | string | `""` | no |
| bootstrap\_public\_ssh\_key\_path | Bootstrap Node Public SSH Key | string | `""` | no |
| bootstrap\_ssh\_user | Bootstrap node SSH User | string | `""` | no |
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| dcos\_version | Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list. | string | `"1.11.4"` | no |
| infra\_dcos\_instance\_os | Global Infra Tested OSes Image | string | `"coreos_1576.5.0"` | no |
| infra\_disk\_size | Global Infra Disk Size | string | `"128"` | no |
| infra\_disk\_type | Global Infra Disk Type | string | `"pd-ssd"` | no |
| infra\_machine\_type | Global Infra Machine Type | string | `"n1-standard-8"` | no |
| infra\_public\_ssh\_key\_path | Global Infra Public SSH Key | string | n/a | yes |
| infra\_ssh\_user | Global Infra SSH User | string | `""` | no |
| labels | Add custom labels to all resources | map | `<map>` | no |
| master\_cidr\_range | Master CIDR Range | string | `"10.64.0.0/16"` | no |
| master\_dcos\_instance\_os | Master node tested OSes image | string | `""` | no |
| master\_disk\_size | Master node disk size (gb) | string | `""` | no |
| master\_disk\_type | Master node disk type. | string | `""` | no |
| master\_image | Master node OS image | string | `""` | no |
| master\_machine\_type | Master node machine type | string | `""` | no |
| master\_public\_ssh\_key\_path | Master node Public SSH Key | string | `""` | no |
| master\_ssh\_user | Master node SSH User | string | `""` | no |
| num\_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | `"3"` | no |
| num\_private\_agents | Specify the amount of private agents. These agents will provide your main resources | string | `"1"` | no |
| num\_public\_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | `"1"` | no |
| private\_agent\_dcos\_instance\_os | Private agent node tested OSes image | string | `""` | no |
| private\_agent\_disk\_size | Private agent node disk size (gb) | string | `""` | no |
| private\_agent\_disk\_type | Private agent node disk type. | string | `""` | no |
| private\_agent\_image | Private agent node OS image | string | `""` | no |
| private\_agent\_machine\_type | Private agent node machine type | string | `""` | no |
| private\_agent\_public\_ssh\_key\_path | Private Agent node Public SSH Key | string | `""` | no |
| private\_agent\_ssh\_user | Private Agent node SSH User | string | `""` | no |
| public\_agent\_dcos\_instance\_os | Public Agent node tested OSes image | string | `""` | no |
| public\_agent\_disk\_size | Public agent disk size (gb) | string | `""` | no |
| public\_agent\_disk\_type | Public agent node disk type. | string | `""` | no |
| public\_agent\_image | Public agent node OS image | string | `""` | no |
| public\_agent\_machine\_type | Public agent machine type | string | `""` | no |
| public\_agent\_public\_ssh\_key\_path | Public Agent node Public SSH Key | string | `""` | no |
| public\_agent\_ssh\_user | Public Agent node SSH User | string | `""` | no |
| public\_agents\_additional\_ports | List of additional ports allowed for public access on public agents (80 and 443 open by default) | list | `<list>` | no |
| tags | Add custom tags to all resources | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap.os\_user | Bootstrap node SSH User |
| bootstrap.prereq-id | Returns the ID of the prereq script (if image are not used) |
| bootstrap.private\_ip | Private IP of the bootstrap instance |
| bootstrap.public\_ip | Public IP of the bootstrap instance |
| forwarding\_rules.masters | Master Forwarding Rules |
| forwarding\_rules.public\_agents | Public Agent Forwarding Rules |
| masters.os\_user | Deployed masters agent SSH user |
| masters.prereq-id | Returns the ID of the prereq script for masters (if user_data or ami are not used) |
| masters.private\_ips | Master instances private IPs |
| masters.public\_ips | Master instances public IPs |
| private\_agents.os\_user | Deployed private agent SSH user |
| private\_agents.prereq-id | Returns the ID of the prereq script for private agents (if image are not used) |
| private\_agents.private\_ips | Private Agent instances private IPs |
| private\_agents.public\_ips | Private Agent public IPs |
| public\_agents.os\_user | Deployed public agent SSH user |
| public\_agents.prereq-id | Returns the ID of the prereq script for public agents (if image are not used) |
| public\_agents.private\_ips | Public Agent instances private IPs |
| public\_agents.public\_ips | Public Agent public IPs |

