# Terraform Shell Escape

This module escapes a string for use in either a Unix shell or Windows PowerShell.

It will always escape the following characters:

- Newline literal -> ```` \n ```` (Unix), ```` `n ```` (PowerShell)
- Carriage return literal -> (removed for Unix), ```` `r ```` (PowerShell)
- Tab literal -> ```` \t ```` (Unix), ```` \t ```` (PowerShell)
- ```` ` ```` -> ```` \` ```` (Unix), ```` `` ```` (PowerShell)
- `"` -> ```` \" ```` (Unix), ```` `" ```` (PowerShell)
- `$` -> ```` \$ ```` (Unix), ```` `$ ```` (PowerShell)

For Unix, it will also escape:
- `\` -> ```` \\ ````

## Usage

```
module "shell-escape" {
  source = "Invicton-Labs/shell-escape/null"

  string = <<EOF
This is a multi-line string.
	This line is indented with a tab.
Here are "double quotes", and here are `backticks`.
We also have a couple dollar signs ($$$).
EOF

}

output "escaped_strings" {
  value = module.shell-escape
}
```

**Note:** In the below you'll see extra backslashes `\` in the strings. That's because Terraform always backslash-escapes quotes in string outputs; the actual string value doesn't contain the extra double quote escape backslashes.
```
Apply complete! Resources: 0 added, 0 changed, 4 destroyed.

Outputs:

escaped_strings = {
  "powershell" = "This is a multi-line string.`r`n`tThis line is indented with a tab.`r`nHere are `\"double quotes`\", and here are ``backticks``.`r`nWe also have a couple dollar signs (`$`$`$).`r`n"
  "unix" = "This is a multi-line string.\\n\\tThis line is indented with a tab.\\nHere are \\\"double quotes\\\", and here are \\`backticks\\`.\\nWe also have a couple dollar signs (\\$\\$\\$).\\n"
}
```
