variable "project_id" {
    description = "Your Google Cloud project ID"
}
# variable "instance_name" {
#     description = "The name of your instance"
#     default = "Terraform-Instance-${timestamp()}"
# }
variable "zone" {
    default = "us-central1-a"
    description = "The zone where you want your infrastructure to be deployed to"
}
variable "image_id" {
    default = "debian-10-buster-v20200910"
    description = "The ID of the image that you want to use for the boot disk"
}
variable "tezos_ssh_user" {
    description = "The username that you want to use to ssh into the instance with. This is the user that Ansible will use to deploy playbooks with"
}
variable "tezos_ssh_user_public_key" {
    description = "The public key location for the ssh user"
}
# Uncomment this section if you skipped the Packer part
# variable "startup_script_file" {
#     description = "The startup script for the GCP instance"
# }