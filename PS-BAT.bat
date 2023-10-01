$ErrorActionPreference = 'SilentlyContinue'
rem <#
	cls
	@echo off
	cd %~dp0
	set "helper=$args=$args -split '';$error.Clear();Set-Variable PSScript -Option Constant -Value ([ordered]@{Root=$args[0].Substring(0,$args[0].Length-1);Name=$args[1];FullName=$args[2];Args=$args[3..$args.length]}).AsReadOnly();Invoke-Command([scriptblock]::Create((Get-Content $args[2] -Raw))) -NoNewScope -ArgumentList $args[3..$args.Length]"

	:initArg
	set args=%~dp0%~nx0%0
	if '%1'=='' goto exec
	set args=%args%%1

	:addArg
	shift
	if '%1'=='' goto exec
	set args=%args%%1
	goto addArg

	:exec
	Powershell.exe -ExecutionPolicy Bypass -Command $ErrorActionPreference = 'Continue';$args = '%args%';%helper%
	exit
rem #>

#	---Powershell Script---

# Show the $PSScript table:
$PSScript

# Show the $args variable:
$args

# Try to remove the $PSScript table
Remove-Variable PSScript -Force

# Try to reassign the $PSScript table
Set-Variable PSScript -Value "" -Force

pause