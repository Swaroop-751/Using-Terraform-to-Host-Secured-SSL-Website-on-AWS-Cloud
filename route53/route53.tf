data "aws_route53_zone" "route53_zone" {
  name = "traveler.ga"
  private_zone = false
}

resource "aws_route53_record" "route53_record" {
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  name    = "lb"
  type    = "CNAME"
  ttl     = "300"
  records   = [ "test-lb-tf-241407042.ap-south-1.elb.amazonaws.com" ] 
} 

