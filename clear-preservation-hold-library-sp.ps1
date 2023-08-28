$files =Get-PnPListItem -List "Preservation Hold Library" -PageSize 100

foreach ($item in $files)
{
try
{
Remove-PnPListItem -List "Preservation Hold Library" -Identity $item.Id -Force
}
catch
{
Write-Host "Error Occurred While Deleting the Item from the SharePoint Online List"
}
}