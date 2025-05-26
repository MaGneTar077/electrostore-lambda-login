# Región AWS
variable "aws_region" {
    description = "Región de AWS"
    default     = "us-west-1"
}

# =======================
# LAMBDA - USUARIOS
# =======================
variable "user_lambda_name" {
    default = "user-lambda-login"
}

variable "user_lambda_zip" {
    default = "../lambda/login.zip" # Ruta al ZIP que tendrá tu Lambda de usuario
}

variable "user_lambda_handler" {
    default = "handler.handler"
}

variable "user_api_path" {
    default = "usuarios/{proxy+}"
}

# =======================
# API Gateway Stage
# =======================
variable "api_env_stage_name" {
    default = "dev"
}

# =======================
# Runtime para Lambdas 
# =======================
variable "lambda_runtime" {
    default = "nodejs22.x"
}