# Ansible 
Ansible is simple open source IT engine which automates application deployment, intra service orchestration, cloud provisioning and many other IT tools.  

Ansible uses playbook to describe automation jobs, and playbook uses very simple language i.e. YAML. Ansible is designed for multi-tier deployment. Ansible does not manage one system at time, it models IT infrastructure by describing all of your systems are interrelated. Ansible is completely agentless which means Ansible works by connecting your nodes through ssh(by default). But if you want other method for connection like Kerberos, Ansible gives that option to you.

## How Ansible Works?
Ansible works by connecting to your nodes and pushing out small programs, called "Ansible modules" to them. Ansible then executes these modules (over SSH by default), and removes them when finished. 

Ansible is installed on control machine and remote machines are accessed using ssh
Ansible groups and keeps remote nodes information in inventory file and run playbooks on a server or group of servers.
These instructions are written in ansible playbooks a yaml file.
Ansible provides various modules meant to be executed on remote nodes
Task - A complete unit of work/procedure to be done
Role - A way of organizing tasks which can be called later from a playbook 
Fact - information fetched from the nodes 
Inventory - File containing data about the nodes 
Play - Execution unit of a playbook, one playbook can have one or many plays
Handler - Task which runs in case of notifier
Notifier - section of tasks which triggers a handler if output is changed

### Installation 
pip3 install ansible   

OR 
```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```
verify installation using   
```sh 
  ansible --version    
  ansible 2.10.3
  with few more details
```
### Create inventory file to group hosts
The default location for inventory is a file called /etc/ansible/hosts. You can also specify a different inventory file at the command line using the -i <path> option
```sh 
[example]
107.20.106.183 or webaddress 
107.20.100.103 or webaddress
```
It is possible to make groups of the group using the :children's suffix. And you can apply variables using :vars.

### Ad-hoc commands 
Ad-hoc Commands(/usr/bin/ansible) are used in Ansible to execute tasks instantly on a server or group of servers, these are not re-usable.
ansible <hosts> [-m <module_name>] -a <"arguments"> -u <username> [--become] 

```sh
e.g. Ping server using ping module 
$ansible -i inventory multi -m ping <username, e.g.centos>
$ ansible -i inventory multi -m ping -u centos
-> here example is group of servers mentioned in file 'inventory '
  - i means inventory file
  - m for module 
  - u means user
  - k // will ask for password
  - b needs sudo permission
On ansible 'command' is default module, other adhoc command can be 
$ansible -i inventory example -m command -a "date" -u centos
these command runs parallely on all servers
$ansible -i inventory multi -a "df -h" 
if you want it to run one after other use
$ansible -i inventory multi -a "df -h" -f 1

Get all the info about a host (db in this case)
$ansible -i inventory db -m setup

$ansible -i inventory multi -b -m yum -a "name=ntp state=present" /
$ansible -i inventory multi --become -m yum -a "name=ntp state=present" 
$ansible -i inventory multi --ask-become-pass -m yum -a "name=ntp state=present"
$ansible -i inventory multi -k -m yum -a "name=ntp state=present"   
$ansible -i inventory multi -k -m service -a "name=ntp state=started enabled=yes"  
$ansible -i inventory multi -b -a "service ntpd stop"  
$ansible -i inventory db -b -a "free -m"

You can restrict it to one of many server group, e.g. only one in app host group
$ansible -i inventory app -a "free -m" --limit "192.168.60.4" 
$ansible -i inventory app -a "free -m" --limit "*.4" //regex allowed
$ansible -i inventory multi -a "tail /var/log/messages | grep ansible-command | wc -l"

We can write a shell script and run it on particular server
$ansible -i inventory multi -b -m cron -a "name=something hour=4 job=/path/to/prog.sh"
$ansible -i inventory multi -b -m git -a "repo=repo_url dest=/opt/app update=yes version=1.2.3"
```
### Config

To create general config, create ansible.cfg and enter
```sh
[default]
INVENTORY = inventory
Now no need to enter inventory option, below command will work as above
```

