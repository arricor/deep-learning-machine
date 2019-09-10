VAGRANTFILE_API_VERSION = "2"

require './vagrant-provision-reboot-plugin'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 config.vm.box = "ubuntu/bionic64"
 config.disksize.size = '20GB'

 config.vm.boot_timeout = 300



 config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "jupyter-test"
    vb.memory = 2048
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]

 end

 config.vm.synced_folder ".", "/vagrant"

 config.vm.provision "shell", inline: "sudo apt-get -y update"
 config.vm.provision "shell", inline: "sudo apt-get -y upgrade"
 config.vm.provision "shell", inline: "sudo apt-get -y install software-properties-common"
 config.vm.provision "shell", inline: "sudo apt-add-repository --yes --update ppa:ansible/ansible"
 config.vm.provision "shell", inline: "sudo apt-get -y install aptitude ansible"
 config.vm.provision "shell", inline: "sudo apt-get -y autoremove"

 config.vm.provision "ansible_local" do |ansible|
    ansible.verbose = ""
    ansible.playbook = "tensorflow.yml"
    ansible.tags = "packages"
 end

 config.vm.provision :unix_reboot

 config.vm.provision "ansible_local" do |ansible|
  ansible.verbose = ""
  ansible.playbook = "tensorflow.yml"
  ansible.tags = "docker"
 end

 config.vm.provision "ansible_local" do |ansible|
  ansible.verbose = ""
  ansible.playbook = "tensorflow.yml"
  ansible.tags = "cuda"
 end

 config.vm.provision "ansible_local" do |ansible|
  ansible.verbose = ""
  ansible.playbook = "tensorflow.yml"
  ansible.tags = "nvidia"
 end

 config.vm.provision :unix_reboot

 config.vm.provision "ansible_local" do |ansible|
   ansible.verbose = ""
   ansible.playbook = "tensorflow.yml"
   ansible.tags = "jupyter"
 end
end
