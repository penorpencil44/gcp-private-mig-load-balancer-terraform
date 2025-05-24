# https://developer.hashicorp.com/terraform/language/values/outputs

output "mylb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = google_compute_address.lb.address
}

# https://developer.hashicorp.com/terraform/language/functions/join
output "compute_zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value       = join(", ", data.google_compute_zones.available.names)
}

