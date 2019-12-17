Vagrant.configure("2") do |config|
  config.vm.box = "gusztavvargadr/windows-10"
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end
end
