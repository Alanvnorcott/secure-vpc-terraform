# Secure VPC with EC2 —-> Practicing Terraform Infrastructure as Code

## Overview
This Terraform project provisions a **production-baseline secure AWS infrastructure** with:
- **VPC** with public and private subnets across 2 Availability Zones
- **Internet Gateway** for public internet access
- **Security Groups** with least-privilege ingress rules (SSH + HTTP only)
- **IAM Role** for EC2 with Systems Manager access (secure remote management)
- **EC2 Instance** in public subnet running Apache web server

## Architecture Diagram

Internet
|
v
Internet Gateway (IGW)
|
v
Public Route Table (0.0.0.0/0 -> IGW)
|
v
Public Subnet (10.0.1.0/24)
|
v
EC2 Instance + Security Group

Inbound: SSH (22), HTTP (80)

Outbound: All traffic allowed


## Services Used
- **AWS VPC**: Virtual Private Cloud for network isolation
- **AWS EC2**: Compute instance (t2.micro, free tier eligible)
- **AWS IAM**: Role-based access control
- **AWS Security Groups**: Stateful firewall rules
- **AWS Systems Manager**: Session Manager for secure SSH-less access

## Prerequisites
1. AWS Account with credentials configured locally:
2. Terraform installed (>= 1.0): https://www.terraform.io/downloads.html
3. Git (to clone and version this project)

## Quick Start
Clone this repo
git clone <your-repo-url>
cd secure-vpc-terraform

Initialize Terraform (downloads AWS provider)
terraform init

Review planned changes (free-tier safe)
terraform plan

Apply infrastructure (creates VPC, EC2, etc.)
terraform apply

View outputs (EC2 public IP, VPC ID, etc.)
terraform output

Connect to EC2 via AWS Systems Manager
aws ssm start-session --target <instance-id>

## Cleanup (Important: Avoid Unwanted AWS Charges)

## Key Learning Points
- **Infrastructure as Code**: Define cloud resources in version-controlled `.tf` files
- **Least Privilege**: Security group restricts inbound to only necessary ports
- **Modular Variables**: Easy to change CIDR blocks, regions, and instance types
- **IAM Roles**: EC2 assumes a role instead of embedding credentials
- **Systems Manager Integration**: Secure terminal access without SSH key management

## Challenges Solved
- **SSH Key Management**: Avoided by using IAM + Systems Manager Session Manager
- **Security Group Rules**: Restricted ingress to minimize attack surface
- **Multi-AZ Deployment**: Subnets span 2 AZs for high-availability readiness

## Next Steps (Improvements)
- [ ] Add NAT Gateway for private subnet outbound access
- [ ] Implement auto-scaling with Launch Templates
- [ ] Add CloudWatch monitoring and alarms
- [ ] Enable VPC Flow Logs for security auditing

## Author
Alan Norcott | Cloud Engineer in Progress | [GitHub](https://github.com/Alanvnorcott) | [LinkedIn](https://www.linkedin.com/in/alannorcott)

## License
MIT

## Useful Resources
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Free Tier Eligible Services](https://aws.amazon.com/free/)
