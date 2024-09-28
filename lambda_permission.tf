#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version_permission
resource "aws_lambda_layer_version_permission" "lambda_layer_permission" {
  layer_name      = aws_lambda_layer_version.lambda_layer.layer_arn
  version_number  = aws_lambda_layer_version.lambda_layer.version
  principal       = "*"
  organization_id = var.organization_id
  action          = "lambda:GetLayerVersion"
  statement_id    = "dev-account"
}