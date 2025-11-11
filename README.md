```markdown
# 🚀 Deploy Azure Storage using Terraform & GitHub Actions

This mini project automates the provisioning of an **Azure Storage Account** using **Terraform Cloud** and **GitHub Actions CI/CD pipeline**.  
It leverages a **private Terraform module** to ensure reusable, consistent, and secure deployments.

---

## 📁 Project Structure

```
Deploy-Azure-Storage/
├── .github/
│ └── workflows/
│ └── azure-storage.yml
├── main.tf
├── variables.tf
├── outputs.tf
├── version.tf
├── provider.tf
└── README.md

````

---

## 🧩 Project Overview

This project:
- Uses a **Terraform Private Registry module** for deploying Azure Storage Accounts.
- Automatically runs **Terraform Plan** on feature branches.
- Creates a **Pull Request** when plan succeeds.
- Executes **Terraform Apply** on `main` branch merge or push.
- Runs Terraform on **self-hosted GitHub runners** for full control and reliability.

---

## ⚙️ Prerequisites

Before using this workflow, configure:

### 🔑 GitHub Secrets
| Secret Name | Description |
|--------------|-------------|
| `ARM_CLIENT_ID` | Azure Service Principal App ID |
| `ARM_CLIENT_SECRET` | Azure Service Principal Secret |
| `ARM_SUBSCRIPTION_ID` | Azure Subscription ID |
| `ARM_TENANT_ID` | Azure Tenant ID |
| `TFC_API_TOKEN` | Terraform Cloud API Token |
| `GH_PAT` | GitHub Personal Access Token (for PR creation) |

### ☁️ Terraform Cloud Configuration
- **Organization:** `xxxxxxxxxxx`  
- **Workspace:** `azure-storage-deploy-workspace`  
Linked to this repository with remote backend enabled.

---

## 🧪 Workflow Logic

| Branch      | Action          | Description                                      |
| ----------- | --------------- | ------------------------------------------------ |
| `feature/*` | Terraform Plan  | Runs a dry-run to preview infrastructure changes |
| `feature/*` | PR Creation     | Automatically creates a PR to merge into `main`  |
| `main`      | Terraform Apply | Executes apply after PR merge or direct push     |

---

## 🧭 How to Use

### Step 1: Clone Repository

```bash
git clone https://github.com/<your-org>/deploy-azure-storage.git
cd deploy-azure-storage
```

### Step 2: Create a Feature Branch

```bash
git checkout -b feature/add-storage
```

### Step 3: Modify Variables (if needed)

Edit `variables.tf` to update location, prefix, or replication type.

### Step 4: Push Changes

```bash
git add .
git commit -m "Updated storage configuration"
git push origin feature/add-storage
```

This triggers:

* **Terraform Plan**
* **Automatic PR Creation**
* **Reviewer Assignment**

### Step 5: Merge PR

Once merged into `main`, the workflow automatically runs **Terraform Apply** to deploy changes.

---

## 🧾 Outputs

After successful deployment:

* `storage_account_name` → Generated unique name
* `resource_group_name` → Associated resource group

Outputs are available in:

* Terraform Cloud Workspace → **Outputs Tab**

---

## 🧹 Destroy Resources

To remove deployed resources:

```bash
terraform destroy -auto-approve
```

(Or manually destroy via Terraform Cloud.)

---

## 🧘 Summary

| Component             | Purpose                                                |
| --------------------- | ------------------------------------------------------ |
| **CI/CD**             | GitHub Actions for Plan & Apply                        |
| **Terraform Backend** | Terraform Cloud Workspace                              |
| **Infrastructure**    | Azure Storage Account via Private Module               |
| **Security**          | Managed using GitHub Encrypted Secrets                 |
| **Automation**        | PR creation, reviewer assignment, and apply automation |

---

```
