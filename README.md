# Terraform Deploy Nginx on AWS EC2

This project provides Infrastructure as Code (IaC) using **Terraform** to deploy an **Nginx web server** on an **AWS EC2 instance**. It automates the provisioning of networking components, security groups, and compute resources to deliver a ready-to-use web server.

---

## 🚀 Features
- Automated creation of AWS VPC, subnets, and Internet Gateway
- Security group configuration allowing HTTP (port 80) and SSH (port 22)
- EC2 instance deployment with Ubuntu AMI
- User data script to install and configure Nginx
- Outputs for public IP and DNS of the deployed server

---

## ⚙️ Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.0+
- AWS account with programmatic access
- Configured AWS CLI credentials (`~/.aws/credentials`)
- Basic knowledge of Terraform and AWS networking

---

## 🔧 Usage
1. **Clone the repository**
   ```bash
   git clone https://github.com/DevNetMohamed/Terraform_Deploy_Nginx_On_EC2.git
   cd Terraform_Deploy_Nginx_On_EC2

  - terraform init
  - terraform plan
  - terraform apply


