# The Terraform Section

## Why Terraform?
Terraform is an extremely useful Infrastructure-as-Code that is in many ways platform agnostic. Terraform has many providers including Google Cloud Platform and switching between providers is very useful. Terraform helps us achieve our goal of "one-click" deployments

## Prerequisites
* Terraform [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* The GCP CLI
* A SSH public and private key pair


## Running the Terraform project
1. Make sure you are in the `PROJECT_DIR\terraform\`
2. For input variable you could creae a `.tfvars` file or use the command line variable. Here is an example of a `.tfvars` file called *my-vars.tfvars*:
```text
project_id="PROJECT_ID"
zone="ZONE"
image_id="IMAGE_ID"
tezos_ssh_user="TEZOS_SSH_USER"
tezos_ssh_user_public_key="TEZOS_SSH_USER_PUBLIC_KEY"
```
3. Plan out your Terraform build
```bash
terraform plan -out plan.plan -var-file="my-vars.tfvars"
```
4. Apply your Terraform build
```bash
terraform apply "plan.plan"
```
5. Monitor the build for success and find the instance external IP value at the end as an output e.g. `Outputs: ip = xxx.xxx.xxx.xxx`

### Variables
Required:

* `project_id`: The id of the GCP project that you want to create the image in. 
* `tezos_ssh_user`: This would be the same user that ansible will use
* `tezos_ssh_user_public_key`: The location of the tezos_user public ssh key file e.g. `/home/user/.ssh/id_rsa.pub`

Optional:

* `image_id`: The image name that you want to use. The default is `debian-10-buster-v20200910`

* `zone`: The Zone where you want the image created. This should be the same as the rest of the project and defaults to `us-central1-a`