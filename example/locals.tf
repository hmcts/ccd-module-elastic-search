locals {
  lin_password  = random_password.vm_password.result
  linux         = "linux"
  expiresAfter  = "2025-04-10"
  nessus_server = "nessus-scanners-nonprod000005.platform.hmcts.net"
  nessus_groups = "Nonprod-test"
  nessus_key    = "nessus-agent-key-nonprod"
}
