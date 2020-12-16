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
  configured module search path = ['/home/kpit/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/kpit/.local/lib/python3.8/site-packages/ansible
  executable location = /home/kpit/.local/bin/ansible
  python version = 3.8.0 (default, Oct 28 2019, 16:14:01) [GCC 8.3.0]
```
### Connect to server(create it on AWS)
`ssh centos@<ip>`

### Create and inventory file to group hosts
```sh 
[example]
107.20.106.183 or webaddress 
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

```
ansible example -m ping -u centos
-k or --ask-pass (use key pair of userid/password)

ansible example -a "free -h" -u centos --ask-pass 
other adhoc commands -  date

-m  module  to use   
-a argument for the module  
--ask-pass will ask for ssh password  
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
## Roles
You can use roles in three ways:

### roles:
 at the play level. This is the classic way of using roles in a play.

### include_role:
use it dynamically in the tasks section of a play 

### import_role
use it statically anywhere in the tasks section of a play 

### When you use the roles option at the play level, for each role ‘x’:

- If roles/x/tasks/main.yml exists, Ansible adds the tasks in that file to the play.

- If roles/x/handlers/main.yml exists, Ansible adds the handlers in that file to the play.

- If roles/x/vars/main.yml exists, Ansible adds the variables in that file to the play.

- If roles/x/defaults/main.yml exists, Ansible adds the variables in that file to the play.

- If roles/x/meta/main.yml exists, Ansible adds any role dependencies in that file to the list of roles.

- Any copy, script, template or include tasks (in the role) can reference files in roles/x/{files,templates,tasks}/ (dir depends on task) without having to path them relatively or absolutely.

When you use the roles option at the play level, Ansible treats the roles as static imports and processes them during playbook parsing. Ansible executes your playbook in this order:

- Any pre_tasks defined in the play.
- Any handlers triggered by pre_tasks.
- Each role listed in roles:, in the order listed. Any role dependencies defined in the role’s meta/main.yml run first, subject to tag filtering and conditionals. See Using role dependencies for more details.
- Any tasks defined in the play.
- Any handlers triggered by the roles or tasks.
- Any post_tasks defined in the play.
- Any handlers triggered by post_tasks.

### Please Note
- you can pass variable and use other keywords for import_role and include_role
- ansible runs a role only once unless its parameters are different or add 
  ```
  Add allow_duplicates: true to the meta/main.yml file for the role:
  ```
-  Ansible does not execute role dependencies when you include or import a role. You must use the roles keyword if you want Ansible to execute role dependencies.
- Ansible executes recursive role dependencies as well
- If two roles in a playbook both list a third role as a dependency, Ansible only runs that role dependency once, unless you pass different parameters, tags, when clause, or use allow_duplicates: true in the dependent (third) role. 
- To use allow_duplicates: true with role dependencies, you must specify it for the dependent role, not for the parent role. 

### ref 
https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
## TO-Explore
set_fact: 
 


