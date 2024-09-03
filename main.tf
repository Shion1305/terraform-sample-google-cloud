resource "google_cloud_run_service" "target" {
  name     = "target-service"
  location = "asia-northeast1"

  template {
    spec {
      containers {
        image = "nginx:latest"
        env {
          name = "VERY_SECRET_KEY"
          value_from {
            secret_key_ref {
              name = data.google_secret_manager_secret.very_secret_key.secret_id
              key  = "latest"
            }
          }
        }
        ports {
          container_port = 80
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
