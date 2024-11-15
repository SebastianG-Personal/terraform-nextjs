resource "aws_iam_user" "github_actions" {
  name = "github-actions-deployer-${var.environment}"
}

resource "aws_iam_access_key" "github_actions" {
  user = aws_iam_user.github_actions.name
}

resource "aws_iam_user_policy" "github_actions" {
  name = "github-actions-policy"
  user = aws_iam_user.github_actions.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          # Add other required permissions
        ]
        Resource = "*"
      }
    ]
  })
}