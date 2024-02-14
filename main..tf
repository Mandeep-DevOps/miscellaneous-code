module "ec2" {
  source        = "./modules/ec2"
  for_each      = var.tools
  tool          = each.key
  instance_type = each.value["instance_type"]
}

