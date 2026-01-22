output "hostname" {
  description = "The FQDN of the records"
  value = { for key, record in cloudflare_record.this : key => record.hostname }
}