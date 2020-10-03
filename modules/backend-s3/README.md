# Backend S3 Module

This terraform module creates an `S3` **bucket** to be used as a *remote backend* for Terraform. It also creates a `DynamoDB` **table** to be used for *locking*.

---

## Why Amazon S3 as a Remote Backend?

Amazon S3 is typically the best bet as a remote backend for the following reasons:

1. It's a **managed service**, so you don't have to deploy and manage extra infrastructure to use it.

2. It's designed for **99.999999999% durability** and **99.99% availability**, which means you don't have to worry too much about data loss or outages.

3. It supports **encryption**, the data will be encrypted at rest (S3 supports server-side encryption using AES-256) and in transit (Terraform uses SSL to read and write data in S3).

4. It supports **locking** via `DynamoDB`.

5. It supports **versioning**, so every revision of your state file is stored, and you can roll back to an older version if something goes wrong.

6. It's **inexpensive**.

---

## How do you use this module?

The module works by deploying an `S3` **Bucket** that acts as a remote backend for Terraform. This module also creates a `DynamoDB` **table** to be used for locking.

```tf
module "backend_s3" {
  # Use version v1.0.0 of the backend-s3 module
  source = "git::git@github.com/crowdanalyzer/terraform-aws-backend//modules/backend-s3?ref=v1.0.0"

  name = "..."
}
```

Note the following parameters:

- `source`: Use this parameter to specify the URL of this module. The double slash `//` is intentional and required. Terraform uses it to specify subfolders within a Git repo. The `ref` parameter specifies a specific Git tag in this repo. That way, instead of using the latest version of this module from the master branch, which will change every time you run Terraform, you're using a fixed version of the repo.

- `name`: The name that should be used in both the s3 bucket and dynamodb table.

---

### References

1. [How to manage Terraform state](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa)
