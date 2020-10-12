source "googlecompute" "gcp-debian-tezos" {
  project_id = "${var.project_id}"
  source_image_family = "${var.source_image_family}"
  ssh_username = "${var.ssh_username}"
  zone = "${var.zone}"
  image_description = "Image used for Tezos"
  image_name = local.image_name
  # TODO: Optimize disk size and type. This is most likely overkill
  disk_size = 16
  disk_type = "pd-ssd"
  machine_type = "e2-medium"
}

build {
  sources = ["sources.googlecompute.gcp-debian-tezos"]

  provisioner "shell" {
    script       = "packer/scripts/init.sh"
    timeout      = "5m"
  }
}