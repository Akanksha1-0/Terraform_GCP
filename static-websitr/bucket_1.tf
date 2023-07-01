resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket97"
  location      = "US"
  force_destroy = true
  

  
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

 
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.auto-expire.name
  role   = "READER"
  entity = "allUsers"
}