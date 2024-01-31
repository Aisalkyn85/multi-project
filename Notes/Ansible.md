
# Ansible
Ansible is an open-source automation tool used for configuration management, application deployment, task automation, and orchestration. It simplifies the process of managing and automating infrastructure by allowing users to define tasks and configurations in simple, human-readable YAML (Yet Another Markup Language) files. Developed by Red Hat, Ansible is designed to be agentless, which means it doesn't require any software to be installed on the managed nodes.

Here are some key aspects of Ansible:

Configuration Management:
========================
Ansible allows you to define the desired state of your systems in configuration files called playbooks. These playbooks describe the tasks to be executed on remote servers to achieve a specific configuration.
Automation:

Ansible automates repetitive tasks such as package installation, file management, and service configuration. It can be used for a wide range of automation scenarios, making it useful for both system-admins and developers.

Agentless Architecture:
===================
Ansible operates in an agentless manner, communicating with managed nodes (remote servers or devices) using SSH or other transport protocols. This eliminates the need to install agents on the managed nodes.
YAML Playbooks:

Playbooks are written in YAML, which is a human-readable data serialization format. YAML makes it easy to write and understand configuration files. Playbooks define a series of tasks to be executed on one or more hosts.

Modules:
========
Ansible uses modules to perform tasks on managed nodes. Modules are pre-built units of work that can be executed directly by Ansible. Modules cover a wide range of tasks, from managing packages and users to interacting with cloud providers and databases.

Idempotence:
===========
Ansible playbooks are designed to be idempotent, meaning that if you run the same playbook multiple times, the end state of the system remains the same. This ensures predictability and helps prevent unintended changes.

Community and Ecosystem:
=======================
Ansible has a large and active community that contributes to its ecosystem. There are numerous pre-built roles, modules, and playbooks available on Ansible Galaxy, a hub for sharing and collaborating on Ansible content.

Comparison with Terraform:
========================
While Ansible and Terraform are both tools for infrastructure automation, they serve different purposes:

Ansible:

Primarily focuses on configuration management and automation.
Uses YAML playbooks to describe the desired state of systems.
Agentless and relies on SSH or other transport protocols for communication.
Well-suited for tasks such as server configuration, application deployment, and day-to-day automation.

Terraform:

Primarily focuses on infrastructure provisioning and orchestration.
Uses HashiCorp Configuration Language (HCL) to define infrastructure as code.
Manages the lifecycle of infrastructure resources, such as virtual machines, networks, and storage.
Supports a wide range of cloud providers and infrastructure platforms.
In summary, while both Ansible and Terraform contribute to automating and managing infrastructure, Ansible is more focused on configuration management and task automation, whereas Terraform specializes in infrastructure provisioning and orchestration. Many organizations use both tools together to cover different aspects of their infrastructure automation needs.


# Installing Ansible:

Setting up Ansible involves installing it on a control machine and configuring it to connect to other machines, known as managed nodes. Below are the basic steps to set up Ansible and configure a connection with another machine.

Control Machine Setup:
Ensure your control machine is running a supported operating system (Linux, macOS, or Windows Subsystem for Linux on Windows).

Install Ansible. The installation method depends on your operating system. For example, on a Linux system, you can use a package manager:

For Ubuntu/Debian
================

	sudo apt-get update
	sudo apt-get install ansible

For other operating systems, you can refer to the official Ansible documentation for installation instructions.

Configuring SSH Key-Based Authentication:
===================================
SSH Key Pair:
Generate an SSH key pair on the control machine if you don't have one:

	ssh-keygen

Follow the prompts to generate a key pair. This will create ~/.ssh/id_rsa (private key) and ~/.ssh/id_rsa.pub (public key).

Copy Public Key to Managed Nodes:

Copy the public key (~/.ssh/id_rsa.pub) to the managed nodes where Ansible will run tasks. You can use the ssh-copy-id command:

	ssh-copy-id username@<managed_node_ip>

