#  AWS Glue Jobs & VPC Subnets Audit Script

This project provides a Bash-based audit tool to list all AWS Glue Jobs and VPC Subnets across specified regions. It is designed for DevOps/cloud engineers to validate infrastructure state and integrate this check as part of their CI/CD pipelines.

---

## 📁 Features

- ✅ Lists all AWS Glue Jobs by region
- ✅ Lists all VPC Subnets with Name tags and CIDRs
- ✅ Counts total resources in each region
- ✅ Outputs readable audit summaries
- ✅ Integrates easily with GitHub Actions for CI/CD

---

## ⚙️ Prerequisites

- AWS CLI must be installed and configured locally or in CI
- Proper IAM permissions to run `glue list-jobs` and `ec2 describe-subnets`
- GitHub repo with Actions enabled (optional for automation)

---

## 🚀 Usage

### 🔧 Local Execution

1. Clone the repo:
    ```bash
    git clone https://github.com/your-username/aws-audit-scripts.git
    cd aws-audit-scripts
    ```

2. Run the audit:
    ```bash
    bash audit-glue-subnets.sh
    ```

3. Edit the regions inside the script if needed:
    ```bash
    REGIONS=("us-east-1" "us-west-2" "ap-south-1")
    ```

---

##  GitHub Actions Integration

You can run this audit as part of your GitHub pipeline:

###  `.github/workflows/aws-audit.yml`



Sample Output

🔍 Auditing Glue Jobs in region: us-east-1
job-1
job-2
📊 Total Glue Jobs in us-east-1: 2
------------------------------------------------------------
🔍 Auditing Subnets in region: us-east-1
- app-subnet (CIDR: 10.0.1.0/24)
- db-subnet (CIDR: 10.0.2.0/24)
📊 Total Subnets in us-east-1: 2
------------------------------------------------------------

👩‍💻 Author
Prachi – DevOps Engineer AWS | Kubernetes | Terraform | Python | Docker
🔗 [LinkedIn: https://www.linkedin.com/in/prachi-panchal-/ ]

