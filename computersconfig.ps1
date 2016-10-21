# http://technet.microsoft.com/library/ee156542.aspx
$a = Get-Content $args[0]#.Length

foreach ($i in $a)

{

$hostn = Get-WmiObject win32_computersystem -computername $i

Write-Host "HOST:" $hostn.name

$hn = $hostn.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Force -InputObject $("HOST: " + $hostn.name) 

$os = get-wmiobject win32_operatingsystem -computername $i

$win = $os.caption -replace "Microsoft "

Write-Host "OS:" $win

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("OS: " + $win) 

$mb = get-wmiobject win32_baseboard -computername $i

$installdate = ([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate)

Write-Host "Install Date:" $installdate

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("Install Date: " + $installdate) 

Write-Host "MB:" $mb.product

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("MB: " + $mb.product) 

$processor = get-wmiobject win32_processor -computername $i
# if ($processor.name -like "Intel(R) Core(TM) ") {$processor.name -replace "Intel(R) Core(TM) "}

Write-Host "CPU:" $processor.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("CPU: " + $processor.name) 

$vga = get-wmiobject Win32_VideoController -computername $i

Write-Host "VGA:" $vga.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("VGA: " + $vga.name) 

$sb = get-wmiobject Win32_SoundDevice -computername $i

Write-Host "SB:" $sb.name

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("SB: " + $sb.name) 

$dd = get-wmiobject Win32_DiskDrive -computername $i
$hdd = $dd.model -replace "ATA Device"
Write-Host "HDD:" $hdd

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("HDD: " + $dd.model) 

$mem = Get-WmiObject win32_computersystem -computername $i | ForEach-Object {[math]::round($_.TotalPhysicalMemory / 1GB)}

Write-Host "RAM:" $mem

Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("RAM: " + $mem) 

$networkadapter = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -computername $i -Filter IPEnabled=TRUE | select Description

$nic = $networkadapter -replace "@{Description="

$net = $nic -replace "}"

Write-Host "NIC:" $net


Out-File -FilePath "\\storage\temp_all\inventory\$hn.txt" -Encoding unicode -Append -Force -InputObject $("NIC: " + $net)

Write-Host +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
ri $args[0]#.Length