Replace username with the username on the managed node and <managed_node_ip> with the IP address or hostname of the managed node.

Alternatively, you can manually copy the public key to the ~/.ssh/authorized_keys file on the managed node.


Few more terms commonly used in Ansible:

Host:
=====
Definition: A host is a remote machine or device that Ansible manages. It can be a server, network device, or any system reachable over a network.
Purpose: Hosts are specified in the inventory file, and Ansible performs tasks on these hosts based on the playbook instructions.

Inventory:
=========
Definition: An inventory is a file that lists the hosts Ansible will manage. It can be a simple text file, YAML file, or even a dynamic inventory script.
Purpose: The inventory file organizes hosts into groups and provides Ansible with information about how to connect to each host.

Target Nodes:
============
Definition: Target nodes refer to the hosts or group of hosts specified as the recipients of Ansible tasks in a playbook.
Purpose: In a playbook, you define the hosts or groups to which specific tasks should be applied. These hosts are the target nodes.

Fact:
====
Definition: A fact is a piece of information about a managed node, such as its operating system, IP address, or available memory.
Purpose: Facts are automatically collected by Ansible before task execution and can be used as variables in playbooks.

Handler:
=======
Definition: A handler is a task that runs in response to a notification triggered by other tasks in a playbook.
Purpose: Handlers are typically used to restart services or perform other actions only if changes have been made to the system.

Roles Directory:
=============
Definition: The roles directory is a directory structure where you organize roles in Ansible. Roles encapsulate tasks, files, templates, and variables.
Purpose: Roles provide a way to modularize and reuse configurations across multiple playbooks.

Vault:
=====
Definition: Ansible Vault is a tool for encrypting sensitive data within Ansible playbooks or files.
Purpose: Vault ensures that sensitive information, such as passwords or API keys, is stored securely and can be decrypted only by authorized users.

Ad-Hoc Command:
================
Definition: An ad-hoc command is a one-liner command that you run directly from the command line without the need for a playbook.
Purpose: Ad-hoc commands are useful for quickly performing tasks, such as gathering information or making simple configurations.

In Ansible, modules, roles, tasks, plays, and playbooks are all essential components that contribute to the automation and organization of configuration management tasks. Let's break down these terms:

Module:
=======
Definition: A module in Ansible is a unit of work, typically a small program written in Python or another programming language.
Purpose: Modules carry out specific tasks on managed nodes, such as installing packages, copying files, or managing users.
Example: The yum module installs packages on Linux systems, and the copy module copies files from the control node to managed nodes.

Task:
====
Definition: A task is a single unit of work within an Ansible playbook.
Purpose: Tasks define a specific action to be taken on a managed node, and they are executed sequentially.
Example: A task might involve creating a directory, ensuring a service is running, or configuring a file.

Play:
====
Definition: A play is a set of tasks that are executed on a defined set of hosts (managed nodes).
Purpose: Plays organize tasks into a logical unit, and they are often used to represent a stage in the overall configuration process.
Example: A play might include tasks related to setting up a web server, including installing packages, configuring files, and restarting services.

Playbook:
========
Definition: A playbook is a collection of plays organized to achieve a specific goal or configuration.
Purpose: Playbooks are written in YAML and define the desired state of a system. They can include multiple plays, making them suitable for complex configurations.
Example: A playbook might be used to configure a web server, a database server, or an entire application stack.

Role:
====
Definition: A role is a way of organizing related tasks, templates, files, and variables into a reusable structure.
Purpose: Roles help modularize configurations and make them more maintainable. Roles can be reused across different playbooks.
Example: A role for a web server might include tasks for installing the web server software, configuring virtual hosts, and managing SSL certificates.

