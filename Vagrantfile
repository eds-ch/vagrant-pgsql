Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-22.04-arm64"
    config.vm.box_download_insecure = true
    config.vm.provider "vmware_desktop" do |v|
        v.ssh_info_public = true
        v.gui = true
        v.linked_clone = false
        v.vmx["ethernet0.virtualdev"] = "vmxnet3"
    end
    config.vm.provision :shell, path: "provision_postgresql.sh"
end
