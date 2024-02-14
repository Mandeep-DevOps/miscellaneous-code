resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.centos8.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["sg-04ce0678d07a32073"]
  subnet_id              = "subnet-045c06bd1fda128d2"

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }


  tags = {
    Name = var.tool
  }
}

resource "aws_route53_record" "record" {
  count   = length(var.dns_names)
  zone_id = "Z09059901XRPHNYMGLMJ4"
  name    = element(var.dns_names, count.index)
  type    = "CNAME"
  ttl     = 30
  records = [var.dns_name]
}

resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    host_header {
      values = ["${var.tool}.rdevopsb73.online"]
    }
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.tool}-tg"
  port     = var.port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.ec2.id
  port             = var.port
}
