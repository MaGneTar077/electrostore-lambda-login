# Usa DATA para referenciar el API Gateway existente
data "aws_apigatewayv2_api" "existing_api" {
    api_id = "dsjajr6j2l"  
}

# INTEGRACIÓN para login (usa Lambda user_login)
resource "aws_apigatewayv2_integration" "login_integration" {
    api_id                 = data.aws_apigatewayv2_api.existing_api.id  # Cambiado
    integration_type       = "AWS_PROXY"
    integration_uri        = aws_lambda_function.user_login.invoke_arn
    integration_method     = "POST"
    payload_format_version = "2.0"
}

# RUTA para login: POST /login
resource "aws_apigatewayv2_route" "login_route" {
    api_id    = data.aws_apigatewayv2_api.existing_api.id  # Cambiado
    route_key = "POST /login"
    target    = "integrations/${aws_apigatewayv2_integration.login_integration.id}"
}

# STAGE (usualmente "dev")
resource "aws_apigatewayv2_stage" "dev" {
    api_id      = data.aws_apigatewayv2_api.existing_api.id  # Cambiado
    name        = var.api_env_stage_name
    auto_deploy = true
}

# PERMISO para que API Gateway invoque la Lambda
resource "aws_lambda_permission" "apigw_lambda_login" {
    statement_id  = "AllowExecutionFromAPIGatewayLogin"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.user_login.function_name
    principal     = "apigateway.amazonaws.com"
    source_arn    = "${data.aws_apigatewayv2_api.existing_api.execution_arn}/*/*"  # Cambiado
}

# Salida con la URL base del API
output "api_url" {
    value = "https://${data.aws_apigatewayv2_api.existing_api.api_endpoint}/${aws_apigatewayv2_stage.dev.name}"  # Cambiado
}