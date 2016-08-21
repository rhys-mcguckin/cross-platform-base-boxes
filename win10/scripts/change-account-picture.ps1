#
#
#

function Get-CurrentUserSID {
  [CmdletBinding()]param()

  Add-Type -AssemblyName System.DirectoryServices.AccountManagement
  return ([System.DirectoryServices.AccountManagement.UserPrincipal]::Current).SID.Value
}

$user_photo = [byte[]](Get-Content A:\vagrant.jpg  -Encoding byte)
$user_sid = Get-CurrentUserSID

#set up image sizes and base path
$image_sizes = @(40, 96, 200, 240, 448)
$image_mask = "Image{0}.jpg"
$image_base = $env:public + "\AccountPictures"

# Set up registry information.
$reg_base = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture\Users\{0}"
$reg_key = [string]::format($reg_base, $user_sid)
$reg_value_mask = "Image{0}"
If ((Test-Path -Path $reg_key) -eq $false) { New-Item -Path $reg_key }

# Save images, set reg keys
ForEach ($size in $image_sizes)
{
    # Create hidden directory, if it doesn't exist.
    $dir = $image_base + "\" + $user_sid
    If ((Test-Path -Path $dir) -eq $false) { $(mkdir $dir).Attributes = "Hidden" }

    # Save photo to disk, overwrite existing files.
    $file_name = ([string]::format($image_mask, $size))
    $path = $dir + "\" + $file_name
    Write-Verbose "  saving: $file_name"
    $user_photo | Set-Content -Path $path -Encoding Byte -Force

    # Save the path in registry, overwrite existing entries.
    $name = [string]::format($reg_value_mask, $size)
    $value = New-ItemProperty -Path $reg_key -Name $name -Value $path -Force
}

Write-Verbose "Done."

# Set the user account password to never expire.
wmic useraccount where "name='vagrant'" set PasswordExpires=FALSE
