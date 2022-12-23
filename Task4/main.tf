
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file("glgcp-key.json")

  project = "glgcp-372009"
  region  = "us-west4"
  zone    = "us-west4-b"
}
# Creating Instance
resource "google_compute_instance" "gl-bc-lamp" {
    name = "gl-bc-t4"
    machine_type = "e2-micro"
    tags = ["http-server", "https-server"]

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-10"
		    size = 20
      }
      
    }

    
    metadata_startup_script = file("insScript.sh")

    network_interface {
    network = "default"
    access_config {
    }
  }

}
