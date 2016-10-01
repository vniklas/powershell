# Download SC 2016 VHD Eval
#
# Niklas Akerlund / 2016-10-01
[CmdletBinding()]
param([switch]$SCVMM,[switch]$SCOM,[switch]$SCDPM,[switch]$SCORCH,[switch]$SCSM,[switch]$All,[string]$Dest='C:\VHDEVAL')

# Check if the folder exists
if(!(Get-Item $Dest -ErrorAction SilentlyContinue))
{
  New-Item -Path $Dest -ItemType Directory
}

    # SCVMM
    if($SCVMM -or $All){
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=53886' -UseBasicParsing).links |
  Where-Object  -Property href -Match  -Value "exe$|docx$|bin$").href | 
  Select-Object -Unique |
  ForEach-Object -Process {
    if(!(Get-Item ($Dest +"\"+ $_.split("/")[-1]) -ErrorAction SilentlyContinue)){ 
        Start-BitsTransfer -Source $_ -Destination $Dest
    }
  }
  }
    # SCOM
    if($SCOM -or $All){
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=53888' -UseBasicParsing).links |
  Where-Object  -Property href -Match  -Value "exe$|docx$|bin$").href |
  Select-Object -Unique |
  ForEach-Object -Process {
    if(!(Get-Item ($Dest +"\"+ $_.split("/")[-1]) -ErrorAction SilentlyContinue)){ 
        Start-BitsTransfer -Source $_ -Destination $Dest
    }
  }
  }
    # SCORCH
    if($SCORCH -or $All){
    ((Invoke-WebRequest -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=53889' -UseBasicParsing).links |
  Where-Object  -Property href -Match  -Value "exe$|docx$|bin$").href |
  Select-Object -Unique |
  ForEach-Object -Process {
    if(!(Get-Item ($Dest +"\"+ $_.split("/")[-1]) -ErrorAction SilentlyContinue)){ 
        Start-BitsTransfer -Source $_ -Destination $Dest
    }
  }
  }
    # SCDPM
    if($SCDPM -or $All){
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=53890' -UseBasicParsing).links |
  Where-Object  -Property href -Match  -Value "exe$|docx$|bin$").href |
  Select-Object -Unique |
  ForEach-Object -Process {
    if(!(Get-Item ($Dest +"\"+ $_.split("/")[-1]) -ErrorAction SilentlyContinue)){ 
        Start-BitsTransfer -Source $_ -Destination $Dest
    }
  } 
  }
    # SCSM
    if($SCSM -or $All){
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=53887' -UseBasicParsing).links |
    Where-Object  -Property href -Match  -Value "exe$|docx$|bin$").href |
    Select-Object -Unique |
    ForEach-Object -Process {
    if(!(Get-Item ($Dest +"\"+ $_.split("/")[-1]) -ErrorAction SilentlyContinue)){ 
        Start-BitsTransfer -Source $_ -Destination $Dest
    }
  }
 }
