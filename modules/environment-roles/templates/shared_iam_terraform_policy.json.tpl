{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "iam",
      "Effect": "Allow",
      "Action": [
        "iam:*"
      ],
      "Resource": [
        "arn:aws:iam::${account_id}:group/group/security-audit",
        "arn:aws:iam::${account_id}:group/group/support",
        "arn:aws:iam::${account_id}:oidc-provider/token.actions.githubusercontent.com",
        "arn:aws:iam::${account_id}:policy/consignmentapi_ecs_execution_policy_${environment}",
        "arn:aws:iam::${account_id}:policy/consignmentapi_ecs_task_policy_${environment}",
        "arn:aws:iam::${account_id}:policy/frontend_ecs_execution_policy_${environment}",
        "arn:aws:iam::${account_id}:policy/frontend_ecs_task_policy_${environment}",
        "arn:aws:iam::${account_id}:policy/keycloak_ecs_execution_policy_${environment}",
        "arn:aws:iam::${account_id}:policy/KeycloakECSExecutionPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/keycloak_ecs_task_policy_${environment}",
        "arn:aws:iam::${account_id}:policy/KeycloakECSTaskPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/log_data*",
        "arn:aws:iam::${account_id}:policy/tdr*",
        "arn:aws:iam::${account_id}:policy/TDRApiGatewayCloudwatchPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRApiUpdatePolicy",
        "arn:aws:iam::${account_id}:policy/TDRBackendChecks*Policy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRChecksumPolicy",
        "arn:aws:iam::${account_id}:policy/TDRCloudwatch${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRConfig${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRConsignmentApiAllowIAMAuthPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRConsignmentExport*",
        "arn:aws:iam::${account_id}:policy/TDRCreateDbUsersBastionPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRCreateDbUsersConsignmentapiPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRCreateKeycloak*",
        "arn:aws:iam::${account_id}:policy/TDRCustodian*",
        "arn:aws:iam::${account_id}:policy/TDRDownloadFilesPolicy",
        "arn:aws:iam::${account_id}:policy/TDRExport*",
        "arn:aws:iam::${account_id}:policy/TDRFileFormat*",
        "arn:aws:iam::${account_id}:policy/TDRGitHub*",
        "arn:aws:iam::${account_id}:policy/TDRGithubActions*",
        "arn:aws:iam::${account_id}:policy/TDRIAMUserManageCredentialsPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRKeycloakECSTaskPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRKeycloakFlowlogPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRKeycloakUpdateECSExecutionPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDR*Lambda*${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRLogData${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRReporting*",
        "arn:aws:iam::${account_id}:policy/TDRServiceUnavailablePolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRSign*",
        "arn:aws:iam::${account_id}:policy/TDRSNSPublish${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRUpdateWAFAndSecurityGroupsPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRVpcFlowlogPolicy${title(environment)}",
        "arn:aws:iam::${account_id}:policy/TDRYaraAvPolicy",
        "arn:aws:iam::${account_id}:policy/vpc_access_policy*",
        "arn:aws:iam::${account_id}:role/aws-service-role/*",
        "arn:aws:iam::${account_id}:role/BastionEC2Role${title(environment)}",
        "arn:aws:iam::${account_id}:role/consignmentapi_ecs_execution_role_${environment}",
        "arn:aws:iam::${account_id}:role/consignmentapi_ecs_task_role_${environment}",
        "arn:aws:iam::${account_id}:role/Custodian*",
        "arn:aws:iam::${account_id}:role/frontend_ecs_execution_role_${environment}",
        "arn:aws:iam::${account_id}:role/frontend_ecs_task_role_${environment}",
        "arn:aws:iam::${account_id}:role/keycloak_ecs_execution_role_${environment}",
        "arn:aws:iam::${account_id}:role/KeycloakECSExecutionRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/keycloak_ecs_task_role_${environment}",
        "arn:aws:iam::${account_id}:role/KeycloakECSTaskRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/keycloak_flowlog_role_${environment}",
        "arn:aws:iam::${account_id}:role/tdr*",
        "arn:aws:iam::${account_id}:role/TDRApiGatewayCloudwatchRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRApiUpdateRole",
        "arn:aws:iam::${account_id}:role/TDRBackendChecks*Role${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRChecksumRole",
        "arn:aws:iam::${account_id}:role/TDRCloudTrail${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRCognitoAuthorisedRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRConfig${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRConsignmentExport*",
        "arn:aws:iam::${account_id}:role/TDRCreateDbUsersBastionRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRCreateDbUsersConsignmentapiRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRCreateKeycloak*",
        "arn:aws:iam::${account_id}:role/TDRDownloadFilesRole",
        "arn:aws:iam::${account_id}:role/TDRExportAPICloudwatchRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRExportAPIRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRExportBucketAccessRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRFileFormatECSExecutionRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRFileFormatEcsTaskRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRFileFormatRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRGithubActions*",
        "arn:aws:iam::${account_id}:role/TDRGithubActionsRunFileFormatECS${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRGitHubECSUpdateRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRGitHubRunKeycloakUpdateRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRKeycloakUpdateECSExecutionRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDR*Lambda*${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRLogDataAssumeRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRLogDataCrossAccountRoleMgmt",
        "arn:aws:iam::${account_id}:role/TDRReporting*",
        "arn:aws:iam::${account_id}:role/TDRServiceUnavailableRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRShieldResponseTeamRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRSign*",
        "arn:aws:iam::${account_id}:role/TDRUpdateWAFAndSecurityGroupsRole${title(environment)}",
        "arn:aws:iam::${account_id}:role/TDRYaraAvRole"
      ]
    }
  ]
}
