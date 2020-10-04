# Terraform AWS Backend

![CircleCI](https://circleci.com/gh/crowdanalyzer/terraform-aws-backend.svg?style=shield&circle-token=5e1fc7f41c3927b426efbc7471dda0a93a9bdcb8)

This repo contains the **[backend-s3](./modules/backend-s3/)** module. It creates an `S3` **bucket** to be used as a *remote backend* for Terraform. It also creates a `DynamoDB` **table** to be used for *locking*.

---

## What is a Terraform backend?

A *Terraform backend* determines how Terraform **loads** and **stores** *state*.

A terraform state file `terraform.tfstate` is used by Terraform to record information about what infrastructure it created. The terraform state file contains a custom JSON format that records a mapping from a **Terraform resource** in your *templates* to the representation of that **resource** in the **real world**. Using this simple JSON format, Terraform knows that, for example, a resource with type `aws_instance` and name `instance` corresponds to an `EC2 instance` in your aws account with ID `i-00d689a0acc43af0f`. Everytime you run terraform, it can fetch the latest status of this EC2 instance from AWS and compare that to what's in your terraform configurations to determine what changes need to be applied. In other words, the output of the `plan` command is a **diff** between *the code on your computer* and the *infrastructure deployed in the real world*, as discovered via IDs in the state file.

The *default* backend is the *local* backend, which stores the state file on your local disk. **Remote backends** allow you to store the state file in a remote, shared store. A number of remote backends are supported, including Amazon S3, Azure Storage, Google Cloud Storage, and HashiCorp’s Terraform Pro and Terraform Enterprise.

Once you configure a remote backend, Terraform will **automatically** *load the state file* from that backend every time you run `plan` or `apply` and it'll automatically *store the state file* in that backend after each `apply`, so there’s no chance of manual error.

Most of the remote backends natively **support locking**. To run terraform `apply`, Terraform will **automatically** *acquire a lock*; if *someone else* is *already running* `apply`, they will already *have the lock*, and you will *have to wait*.

Most of the remote backends natively support **encryption** *in transit* and encryption *on disk* of the state file.

---

## How do you use a module?

To use a module in your Terraform templates, create a `module` resource and sets its `source` field to the Git url of this repo. You should also set the `ref` parameter so you are fixed to a specific version of this repo, for example to use `v1.0.0` of the `backend-s3` module, you should add the following:

```tf
module "backend_s3" {
    source = "git::git@github.com:crowdanalyzer/terraform-aws-backend//modules/backend-s3?ref=v1.0.0"

    # set the parameters for the backend-s3 module
}
```

**Note**: the double slash `//` is intentional and required. It is part of Terraform's Git syntax. See the module documentation and `variables.tf` file for all the parameters you can set. Run `terraform init` to pull the latest version of this module from this repo before running the standard `terraform apply` command.

---
