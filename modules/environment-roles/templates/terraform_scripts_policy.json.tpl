{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "iam:AddRoleToInstanceProfile",
        "iam:AttachRolePolicy",
        "iam:CreateInstanceProfile",
        "iam:CreatePolicy",
        "iam:CreatePolicyVersion",
        "iam:CreateRole",
        "iam:DeleteInstanceProfile",
        "iam:DeletePolicy",
        "iam:DeletePolicyVersion",
        "iam:DeleteRole",
        "iam:DetachRolePolicy",
        "iam:GetInstanceProfile",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetRole",
        "iam:ListAttachedRolePolicies",
        "iam:ListInstanceProfilesForRole",
        "iam:ListPolicyVersions",
        "iam:PassRole",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:TagRole",
        "kms:CreateAlias",
        "kms:CreateGrant",
        "kms:Decrypt",
        "kms:DeleteAlias",
        "kms:DescribeKey",
        "kms:DescribeKey*",
        "kms:EnableKey",
        "kms:EnableKeyRotation",
        "kms:Encrypt",
        "kms:GenerateDataKey*",
        "kms:GetKeyPolicy",
        "kms:GetKeyRotationStatus",
        "kms:ListGrants",
        "kms:ListKeyPolicies",
        "kms:ListResourceTags",
        "kms:ListRetirableGrants",
        "kms:PutKeyPolicy",
        "kms:ReEncrypt*",
        "kms:RevokeGrant",
        "kms:ScheduleKeyDeletion",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:UpdateAlias",
        "kms:UpdateKeyDescription",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:DeleteLogGroup",
        "logs:DeleteLogStream",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:ListTagsLogGroup",
        "logs:PutRetentionPolicy",
        "logs:TagLogGroup",
        "s3:GetObject",
        "s3:PutObject",
        "ssm:GetParameter"
      ],
      "Resource": [
        "arn:aws:dynamodb:eu-west-2:${account_id}:table/tdr-terraform-state-lock-scripts",
        "arn:aws:iam::${account_id}:instance-profile/bastion",
        "arn:aws:iam::${account_id}:role/BastionEC2Role${title_environment}",
        "arn:aws:kms:eu-west-2:${account_id}:alias/tdr-bastion-encryption-${environment}",
        "arn:aws:kms:eu-west-2:${account_id}:key/*",
        "arn:aws:s3:::tdr-terraform-state-scripts/*",
        "arn:aws:ssm:eu-west-2:${account_id}:parameter/${environment}/consignmentapi/database/password",
        "arn:aws:ssm:eu-west-2:${account_id}:parameter/${environment}/consignmentapi/database/url",
        "arn:aws:ssm:eu-west-2:${account_id}:parameter/${environment}/consignmentapi/database/username",
        "arn:aws:ssm:eu-west-2:${account_id}:parameter/mgmt/cost_centre",
        "arn:aws:iam::${account_id}:policy/BastionEC2Policy${title_environment}",
        "arn:aws:logs:eu-west-2:${account_id}:log-group:*"
      ]
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CopyImage",
        "ec2:CreateTags",
        "ec2:DeleteKeyPair",
        "ec2:DeleteSnapshot",
        "ec2:DeregisterImage",
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeIamInstanceProfileAssociations",
        "ec2:DescribeImages",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeInstanceCreditSpecifications",
        "ec2:DescribeInstances",
        "ec2:DescribeKeyPairs",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSubnets",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes",
        "ec2:DescribeVpcs",
        "ec2:ImportKeyPair",
        "ec2:RevokeSecurityGroupIngress",
        "ec2:RunInstances",
        "ec2:TerminateInstances",
        "kms:CreateKey",
        "kms:ListAliases",
        "kms:ListKeys",
        "s3:ListObjects",
        "sts:GetCallerIdentity"
      ],
      "Resource": "*"
    }
  ]
}