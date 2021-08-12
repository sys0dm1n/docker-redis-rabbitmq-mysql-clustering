$script = <<-'SCRIPT'
# echo "### Installing VirtualBox Guest Additions"
# sudo apt install virtualbox-guest-additions-iso -y
# sudo mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /media/
# sudo /media/VBoxLinuxAdditions.run
if ! hash docker >/dev/null 2>&1; then
    echo "### Installing docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo apt install -y python3-pip 
    pip install docker
    sudo groupadd docker
    sudo usermod -aG docker vagrant
else
    echo "### Docker already installed ###"
fi

if ! hash docker-compose >/dev/null 2>&1; then
    echo "### Installing docker-compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    pip install docker-compose
else
    echo "### docker-compose already installed ###"
fi
SCRIPT

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/focal64"
  end
  config.vm.provision "shell", inline: $script
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deploy-clusters.yaml"
  end
  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 6379, host: 6379   # Redis master port
  config.vm.network "forwarded_port", guest: 15672, host: 15672 # RabbitMQ management port
  config.vm.network "forwarded_port", guest: 3306, host: 3306   # MySQL Master port
  config.vm.network "forwarded_port", guest: 3307, host: 3307   # MySQL Slave port
end