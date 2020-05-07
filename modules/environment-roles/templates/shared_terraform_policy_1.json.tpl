{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "acm",
      "Effect": "Allow",
      "Action" : [
        "acm:ListCertificates",
        "acm:ListCertificates",
        "acm:DescribeCertificate",
        "ec2:AllocateAddress",
        "ec2:AssociateRouteTable",
        "ec2:AttachInternetGateway",
        "ec2:AuthorizeSecurityGroupEgress",
        "ec2:CreateFlowLogs",
        "ec2:CreateInternetGateway",
        "ec2:CreateNatGateway",
        "ec2:CreateNetworkInterface",
        "ec2:CreateRouteTable",
        "ec2:CreateSecurityGroup",
        "ec2:CreateSubnet",
        "ec2:CreateTags",
        "ec2:CreateVpc",
        "ec2:DeleteFlowLogs",
        "ec2:DeleteInternetGateway",
        "ec2:DeleteKeyPair",
        "ec2:DeleteNatGateway",
        "ec2:DeleteNetworkAcl",
        "ec2:DeleteNetworkInterface",
        "ec2:DeleteRoute",
        "ec2:DeleteRouteTable",
        "ec2:DeleteSecurityGroup",
        "ec2:DeleteSubnet",
        "ec2:DeleteVpc",
        "ec2:DescribeAddresses",
        "ec2:DescribeFlowLogs",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeInstanceCreditSpecifications",
        "ec2:DescribeInstances",
        "ec2:DescribeInternetGateways",
        "ec2:DescribeKeyPairs",
        "ec2:DescribeNatGateways",
        "ec2:DescribeNetworkAcls",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeRegions",
        "ec2:DescribeRouteTables",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSubnets",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes",
        "ec2:DescribeVpcAttribute",
        "ec2:DescribeVpcs",
        "ec2:DetachInternetGateway",
        "ec2:DetachNetworkInterface",
        "ec2:DisassociateRouteTable",
        "ec2:ImportKeyPair",
        "ec2:ModifyNetworkInterfaceAttribute",
        "ec2:ModifySubnetAttribute",
        "ec2:ReleaseAddress",
        "ec2:RunInstances",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeAccountAttributes",
        "ecs:CreateCluster",
        "ecs:CreateService",
        "ecs:DeleteCluster",
        "ecs:DeleteService",
        "ecs:DeregisterTaskDefinition",
        "ecs:DescribeClusters",
        "ecs:DescribeContainerInstances",
        "ecs:DescribeServices",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeTasks",
        "ecs:DescribeTaskSets",
        "ecs:ListAccountSettings",
        "ecs:ListAttributes",
        "ecs:ListClusters",
        "ecs:ListContainerInstances",
        "ecs:ListServices",
        "ecs:ListTagsForResource",
        "ecs:ListTaskDefinitionFamilies",
        "ecs:ListTaskDefinitions",
        "ecs:ListTasks",
        "ecs:RegisterTaskDefinition",
        "ecs:TagResource",
        "ecs:UntagResource",
        "ecs:UpdateService",
        "elasticloadbalancing:CreateTargetGroup",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DescribeLoadBalancerAttributes",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DescribeTags",
        "elasticloadbalancing:DescribeTargetGroupAttributes",
        "elasticloadbalancing:DescribeTargetGroups",
        "elasticloadbalancing:DescribeTargetHealth",
        "iam:AttachGroupPolicy",
        "iam:CreateGroup",
        "iam:CreateServiceLinkedRole",
        "iam:DeleteAccountPasswordPolicy",
        "iam:DeleteInstanceProfile",
        "iam:DeleteGroup",
        "iam:DetachGroupPolicy",
        "iam:GetAccountPasswordPolicy",
        "iam:GetGroup",
        "iam:GetGroupPolicy",
        "iam:ListAccountAliases",
        "iam:ListAttachedGroupPolicies",
        "iam:PutRolePolicy",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:UpdateAccountPasswordPolicy",
        "iam:UpdateGroup",
        "logs:DescribeLogGroups",
        "route53:CreateHostedZone",
        "route53:DeleteHostedZone",
        "route53:ListHostedZones",
        "route53:GetHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ChangeTagsForResource",
        "route53:GetChange",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource",
        "route53:UpdateHostedZoneComment"
      ],
      "Resource": "*"
    },
    {
      "Sid": "cloudwatch",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:DeleteLogGroup",
        "logs:DeleteLogStream",
        "logs:DescribeLogStreams",
        "logs:CreateLogGroup",
        "logs:PutRetentionPolicy",
        "logs:ListTagsLogGroup",
        "logs:TagLogGroup"
      ],
      "Resource": "arn:aws:logs:eu-west-2:${account_id}:log-group:*"
    },
    {
      "Sid": "ec2",
      "Effect": "Allow",
      "Action": [
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CreateRoute",
        "ec2:DeleteSecurityGroup",
        "ec2:RevokeSecurityGroupEgress",
        "ec2:RevokeSecurityGroupIngress",
        "ec2:TerminateInstances"
      ],
      "Resource": [
        "arn:aws:ec2:eu-west-2:${account_id}:instance/*",
        "arn:aws:ec2:eu-west-2:${account_id}:route-table/*",
        "arn:aws:ec2:eu-west-2:${account_id}:security-group/*",
        "arn:aws:ec2:eu-west-2:${account_id}:vpc/*"
      ]
    },
    {
      "Sid": "config",
      "Effect": "Allow",
      "Action": [
        "config:DeleteConfigRule",
        "config:DeleteDeliveryChannel",
        "config:DescribeConfigRules",
        "config:DescribeConfigurationRecorders",
        "config:DescribeConfigurationRecorderStatus",
        "config:DescribeDeliveryChannels",
        "config:DescribeDeliveryChannelStatus",
        "config:ListTagsForResource",
        "config:PutConfigRule",
        "config:PutConfigurationRecorder",
        "config:PutDeliveryChannel",
        "config:PutEvaluations",
        "config:PutRetentionConfiguration",
        "config:StartConfigRulesEvaluation",
        "config:StartConfigurationRecorder",
        "config:StopConfigurationRecorder",
        "config:TagResource"
      ],
      "Resource": "*"
    },
    {
      "Sid": "guardduty",
      "Effect": "Allow",
      "Action": [
        "guardduty:CreateDetector",
        "guardduty:CreateIPSet",
        "guardduty:CreateThreatIntelSet",
        "guardduty:DeleteDetector",
        "guardduty:DeleteIPSet",
        "guardduty:GetDetector",
        "guardduty:GetIPSet",
        "guardduty:GetThreatIntelSet",
        "guardduty:ListTagsForResource",
        "guardduty:TagResource",
        "guardduty:UntagResource",
        "guardduty:UpdateIPSet",
        "guardduty:UpdateThreatIntelSet"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ses",
      "Effect": "Allow",
      "Action": [
        "ses:CreateConfigurationSet",
        "ses:DeleteConfigurationSet",
        "ses:DeleteIdentity",
        "ses:DeleteVerifiedEmailAddress",
        "ses:DescribeConfigurationSet",
        "ses:GetIdentityDkimAttributes",
        "ses:GetIdentityVerificationAttributes",
        "ses:SetIdentityDkimEnabled",
        "ses:SetIdentityMailFromDomain",
        "ses:VerifyDomainDkim",
        "ses:VerifyDomainIdentity",
        "ses:VerifyEmailAddress",
        "ses:VerifyEmailIdentity"
      ],
      "Resource": "*"
    },
    {
      "Sid": "sns",
      "Effect": "Allow",
      "Action": [
        "sns:CreateTopic",
        "sns:DeleteTopic",
        "sns:GetTopicAttributes",
        "sns:ListTagsForResource",
        "sns:SetTopicAttributes",
        "sns:TagResource",
        "sns:UntagResource"
      ],
      "Resource": "*"
    },
    {
      "Sid": "sqs",
      "Effect": "Allow",
      "Action": [
        "sqs:CreateQueue",
        "sqs:DeleteQueue",
        "sqs:GetQueueAttributes",
        "sqs:GetQueueUrl",
        "sns:GetSubscriptionAttributes",
        "sqs:ListQueues",
        "sqs:ListQueueTags",
        "sqs:SetQueueAttributes",
        "sns:Subscribe",
        "sqs:TagQueue",
        "sqs:UntagQueue",
        "sns:Unsubscribe"
      ],
      "Resource": "*"
    }
  ]
}
