source "googlecompute" "gcp-debian-tezos" {
  project_id = "personal-testing-ecad"
  source_image_family = "debian-10"
  image_family = "debian-10"
  ssh_username = "gimbrailo"
  zone = "us-central1-a"
  image_description = "Debian image used for Tezos"
  image_name = "debian-10-buster-tezos"
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