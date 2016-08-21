# Add certificates to be able to connect to this machine appropriately.
certutil -addstore -f "TrustedPublisher" A:\oracle.cer

# Installs the virtualbox guest additions.
if(Test-Path "E:\VBoxWindowsAdditions.exe") {
    Write-Host "Installing Guest Additions"
    cinst 7zip.commandline -y

    Start-Process -FilePath "E:\VBoxWindowsAdditions.exe" -ArgumentList "/S" -WorkingDirectory "E:\" -Wait
}
