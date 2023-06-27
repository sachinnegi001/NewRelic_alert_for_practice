
resource "newrelic_alert_policy" "alert" {
  name = "SachinAlert"
}

# Add a condition
resource "newrelic_nrql_alert_condition" "FirstTest" {
  policy_id                    = newrelic_alert_policy.alert.id
  type                         = var.type
  name                         = var.Name
  description                  = var.discription
  runbook_url                  = "https://www.example.com"
  enabled                      = true
  violation_time_limit_seconds = var.violation_time_limit_seconds

  nrql {
    query             = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMzUyOHxJTkZSQXxOQXwyMjc2MjE3MDc2MTMwMzAzMTA'"
  }

  critical {
    operator              = var.operator
    threshold             = var.Thrushold
    threshold_duration    = var.Thrushold_duration
    threshold_occurrences = "ALL"
  }
}

