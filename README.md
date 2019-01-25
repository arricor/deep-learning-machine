# Arricor Infrastructure Provisioning

This repository contains an Ansible playbook and instructions to create and manage Arricor's bare metal deep learning machines. For a description of why Ansible was chosen and what other alternatives were considered, please see [ToolSelection.md](ToolSelection.md)

## Using This Repository

Install the [pre-requisites](#Pre-requisites).

### Pre-requisites

#### Ansible

Install Ansible by following the directions for your machine [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine).

Gather the following:

- SSH key
- List of servers

### Notes and Gotchas

By default, Ansible will try to use native OpenSSH for remote communication when possible. This enables ControlPersist (a performance feature), Kerberos, and options in `~/.ssh/config` such as Jump Host setup. However, when using Enterprise Linux 6 operating systems as the control machine (Red Hat Enterprise Linux and derivatives such as CentOS), the version of OpenSSH may be too old to support ControlPersist. On these operating systems, Ansible will fallback into using a high-quality Python implementation of OpenSSH called ‘paramiko’. If you wish to use features like Kerberized SSH and more, consider using Fedora, macOS, or Ubuntu as your control machine until a newer version of OpenSSH is available for your platform.

Ansible does not expose a channel to allow communication between the user and the ssh process to accept a password manually to decrypt an ssh key when using the ssh connection plugin (which is the default). The use of `ssh-agent` is highly recommended.

Python must be installed on the remote machine for Ansible's 'ping' functionality to work.

```bash
$ ansible-playbook tensorflow.yml --ask-become-pass
```
