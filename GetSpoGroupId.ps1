$tenant = "tv3"
$sharePointAdminUrl = "https://$tenant-admin.sharepoint.com"
$spoUrl = "https://tv3.sharepoint.com/sites/beci-video-editor"

Connect-SPOService $sharePointAdminUrl

$site = Get-SPOSite $spoUrl
$site.Template
$site.GroupId
$site.Owner