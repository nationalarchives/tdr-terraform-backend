import {
  to = module.account_key.aws_kms_key.encryption
  id = "44bc6f1f-ef3f-4d68-879d-607dd7d2f5ca"
}

import {
  to = module.account_key.aws_kms_alias.encryption
  id = "alias/tdr-account-mgmt"
}

import {
  to = module.account_key_intg.aws_kms_key.encryption
  id = "d468d807-0a24-4ac7-aa0c-1e158bb627ae"
}

import {
  to = module.account_key_intg.aws_kms_alias.encryption
  id = "alias/tdr-account-intg"
}

import {
  to = module.account_key_staging.aws_kms_key.encryption
  id = "89f90a27-f7b4-400b-aa34-7aaf479a58dd"
}

import {
  to = module.account_key_staging.aws_kms_alias.encryption
  id = "alias/tdr-account-staging"
}

import {
  to = module.account_key_prod.aws_kms_key.encryption
  id = "94daa040-886d-4bfb-ab38-cc8630890efc"
}

import {
  to = module.account_key_prod.aws_kms_alias.encryption
  id = "alias/tdr-account-prod"
}

import {
  to = module.iam_group.aws_iam_account_password_policy.cis_benchmark[0]
  id = "iam-account-password-policy"
}

import {
  to = module.iam_group.aws_iam_group.support[0]
  id = "support"
}

import {
  to = module.iam_group.aws_iam_group_policy_attachment.support_policy_attach[0]
  id = "support/arn:aws:iam::aws:policy/AWSSupportAccess"
}
