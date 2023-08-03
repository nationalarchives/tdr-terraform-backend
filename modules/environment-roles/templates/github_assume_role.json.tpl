{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${account_id}:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "ForAnyValue:StringLike": {
          "token.actions.githubusercontent.com:sub": [
            "repo:nationalarchives/tdr-*",
            "repo:nationalarchives/tna-custodian*",
            "repo:nationalarchives/da-reference-generator*"
          ]
        }
      }
    }
  ]
}