Summary:
	Module: A unit of work that performs a specific task on managed nodes.
	Task: A single action in an Ansible playbook that defines what to do on a managed node.
	Play: A set of tasks executed on a defined set of hosts, organized into a logical unit.
	Playbook: A collection of plays, written in YAML, that defines the desired state of a system or achieves a specific configuration.
	Role: A reusable and modular unit of organization for tasks, templates, and files, often used to represent a specific function in a configuration.
In practice, these components work together to create structured and modular Ansible configurations, making it easier to manage and scale automation tasks.



Ansible Inventory:
===============
Create an Ansible Inventory:
An inventory file lists the IP addresses or hostnames of the managed nodes. Create a simple inventory file (e.g., inventory.ini) with the IP addresses of your managed nodes:

	[servers]
	server1 ansible_host=<server1_ip>
	server2 ansible_host=<server2_ip>

Testing Connection:
=================
Test Connection:
Use the ansible command to test the connection to the managed nodes. For example:

	ansible -i inventory.ini servers -m ping

This command sends a ping module to the servers defined in the inventory. It should return a successful response if the connection is configured correctly.

# Running Ansible Playbooks:

Create Ansible Playbooks:

Write Ansible playbooks (YAML files) to define tasks and configurations. Save them with a .yml extension.
Run Ansible Playbooks:

	---
	- name: Install Git
	  hosts: git_servers
	  become: yes  # Run tasks with elevated privileges (sudo)
	
	  tasks:
	    - name: Install Git
	      apt:
	          name: git
	          state: present


Use the ansible-playbook command to run playbooks. For example:

	ansible-playbook -i inventory.ini my_playbook.yml

Replace my_playbook.yml with the name of your playbook.

This basic setup allows you to configure Ansible and establish a connection to managed nodes using SSH key-based authentication. As your usage of Ansible grows, you may explore advanced features such as roles, variables, and more sophisticated inventory setups. Refer to the official Ansible documentation for comprehensive guidance.

Ansible, by design, is stateless. This means that it doesn't maintain long-term state information about the systems it manages. Each time you run an Ansible playbook or ad-hoc command, Ansible evaluates the current state of the managed systems based on the tasks defined in the playbook and the information gathered during that specific execution.

Ansible playbooks are designed to be idempotent, meaning that running the same playbook multiple times should result in the same desired state, and it won't make unnecessary changes. This is achieved by checking the current state of the system and only applying changes if needed.


When you execute an Ansible playbook, several processes occur in the background to ensure the configuration management and automation tasks are performed on the target hosts. Here's a high-level overview of what happens behind the scenes when you run an Ansible playbook:

Initialization:
	Ansible initializes by reading the playbook file and gathering information about the tasks, plays, and hosts defined in the playbook.

Inventory Parsing:
	Ansible parses the inventory file specified in the command or configuration. The inventory file lists the hosts and groups of hosts that Ansible will manage.

SSH Connection:
	Ansible connects to the target hosts using SSH or another transport protocol. Ansible is agentless, so it doesn't require any agents to be installed on the managed nodes. SSH is the default transport mechanism, but other connection plugins can be used based on the target system.

Gathering Facts:
	Before executing tasks, Ansible gathers facts about the target hosts. Facts include information such as the operating system, IP address, available memory, and more. These facts become variables that can be used in playbooks.

Playbook Execution:
	Ansible executes the playbook in a series of plays and tasks. Each play is a set of tasks to be executed on a specific set of hosts. Tasks are individual actions that Ansible performs on the target hosts.

Task Execution:
	For each task, Ansible sends the necessary modules to the target hosts. Modules are small programs that carry out specific actions, such as installing packages, copying files, or restarting services. Ansible executes these modules on the remote hosts.

Reporting and Logging:
	As tasks are executed, Ansible reports the results and status of each task. The output includes information about whether a task succeeded, failed, or had no changes to make. Ansible also logs information about the playbook run.

Idempotence Check:
	Ansible is designed to be idempotent, meaning that running the same playbook multiple times will result in the same desired state. Ansible checks whether each task had any changes and only applies changes if necessary.

