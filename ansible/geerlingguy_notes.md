# Ansible 
Ansible is simple open source IT engine which automates application deployment, intra service orchestration, cloud provisioning and many other IT tools.  

Ansible uses playbook to describe automation jobs, and playbook uses very simple language i.e. YAML. Ansible is designed for multi-tier deployment. Ansible does not manage one system at time, it models IT infrastructure by describing all of your systems are interrelated. Ansible is completely agentless which means Ansible works by connecting your nodes through ssh(by default). But if you want other method for connection like Kerberos, Ansible gives that option to you.

## How Ansible Works?

Ansible works by connecting to your nodes and pushing out small programs, called "Ansible modules" to them. Ansible then executes these modules (over SSH by default), and removes them when finished. 

### Installation 
pip3 install ansible   

    Successfully built ansible ansible-base PyYAML
    Installing collected packages: PyYAML, pycparser, cffi, six, cryptography, MarkupSafe, jinja2, pyparsing, packaging, ansible-base, ansible

    Successfully installed MarkupSafe-1.1.1 PyYAML-5.3.1 ansible-2.10.4 ansible-base-2.10.3 cffi-1.14.4 cryptography-3.2.1 jinja2-2.11.2 packaging-20.7 pycparser-2.20 pyparsing-2.4.7 six-1.15.0

verify installation using   
```sh 
  ansible --version    

  ansible 2.10.3
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/lynus/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/lynus/.local/lib/python3.8/site-packages/ansible
  executable location = /home/lynus/.local/bin/ansible
  python version = 3.8.0 (default, Oct 28 2019, 16:14:01) [GCC 8.3.0]
```
### Connect to server(create it on AWS)
`ssh centos@<ip>`

### Create and inventory file to group hosts

```sh 
[example]
107.20.106.183 or webaddress 
107.20.100.103 or webaddress
```

### Run 
You can run ad-hoc commands now
```sh
e.g. Ping server using ping module 
ansible -i inventory example -m ping -u centos
    where example is group of servers mentioned in inventory
    -m for module 
    - u means user
```
### Config

to create general config, create ansible.cfg and enter
```sh
[default]
INVENTORY = inventory
Now no need to enter inventory option, below command will work as above
```
## Adhoc commands
Ad-hoc Commands are used in Ansible to execute tasks instantly, and you need not save them for later use.

```
ansible example -m ping -u centos
-k or --ask-pass (use key pair of userid/password)

ansible example -a "free -h" -u centos --ask-pass 
other adhoc commands -  date

-m  module  to use   
-a argument for the module  
--ask-pass will ask for ssh password  
example is set of hosts described in inventory file
```

Chapter 2  
install virtualbox  
install vagrant (vagrantup.org) get latest  
explore find boxes

## install a box
$ vagrant init geerlingguy/centos7 (a box for centos)
this will create a Vagrantfile

- Now run 
$ vagrant up to download and install box, now you can verify using 
    vagrant ssh 
            exit
    vagrant ssh-config
    vagrant halt, destroy

## config vagrant to play a playbook on this box
Add provision and playbook ref
```sh
Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos7"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yaml"

  end

```

##playbook
```sh
- hosts: all # play can use 127.0.0.1
  become: yes # as sudo
  tasks:
  - name: Ensure NTP is installed
    yum: name=ntp state=present

  #- command: yum install -y ntp 
  #- shell: |
  #    if !rpm -qa | grep -qw ntp ; then
  #      yum install -y ntp
  #    fi
 
  - name: Ensure NTP is running
    service: name=ntpd state=started enabled=yes
        
```
 


