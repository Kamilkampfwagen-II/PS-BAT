# PS-BAT
A funky and overengineered method of running powershell scripts inside a batch file without creating temporary files. Redundant if you've write access to the registry.

# [PS-BAT-PSScript.bat](https://github.com/Kamilkampfwagen-II/PS-BAT/blob/main/PS-BAT-PSScript.bat)
- Creates a table `$PSScript` containing the script root, name, fullname, args. Since `$PSScriptRoot` or `$MyInvocation.MyCommand.Definition` aren't valid anymore the powershell script contained must be modified to use `$PSScript.Root` instead.

# [PS-BAT-args.bat](https://github.com/Kamilkampfwagen-II/PS-BAT/blob/main/PS-BAT-args.bat)
- Everything is passed into the `$args` for a simpler approach:
  - Root: `$args[0]`
  - Name: `$args[1]`
  - FullName: `$args[2]`
  - Args: `$args[3..$args.Length]`
