resource "aws_lambda_function" "hello_world" {
    filename         = "${path.module}/lambda-output/hello_world.zip"
    function_name    = "${var.environment}-hello_world"
    role             = aws_iam_role.lambda_exec.arn
    handler          = "index.handler"
    runtime          = "nodejs22.x"
    source_code_hash = filebase64sha256("${path.module}/lambda-output/hello_world.zip")
}

resource "aws_iam_role" "lambda_exec" {
    
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })

}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
    role       = aws_iam_role.lambda_exec.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}