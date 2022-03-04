variable "string" {
  description = "The string to escape."
  type        = string
}

variable "powershell_replace_unix_escape_sequences" {
  description = "Whether to replace Unix escape sequences with escaped versions of the PowerShell equivalents. This will replace \"\\n\" (\"``n\"), \"\\r\" (\"``r\"), \"\\t\" (\"``t\"), and \"\\\"\" (\"``\"\")."
  type        = bool
  default     = false
}

variable "unix_replace_powershell_escape_sequences" {
  description = "Whether to replace Powershell escape sequences with escaped versions of the Unix equivalents. This will replace \"`n\" (\"\\\\n\"), \"`r\" (\"\\\\r\"), \"`t\" (\"\\\\t\"), and \"`\"\" (\"\\\\\"\")."
  type        = bool
  default     = false
}