Handler Execution:
	If a task triggers a notification, Ansible executes associated handlers. Handlers are tasks that respond to changes made during the playbook run, such as restarting services.

Cleanup:
	Once the playbook is executed on all hosts and all tasks are complete, Ansible performs any necessary cleanup. Connections to remote hosts are closed, and the final status of the playbook run is displayed.

Throughout this process, Ansible ensures that the configuration of the target hosts matches the desired state defined in the playbook. The combination of modular tasks, idempotence, and flexible playbooks makes Ansible a powerful tool for automating infrastructure management and configuration.

# Ad-hoc commands

Ansible Ad-hoc commands are powerful one-liners that you can run directly from the command line to perform quick tasks.

Ping all hosts in the inventory:
	ansible all -i inventory.ini -m ping
This command pings all hosts in the inventory to check their reachability.

Get system information from all hosts:
	ansible all -i inventory.ini -m setup
This command gathers facts about all hosts, providing detailed system information.

Install a package on all hosts:
	ansible all -i inventory.ini -m apt -a "name=package_name state=present" -b
This command installs a package using the apt module (replace with yum for CentOS/RHEL).

Copy a file to all hosts:
	ansible all -i inventory.ini -m copy -a "src=path/to/local/file dest=/remote/path/" -b
This command copies a file from the control machine to all hosts.

Restart a service on all hosts:
	ansible all -i inventory.ini -m service -a "name=service_name state=restarted" -b
This command restarts a service on all hosts.

Run a shell command on all hosts:
	ansible all -i inventory.ini -m shell -a "command_here" -b
This command runs a shell command on all hosts.

Check free disk space on all hosts:
	ansible all -i inventory.ini -m command -a "df -h" -b
This command checks the free disk space on all hosts.

Create a directory on all hosts:
	ansible all -i inventory.ini -m file -a "path=/path/to/directory state=directory" -b
This command creates a directory on all hosts.

Retrieve logs from a specific service:
	ansible web_servers -i inventory.ini -m fetch -a "src=/var/log/service.log dest=/local/path/" -b
This command retrieves logs from a specific service on a group of hosts.

Execute a command as a different user:
	ansible all -i inventory.ini -m command -a "command_here" -b --become-user=username
This command runs a shell command as a specified user.

#  Playbooks
These are the basic Ansible playbooks to do some common tasks. Each playbook is designed to perform a specific action on target hosts.

Copy Files:
=========
Copies a file from the control machine to target hosts.

	---
	- name: Copy Files
	  hosts: target_hosts
	  become: yes
	
	  tasks:
	    - name: Copy configuration file
	      copy:
	        src: /local/path/to/config/file
	        dest: /remote/path/on/target


Install Packages:
==============
	1. Install git on target hosts.
	---
	- name: Install Packages
	  hosts: target_hosts
	  become: yes
	
	  tasks:
	    - name: Install git packages
	      apt:
	        name: "git"
	        state: present


	2. Install multiple packages with variables
	---
	- name: Install Packages
	  hosts: target_hosts
	  become: yes
	
	  tasks:
	    - name: Install essential packages
	      apt:
	        name: "{{ item }}"
	        state: present
	      with_items:
	        - maven
	        - nginx
	        - package3

Manage Services:
===============
	1. Ensures nginx service is running and enabled.
	---
	- name: Manage Services
	  hosts: target_hosts
	  become: yes
	
	  tasks:
	    - name: Ensure service is running
	      service:
	        name: "nginx"
	        state: started
	        enabled: yes
	
	2. Ensures multiple services are running and enabled.
	---
	- name: Manage Services
	  hosts: target_hosts
	  become: yes
	
	  tasks:
	    - name: Ensure service is running
	      service:
	        name: "{{ item }}"
	        state: started
	        enabled: yes
	      wit_items:
	        - nginx
	        - service2





