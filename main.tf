
resource "newrelic_alert_policy" "alert" {
  name = "SachinAlert"
}

# Add a condition
resource "newrelic_nrql_alert_condition" "FirstTest" {
  policy_id                    = newrelic_alert_policy.alert.id
  type                         = "static"
  name                         = "FirstTest"
  description                  = "Alert when transactions are taking too long"
  runbook_url                  = "https://www.example.com"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query             = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMzUyOHxJTkZSQXxOQXwyMjc2MjE3MDc2MTMwMzAzMTA'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