## playbook
Playbook is just a yaml file which has instruction to run on nodes in the form of tasks, roles, services to run on server of group of servers mentioned in the playbook itself
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
 ### Yaml Tags used in Playbook
 hosts: server or group of servers, mentioned in inventory
 become: yes (if sudo permission is required)
 tasks : linked to a modules to run, provide name to track
 vars: variable which can be used in playbook

## Role
Roles provide a framework for fully independent or interdependent collections of files, tasks, templates, variables, and modules.
Roles helps to break a complex playbook into multiple re-usable components and shared by many playbook.
Each role is limited to particular functionality or desired output, with all necessary steps listed in same role or from dependent roles.
Roles have structure layout on the file-system

Role1

    |-- defaults    
    |   `-- main.yml  
    |-- handlers  
    |   `-- main.yml  
    |-- meta  
    |   `-- main.yml  
    |-- README.md  
    |-- tasks  
    |   `-- main.yml  
    |-- tests  
    |   |-- inventory  
    |   `-- test.yml  
    |-- vars  
        `-- main.ym

## Variables
```
- hosts : <your hosts>   
  vars:  
  tomcat_port : 8080   
```
can be used anywhere in playbook.

## Ansible Tags
When you want to run/skip tasks in playbook based on tags.
We can apply the same tag to more than one task. By using the "--tags" command line options, all tasks with that tag name will be run.
please ref pb.yaml file 
```
ansible-playbook example.yml --tags "configuration,packages"  
ansible-playbook example.yml --skip-tags "packages" 
```
"always" is a unique tag that will always run a task, unless specifically skipped (--skip-tags always)

Here is another unique tag that is "never" which prevents a task from running unless a tag is specifically requested.
```
tasks:  
  - debug: msg="{{ showmevar }}"  
    tags: [ never, debug ]  
```
Above task runs only when never or debug is explicitely called
--tags all - run all tasks, ignore tags (default behavior)  
--tags [tag1, tag2] - run only tasks with the tags tag1 and tag2  
--skip-tags [tag3, tag4] - run all tasks except those with the tags tag3 and tag4  
--tags tagged - run only tasks with at least one tag  
--tags untagged - run only tasks with no tags  

ref : https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html

## Ansible Modules
Ansible modules are discrete units of code which can be used from the command line or in a playbook task.

The modules also referred to as task plugins or library plugins in the Ansible.
Users can also write their modules. These modules can control like services, system resources, files, or packages, etc. and handle executing system commands

## Ansible Shell
Ansible shell module is designed to execute the shell commands against the target UNIX based hosts. Ansible can run except any high complexes commands with pipes, redirection. And you can also perform the shell scripts using the Ansible shell module.
One can use multiple shell commands as well
ref shell_pb.yaml for detail

## Ansible Templates
When you have to add few dynamic values for few servers and you are not willing to write static config files

A template is a file that contains all your configuration parameters, but the dynamic values are given as variables in the Ansible. During the playbook execution, it depends on the conditions such as which cluster you are using, and the variables will be replaced with the relevant values.

You can do more than replacing the variables with the help of the Jinj2 templating engine. You can have loops, conditional statements, write macros, filters for transforming the data, do arithmetic calculations, etc.

    Usually, the template files will have the .j2 extension, which denotes the Jinja2 templating engine used.

The double curly braces will denote the variables in a template file, '{{variables}}'.

We need to have two parameters when using the Ansible Template module, such as:

    src: The source of the template file. It can be a relative and absolute path.  
    dest: Dest is the destination path on the remote server.
Playbook using templatge
```
---  
- hosts: all  
  vars:  
    variable1: 'Hello'  
    variable2: 'My first playbook using template'  
  tasks:  
    - name: Basic Template Example  
      template:  
        src: example.j2  
        dest: /home/lynus/Documents/Ansible/output.txt  
```
example.j2
```
{{variable1}}  
No change in this line  
{{variable2}}  
```
output.txt
```
Hello
No change in this line
My first playbook using the template
```

## Ansible Debug
## Ansible Apt
## Ansible Lifeline
The lineinfile is one of the most powerful modules in the Ansible toolbox. Ansible lineinfile module is used to insert a line, modify, remove, and replace an existing line.
## Misc
Ansible Galaxy is a galaxy website where users can share roles and to a command-line tool for installing, creating, and managing roles.
## References
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/service_module.html#parameters
