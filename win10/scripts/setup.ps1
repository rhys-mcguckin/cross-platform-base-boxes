#
# Wrapper for Powershell setup scripts.
#

# Clean up windows generally.
A:\remove-extra-packages.ps1

# Ensure appropriate software is installed.
A:\install-chocolatey.ps1
A:\install-guest-additions.ps1

# Change the account picture.
A:\change-account-picture.ps1
