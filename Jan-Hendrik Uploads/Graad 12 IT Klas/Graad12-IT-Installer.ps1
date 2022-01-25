Write-Host "Running"
#Expand-Archive "Gr12IT PAT 2022.zip" -DestinationPath "GR12"

$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/'
$d = (Get-Item .).FullName+"/Graad12IT/"
New-Item -Path $d -ItemType Directory

$finU = $u+"Gr12IT%20PAT%202022.zip"
$finD = $d+"Gr12IT PAT 2022.zip"
Write-Host "downloading... Gr12IT PAT 2022.zip"
Invoke-WebRequest $finU -OutFile $finD
$finN = $finD.substring(0,$finD.length-4)
Write-Host "extracting... Gr12IT Gr12IT Delphi_Data.zip"
Expand-Archive $finD -DestinationPath $finN
Remove-Item $finD

$finU = $u+"Gr12IT%20Teorie_Data.zip"
$finD = $d+"Gr12IT Teorie_Data.zip"
Write-Host "downloading... Gr12IT Teorie_Data.zip"
Invoke-WebRequest $finU -OutFile $finD
$finN = $finD.substring(0,$finD.length-4)
Write-Host "extracting... Gr12IT Gr12IT Delphi_Data.zip"
Expand-Archive $finD -DestinationPath $finN
Remove-Item $finD

$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/Gr12IT%20%20Delphi_Data/'
$d = (Get-Item .).FullName+"/Graad12IT/Gr12IT  Delphi_Data/"
New-Item -Path $d -ItemType Directory

$finU = $u+"Gr12IT%20%20Delphi_Data.zip"
$finD = $d+"Gr12IT Delphi_Data.zip"
Write-Host "downloading... Gr12IT Gr12IT Delphi_Data.zip"
Invoke-WebRequest $finU -OutFile $finD 
$finN = $finD.substring(0,$finD.length-4)
Write-Host "extracting... Gr12IT Gr12IT Delphi_Data.zip"
Expand-Archive $finD -DestinationPath $finN
Remove-Item $finD

$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/Gr12IT%20%20Delphi_Data/Databases/'
$d = (Get-Item .).FullName+"/Graad12IT/Gr12IT  Delphi_Data/Databases/"
New-Item -Path $d -ItemType Directory

$videos = @("Adding Record in Multi-tabled DB via Delphi.mp4",'Databases in Delphi - Connecting and Data Modules.mp4','Databases in Delphi - Filter.mp4','Databases in Delphi - Locate.mp4','Databases in Delphi - Sorting.mp4','Databases in Delphi - Traversing a table.mp4','Deleting a Record in Multi-tabled DB via Delphi.mp4','Editing Databases in Delphi - Deleting a record.mp4','Editing Databases in Delphi - Editing a current record.mp4','Editing Databases in Delphi - Inserting a new record.mp4','How to do an SQL INSERT in Delphi.mp4','How to do an SQL SELECT in Delphi.mp4','How to do an SQL UPDATE in Delphi.mp4','Information Technology Grade 12 Paper 1 November 2018 Q2.2.mp4','Updating Records in Multi-tabled DB via Delphi.mp4','Using Records with Objects in a DB via Delphi.mp4')
foreach($vid in $videos)
 {
   $vidlink = [uri]::EscapeDataString($vid)
   $finU = $u+$vidlink
   $finD = $d+$vid
   Write-Host "downloading...",$vid
   Invoke-WebRequest $finU -OutFile $finD
 } 
 
$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/Gr12IT%20%20Delphi_Data/DynamicObjects/'
$d = (Get-Item .).FullName+"/Graad12IT/Gr12IT  Delphi_Data/DynamicObjects/"
New-Item -Path $d -ItemType Directory

$videos = @('Dynamic Objects in Delphi (Advanced).mp4','Dynamic Objects in Delphi (Basics).mp4')
foreach($vid in $videos)
 {
   $vidlink = [uri]::EscapeDataString($vid)
   $finU = $u+$vidlink
   $finD = $d+$vid
   Write-Host "downloading...",$vid
   Invoke-WebRequest $finU -OutFile $finD 
 } 
$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/Gr12IT%20%20Delphi_Data/MultipleForms/'
$d = (Get-Item .).FullName+"/Graad12IT/Gr12IT  Delphi_Data/MultipleForms/"
New-Item -Path $d -ItemType Directory

$videos = @('Multiple Forms in Delphi Part 1 - Setting up multiple forms.mp4','Multiple Forms in Delphi Part 2 - Sharing data between forms.mp4','Multiple Forms in Delphi Part 3 - Form Events.mp4')
foreach($vid in $videos)
 {
   $vidlink = [uri]::EscapeDataString($vid)
   $finU = $u+$vidlink
   $finD = $d+$vid
   Write-Host "downloading...",$vid
   Invoke-WebRequest $finU -OutFile $finD 
 } 
 
$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/Gr12IT%20%20Delphi_Data/OOP/'
$d = (Get-Item .).FullName+"/Graad12IT/Gr12IT  Delphi_Data/OOP/"
New-Item -Path $d -ItemType Directory

$videos = @('User Defined Objects Introduction.mp4','User Defined Objects Part 1.mp4','User Defined Objects Part 2.mp4','User Defined Objects Part 3 (JHB-E).mp4','Using Records with Objects in a DB via Delphi (JHB-E).mp4')
foreach($vid in $videos)
 {
   $vidlink = [uri]::EscapeDataString($vid)
   $finU = $u+$vidlink
   $finD = $d+$vid
   Write-Host "downloading...",$vid
   Invoke-WebRequest $finU -OutFile $finD 
 } 

$u = 'https://boilingtub.github.io/Jan-Hendrik/Jan-Hendrik%20Uploads/Graad%2012%20IT%20Klas/Gr12IT%20%20Delphi_Data/SQL/'
$d = (Get-Item .).FullName+"/Graad12IT/Gr12IT  Delphi_Data/SQL/"
New-Item -Path $d -ItemType Directory

$videos = @('How to do an SQL INSERT in Delphi.mp4','How to do an SQL SELECT in Delphi.mp4','How to do an SQL UPDATE in Delphi.mp4','SQL Advanced - SELECT queries (part 1).mp4','SQL Advanced - SELECT queries (part 2).mp4','SQL Advanced - SELECT queries (part 3).mp4','SQL Advanced - SELECT queries (part 4).mp4','SQL Advanced - SELECT queries (part 5).mp4','SQL Basics - SELECT queries (part 1).mp4','SQL Basics - SELECT queries (part 2).mp4','SQL Basics - SELECT queries (part 3).mp4','SQL Basics - SELECT queries (part 4).mp4','SQL Delete.mp4','SQL Insert.mp4','SQL Update.mp4')
foreach($vid in $videos)
 {
   $vidlink = [uri]::EscapeDataString($vid)
   $finU = $u+$vidlink
   $finD = $d+$vid
   Write-Host "downloading...",$vid
   Invoke-WebRequest $finU -OutFile $finD 
 } 
 
Write-Host "DONE !"