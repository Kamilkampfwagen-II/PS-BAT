$ErrorActionPreference = 'SilentlyContinue'
rem <#
	cls
	@echo off
	cd %~dp0
	set "helper=$args=$args -split '';$error.Clear();Invoke-Command([scriptblock]::Create((Get-Content $args[2] -Raw))) -ArgumentList $args"

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

# Show the $args variable
$args

pause