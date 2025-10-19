# 🌐 AWS Infrastructure with Terraform

## 🎯 Overview  
This project defines a **secure, cost-efficient, and high-performance AWS infrastructure** using Terraform.  
It’s fully modular — separating **VPC**, **Subnets**, and **Routing** configurations to ensure scalability, clarity, and operational safety.

> **Design Principles:**  
> - 🔒 **Security-first:** Network isolation and least-privilege routing.  
> - 💰 **Cost optimization:** Efficient use of resources to avoid overprovisioning.  
> - ⚡ **Performance-oriented:** Multi-AZ subnet design for high availability and low latency.

---

**Components:**
- **VPC:** Core virtual network with DNS support enabled.  
- **Subnets:** Public and private subnets distributed across multiple Availability Zones.  
- **Internet Gateway:** Provides internet access for public resources.  
- **NAT Gateway:** Allows private subnets to access the internet securely.  
- **Routing Tables:** Configured and automatically associated with the correct subnets.

---

## ⚙️ Modules

### 🔹 VPC Module  
Creates the main Virtual Private Cloud and defines core CIDR range, DNS, and network-level properties.

### 🔹 Subnets Module  
Defines **public** and **private** subnets across multiple AZs for high availability and fault tolerance.  
Follows a **structured IP addressing scheme** to simplify expansion.

### 🔹 Routing Module  
Manages route tables and associations with public/private subnets.  
Implements **least privilege routing** to ensure each subnet only has necessary connectivity.

---

## 🚀 Usage

```bash
# Initialize Terraform
terraform init

# Review plan before applying
terraform plan

# Apply the configuration
terraform apply
# 🌐 AWS Network Infrastructure with Terraform

This project provides a **modular, secure, and cost-efficient AWS network foundation** built using Terraform.  
It’s designed to support workloads such as **EKS**, **EC2**, or **Fargate**, while ensuring best practices in **security**, **performance**, and **scalability**.

---

## 🔒 Security Considerations

- **Private subnets** are not exposed to the public internet.  
- **NAT Gateway** enables controlled outbound traffic.  
- **Routing and subnet segregation** minimize lateral movement risk.  
- **DNS and IP ranges** are strictly defined to prevent misconfiguration.

---

## 💰 Cost Efficiency

- Focused on **minimal required components** to maintain low cost.  
- **Modular architecture** allows scaling or removal of specific layers as needed.  
- Uses **Terraform outputs** to simplify cost visibility and impact tracking.

---

## ⚡ Performance Focus

- Subnets are **distributed across multiple Availability Zones**.  
- Designed for seamless integration with **EKS**, **EC2**, or **Fargate** workloads.  
- Optimized **routing path** minimizes latency and improves reliability.

---

## 📦 Future Enhancements

- 🔄 Add **EKS Auto Mode** for containerized workloads.  
- 🛡️ Implement **Security Groups**, **NACLs**, and **GuardDuty** integration.  
- ☁️ Use **S3 backend** and **DynamoDB** for Terraform state management.  
- 📊 Integrate **CloudWatch dashboards** for network performance visibility.

---

## 👩‍💻 Author

**Sara Iravani**  
DevOps Engineer | Kubernetes & Cloud Infrastructure  

🔗 [LinkedIn Profile](#)

---

## 🏁 Summary

This project demonstrates the ability to design a **modular, secure, and cost-effective AWS environment** using **Terraform** —  
a foundation that can easily evolve into a **full Kubernetes or CI/CD-ready infrastructure**.

---



