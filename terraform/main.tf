provider "google" {
  project = var.project_id
  zone = var.zone
}

resource "google_compute_network" "tezos-test-network" {
  name = "tezos-test-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "tezos-test-firewall" {
 name    = "tezos-test-firewall"
 network = google_compute_network.tezos-test-network.name

 allow {
   protocol = "tcp"
   ports    = ["22", "8732", "9732"]
 }
}

resource "google_compute_instance" "tezos-test-instance" {
  name         = "tezos-test-instance"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = var.image_id
    }
  }

  network_interface {
    # You can use the default network here if you prefer
    network = google_compute_network.tezos-test-network.self_link
    
    # The following empty block must be here so that an external IP is created
    access_config {
      
    }
  }

  metadata = {
    ssh-keys = "${var.tezos_ssh_user}:${file(var.tezos_ssh_user_public_key)}"
  }

  # Uncomment below if you skipped the Packer section and what to use a startup script
  # metadata_startup_script = "${file(var.startup_script_file)}"

}