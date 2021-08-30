# iam.tf

resource "aws_iam_role" "iam_for_lambda" {
  name               = "${var.project}-${var.environment}-lambda-iamrole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "${var.project}-${var.environment}-iamrole-policy"
  path        = "/"
  description = "lambda dynamodb access iam policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:*",
        "cloudwatch:*",
        "events:*"
      ],
      "Resource": "*"
    },
    {
        "Sid": "Invoke",
        "Effect": "Allow",
        "Action": [
            "lambda:InvokeFunction"
        ],
        "Resource": aws_lambda_function.translate.arn,
        "Condition": {
            "StringEquals": {
                "lambda:Principal": "lex.amazonaws.com"
            }
        }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.policy.arn
}

# https://aws.amazon.com/blogs/security/how-to-create-an-aws-iam-policy-to-grant-aws-lambda-access-to-an-amazon-dynamodb-table/
