resource "aws_s3_bucket" "tdr_terraform_state" {
  bucket = "tdr-terraform-state"
  acl    = "private"

  tags = merge(
    var.common_tags,
    map(
      "Name", "TDR Terraform State",
    )
  )
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.tdr_terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_ssm_parameter" "tdr_terraform_state" {
  name  = "/tdr/TDR_TERRAFORM_STATE_BUCKET"
  type  = "String"
  value = aws_s3_bucket.tdr_terraform_state.id

  tags = merge(
    var.common_tags,
    map(
      "Name", "TDR Terraform State Bucket Parameter",
    )
  )
}
