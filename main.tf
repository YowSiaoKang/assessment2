resource "google_storage_bucket" "function_bucket" {
  name     = "govtech-code-bucket"
  location = "us-central1"
}

resource "google_storage_bucket_object" "source_code" {
  name   = "cloud_function"
  bucket = google_storage_bucket.function_bucket.name
  source = "function.zip"
}

resource "google_cloudfunctions_function" "function" {
  name    = "my_cloud_function"
  runtime = "nodejs20"

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.source_code.name

  trigger_http = true
  entry_point  = "getJsonList"
}

resource "google_cloudfunctions_function_iam_member" "allow_access" {
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}