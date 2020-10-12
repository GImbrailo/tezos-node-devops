variable "project_id" {}
variable "ssh_username" {
    # TODO: Remove later
    default = "gimbrailo"
}
variable "source_image_family" {
    default = "debian-10"
}
variable "zone" {
  default = "us-central1-a"
}

locals {
  image_name = "tezos-{{timestamp}}-${var.source_image_family}"
}
