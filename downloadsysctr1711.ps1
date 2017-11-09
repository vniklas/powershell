# Download SC Preview 1711 VHD Eval
#
# Niklas Akerlund / 2017-11-09
[CmdletBinding()]
param([switch]$SCVMM,[switch]$SCOM,[switch]$SCDPM,[switch]$SCORCH,[switch]$SCSM,[switch]$All,[string]$Dest='C:\VHDEVAL')

# Check if the folder exists
if(!(Get-Item $Dest -ErrorAction SilentlyContinue))
{
  New-Item -Path $Dest -ItemType Directory
}

    # SCVMM
    if($SCVMM -or $All){
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=56198' -UseBasicParsing).links |
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
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=56200' -UseBasicParsing).links |
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
    ((Invoke-WebRequest -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=56197' -UseBasicParsing).links |
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
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=56201' -UseBasicParsing).links |
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
    ((Invoke-WebRequest -Uri 'http://www.microsoft.com/en-us/download/confirmation.aspx?id=56199' -UseBasicParsing).links |
    Where-Object  -Property href -Match  -Value "exe$|docx$|bin$").href |
    Select-Object -Unique |
    ForEach-Object -Process {
    if(!(Get-Item ($Dest +"\"+ $_.split("/")[-1]) -ErrorAction SilentlyContinue)){ 
        Start-BitsTransfer -Source $_ -Destination $Dest
    }
  }
 }
