# Boxes

These are all bare bones boxes, built to work with ansible as the provisioning system.

It requires at least packer 0.10.1 to build.

## Requirements

* packer >= 0.10.1
* virtualbox >= 5.0.0


## Mac OS X

This creates a bare bones Mac OS X virtual machine. It was based off the following sources:

* https://github.com/timsutton/osx-vm-templates
* https://github.com/AndrewDryga/vagrant-box-osx
* https://github.com/sandstorm/macosx-with-ansible
* https://github.com/geerlingguy/mac-dev-playbook
* https://github.com/geerlingguy/mac-osx-virtualbox-vm
* https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/

packer build -force vbox-macosx.json

## Windows 10

This creates a bare bones windows 10 virtual machine. It was based off the following sources:

* https://github.com/mwrock/boxstarter
* https://github.com/mwrock/packer-templates
* https://github.com/joefitzgerald/packer-windows
* http://everythingshouldbevirtual.com/packer-vagrant-ansible-windows-winrmtransport-error
* http://www.howtogeek.com/224798/how-to-uninstall-windows-10s-built-in-apps-and-how-to-reinstall-them/
* http://answers.microsoft.com/en-us/onedrive/forum/odoptions-oddesktop/how-to-uninstall-onedrive-completely-in-windows-10/e735a3b8-09f1-40e2-89c3-b93cf7fe6994?auth=1
* https://blogs.technet.microsoft.com/pstips/2014/05/26/set-the-windows-7-user-account-picture/
* http://www.askvg.com/how-to-remove-search-and-task-view-icons-from-windows-10-taskbar/
* http://www.askvg.com/windows-10-tip-remove-cortana-microsoft-edge-contact-support-and-feedback-apps/
* https://blog.jourdant.me/post/ps-setting-windows-8-account-picture-from-ad
* http://www.hurryupandwait.io/blog/certificate-password-less-based-authentication-in-winrm


@todo Do we need some documentation on how to setup ansible to work with this system? Minimum version of
ansible, packer, etc.


packer build -force vbox-win10.json

