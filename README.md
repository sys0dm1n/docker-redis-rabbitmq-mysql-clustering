# Prerequisite 

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [Vagrant](https://www.vagrantup.com/docs/installation)
- OS Minimum Ubuntu Bionic 18.04

For Ubuntu users you can automate the prerequisite with the below commands (sudo privileges required and Vagrant not required)

```bash
chmod +x linux-prerequisite-install.sh
./linux-prerequisite-install.sh

```

# Redis Cluster
[Redis(TM)](https://redis.io/) is an advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.


# RabbitMQ Cluster
[RabbitMQ](https://www.rabbitmq.com/) is an open-source message-broker software that originally implemented the Advanced Message Queuing Protocol and has since been extended with a plug-in architecture to support Streaming Text Oriented Messaging Protocol, MQ Telemetry Transport, and other protocols.

[RabbitMQ manager URL](http://localhost:15672)
Username and passowrd are defined in the [deploy-clusters.yaml file](./deploy-clusters.yaml)

# MySQL Cluster
[MySQL](https://www.mysql.com/) is an open-source relational database management system. 

MySQL master node listening on port: 3306
MySQL slave node listening on port: 3307

# Install clusters
## For Ubuntu users

```bash
ansible-playbook deploy-clusters.yaml

```
[deploy-clusters.yaml file](./deploy-clusters.yaml) can be adjusted to install all or some of the clusters as well as adding variables to replace the defaults.

## Vagrant
[Vagrant](https://www.vagrantup.com/) is an open-source software product for building and maintaining portable virtual software development environments.

This is tested and worked using Ubuntu for the host OS and VirtualBox.

```bash
vagrant up --provision

```

*Note:* If using VirtualBox you might neet to install the Guest Additions otherwise Vagrant will not be unable to mount VirtualBox shared folders. 

To discover Vagrant machine's IP:
```bash
vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
```

# References:

- [Docker Redis Cluster](https://hub.docker.com/r/bitnami/redis/)
- [Docker RabbitMQ Cluster](https://hub.docker.com/r/bitnami/rabbitmq/)
- [Docker MySQL Cluster](https://hub.docker.com/r/bitnami/mysql)
