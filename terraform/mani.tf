module "S3" {
  source = "git::ssh://git@github.com/absk123/aws_module.git//aws_s3?ref=main"
  s3     = var.s3
  tags   = var.tags
}

module "VPC" {
  source = "git::ssh://git@github.com/absk123/aws_module.git//aws_vpc?ref=main"
  net    = var.net
  tags   = var.tags
}

module "NLB" {
  source = "git::ssh://git@github.com/absk123/aws_module.git//aws_elb?ref=main"
  nlb    = var.nlb
  sbnet  = module.VPC.AWS_SUBNET
  tags   = var.tags
}