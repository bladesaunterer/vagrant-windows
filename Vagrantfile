Vagrant.configure("2") do |config|
  config.vm.box = "gusztavvargadr/windows-10"

  config.vm.network "forwarded_port", guest: 3041, host: 9001
  config.vm.network "forwarded_port", guest: 4031, host: 9002
  config.vm.network "forwarded_port", guest: 8081, host: 9003
  config.vm.network "forwarded_port", guest: 8444, host: 9004
  config.vm.network "forwarded_port", guest: 8449, host: 9005
  config.vm.network "forwarded_port", guest: 443, host: 9006
  config.vm.network "forwarded_port", guest: 4501, host: 9007

  config.vm.provider "virtualbox" do |vb|
   vb.name = "Windows 10 VM"
   vb.customize ["modifyvm", :id, "--vram", "128"]
   vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional'] 
   vb.gui = true
  end

  config.vm.provision "shell", privileged: "true", inline: <<-'POWERSHELL'
    # Install Boxstarter
    . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force

    # Copy setup.ps1 to the Temp directory and then run boxstarter with our setup.ps1 script
    $env:PSModulePath = "$([System.Environment]::GetEnvironmentVariable('PSModulePath', 'User'));$([System.Environment]::GetEnvironmentVariable('PSModulePath', 'Machine'))"
    cp C:\vagrant\setup.ps1 $env:TEMP
    Import-Module Boxstarter.Chocolatey
    $credential = New-Object System.Management.Automation.PSCredential("vagrant", (ConvertTo-SecureString "vagrant" -AsPlainText -Force))
    Install-BoxstarterPackage $env:TEMP\setup.ps1 -Credential $credential

  POWERSHELL

end


  