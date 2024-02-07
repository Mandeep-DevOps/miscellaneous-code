terraform {
  backend "s3" {
    bucket = "d77-terraform"
    key    = "misc/elk/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_instance" "elasticsearch" {
  ami                    = data.aws_ami.centos8.image_id
  instance_type          = "m6in.large"
  vpc_security_group_ids = ["sg-04ce0678d07a32073"]
  subnet_id              = "subnet-045c06bd1fda128d2"

  spot_options {
    instance_interruption_behavior = "stop"
    spot_instance_type             = "persistent"
  }

  tags = {
    Name = "elasticsearch"
  }
}

resource "aws_route53_record" "elasticsearch" {
  zone_id = "Z09059901XRPHNYMGLMJ4"
  name    = "elasticsearch"
  type    = "A"
  ttl     = 30
  records = [aws_instance.elasticsearch.public_ip]
}

