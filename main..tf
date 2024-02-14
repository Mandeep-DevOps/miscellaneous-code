module "ec2" {
  source        = "./modules/ec2"
  for_each      = var.tools
  tool          = each.key
  instance_type = each.value["instance_type"]
  dns_name      = module.alb.dns_name
  listener_arn  = module.alb.listener
  port          = each.value["port"]
  priority      = each.value["priority"]
  dns_names     = each.value["dns_names"]
}

module "alb" {
  source = "./modules/alb"
}

