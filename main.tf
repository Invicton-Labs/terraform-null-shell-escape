locals {
  escaped_powershell_no_sequences = replace(replace(replace(replace(replace(replace(var.string,
    // A literal backtick must be escaped
    "`", "``"),
    // A literal double quote must be escaped
    "\"", "`\""),
    // A new line must be escaped
    "\n", "`n"),
    // A carraige return must be escaped
    "\r", "`r"),
    // A tab must be escaped
    "\t", "`t"),
    // Escape dollar signs so they aren't used to reference variables
    "$", "`$"
  )
  escaped_powershell = !var.powershell_replace_unix_escape_sequences ? local.escaped_powershell_no_sequences : replace(replace(replace(replace(local.escaped_powershell_no_sequences,
    "\\r", "``r"),
    "\\n", "``n"),
    "\\t", "``t"),
    "\\\"", "``\""
  )

  escaped_unix_no_sequences = replace(replace(replace(replace(replace(replace(replace(var.string,
    // A literal backslash must be escaped
    "\\", "\\\\"),
    // A literal backtick must be escaped
    "`", "\\`"),
    // A literal double quote must be escaped
    "\"", "\\\""),
    // A new line must be escaped
    "\n", "\\n"),
    // A carraige return must be replaced with nothing
    "\r", ""),
    // A tab must be escaped
    "\t", "\\t"),
    // Escape dollar signs so they aren't used to reference variables
    "$", "\\$"
  )
  escaped_unix = !var.unix_replace_powershell_escape_sequences ? local.escaped_unix_no_sequences : replace(replace(replace(replace(local.escaped_unix_no_sequences,
    "`r", ""),
    "`n", "\\\\n"),
    "`t", "\\\\t"),
    "`\"", "\\\\\""
  )
}
