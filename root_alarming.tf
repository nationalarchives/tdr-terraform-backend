# TDRD-1268
# Alarming/Alerting infrastructure

resource "aws_cloudwatch_event_bus" "alarms_event_bus" {
  name = "tdr-alarms"
}

#### IAM ####
data "aws_iam_policy_document" "alarms_trust" {
  statement {
    sid     = "DDTAlarmsTrust"
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_ssm_parameter.mgmt_account_number.value]
    }
  }
}

data "aws_iam_policy_document" "alarms_role" {
  statement {
    sid       = "TDRAlarmsPutBus"
    effect    = "Allow"
    actions   = ["events:PutEvents"]
    resources = [aws_cloudwatch_event_bus.alarms_event_bus.arn]
  }
}

resource "aws_iam_policy" "alarms_role" {
  name        = "tdr-alarms-event-bus"
  description = "Policy for eventbridge execution"
  policy      = data.aws_iam_policy_document.alarms_role.json
}

resource "aws_iam_role" "alarms_role" {
  name               = "tdr-alarms-bus"
  assume_role_policy = data.aws_iam_policy_document.alarms_trust.json
}

resource "aws_iam_role_policy_attachment" "alarms_role" {
  role       = aws_iam_role.alarms_role.name
  policy_arn = aws_iam_policy.alarms_role.arn
}
#############


resource "aws_cloudwatch_event_rule" "default_cloudwatch_alarm_state_change" {
  name        = "alarm-state-changes"
  description = "Take the alarm state change events from the default bus"
  event_pattern = jsonencode({
    source      = ["aws.cloudwatch"],
    detail-type = ["CloudWatch Alarm State Change"]
  })
  event_bus_name = "default"
}

resource "aws_cloudwatch_event_target" "default_cloudwatch_alarm_state_change_to_ddt_alarms_bus_target" {
  rule     = aws_cloudwatch_event_rule.default_cloudwatch_alarm_state_change.name
  arn      = aws_cloudwatch_event_bus.alarms_event_bus.arn
  role_arn = aws_iam_role.alarms_role.arn
}
