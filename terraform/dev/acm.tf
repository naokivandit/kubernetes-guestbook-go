# resource "aws_acm_certificate" "example" {
#   domain_name       = "vue-rails.com"
#   validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }