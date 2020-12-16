# Playbook
Ansible Playbooks offer a repeatable, re-usable, simple configuration management and multi-machine deployment system, one that is well suited to deploying complex applications.
## Playbook execution
A playbook runs in order from top to bottom. Within each play, tasks also run in order from top to bottom. Playbooks with multiple ‘plays’ can orchestrate multi-machine deployments, running one play on your webservers, then another play on your database servers, then a third play on your network infrastructure, and so on. At a minimum, each play defines two things:

- the managed nodes to target, using a pattern
- at least one task to execute

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

### Order of Pre_tasks,r role, tasks, post_tasks, handler in playbook
When you use the roles option at the play level, Ansible treats the roles as static imports and processes them during playbook parsing. Ansible executes your playbook in this order:

- Any pre_tasks defined in the play.
- Any handlers triggered by pre_tasks.
- Each role listed in roles:, in the order listed. Any role dependencies defined in the role’s meta/main.yml run first, subject to tag filtering and conditionals. See Using role dependencies for more details.
- Any tasks defined in the play.
- Any handlers triggered by the roles or tasks.
- Any post_tasks defined in the play.
- Any handlers triggered by post_tasks.

### Please Note
- Various roles in roles section will run in order of their definition.
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
