output "AWS_S3_ID" {
  value = {
    for k, v in module.S3.S3_Bucket : k => v.id
  }
}

output "AWS_VPC_ID" {
  value = {
    for k, v in module.VPC.AWS_VPC : k => v.id
  }
}

output "AWS_SUBNET_ID" {
  value = {
    for k, v in module.VPC.AWS_SUBNET : k => v.id
  }
}

