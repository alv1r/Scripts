# http://technet.microsoft.com/library/ee156542.aspx
# D:\PSTools\PsExec.exe \\* C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy bypass -file \\192.168.0.49\temp_all\inventory\computerconfig.ps1

$hostn = Get-WmiObject win32_computersystem 

Write-Host "HOST:" $hostn.name

$hn = $hostn.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Force -InputObject $("HOST: " + $hostn.name) 

$os = get-wmiobject win32_operatingsystem

Write-Host "OS:" $os.caption

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("OS: " + $os.caption) 

$installdate = ([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate)

Write-Host "Install Date:" $installdate

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("Install Date: " + $installdate) 

$mb = get-wmiobject win32_baseboard

Write-Host "MB:" $mb.product
Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("MB: " + $mb.product) 

$processor = get-wmiobject win32_processor

Write-Host "CPU:" $processor.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("CPU: " + $processor.name) 

$vga = get-wmiobject Win32_VideoController

Write-Host "VGA:" $vga.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("VGA: " + $vga.name) 

$sb = get-wmiobject Win32_SoundDevice 

Write-Host "SB:" $sb.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("SB: " + $sb.name) 

$dd = get-wmiobject Win32_DiskDrive

Write-Host "HDD:" $dd.model

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("HDD: " + $dd.model) 

$mem = Get-WmiObject win32_computersystem | ForEach-Object {[math]::round($_.TotalPhysicalMemory / 1GB)}

Write-Host "RAM:" $mem

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("RAM: " + $mem) 

$networkadapter = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE | select Description

$nic = $networkadapter -replace "@{Description="

$net = $nic -replace "}"

Write-Host "NIC:" $net

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("NIC: " + $net) 
