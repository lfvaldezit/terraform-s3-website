terraform {
  required_providers {
        cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }

  }
}

resource "cloudflare_record" "this" {
  for_each = { for key, site in var.record_name : key => site }
  zone_id = var.zone_id
  name = each.value.subdomain
  type = var.record_type
  content = var.record_content
  proxied = false
}