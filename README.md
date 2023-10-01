# PS-BAT
A funky and overengineered method of running powershell scripts inside a batch file without creating temporary files. Redundant if you've write access to the registry.

 character is being used to avoid conflicts when splitting the string constructed out of arguments.

# [PS-BAT.bat](https://github.com/Kamilkampfwagen-II/PS-BAT/blob/main/PS-BAT.bat)
- Creates a table `$PSScript` containing the script root, name, fullname, args. Since `$PSScriptRoot` or `$MyInvocation.MyCommand.Definition` aren't valid anymore the powershell script contained must be modified to use `$PSScript.Root` instead. `$args` variable works exactly the same as a regular powershell script.