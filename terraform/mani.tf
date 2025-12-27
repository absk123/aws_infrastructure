module "S3" {
  source = "git::ssh://git@github.com/absk123/aws_module.git//aws_s3?ref=main"
  s3 = var.s3
  tags = var.tags
}