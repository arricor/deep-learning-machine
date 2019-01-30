# Deep Learning Machine

This repository contains an Ansible playbook and instructions to create and manage a single (or many) bare metal deep learning machines. For a description of why Ansible was chosen and what other alternatives were considered, please see [ToolSelection.md](ToolSelection.md)

## What's Included
After running the ansible script your machines will be loaded with the following:

1. Python 3
2. CUDA Drivers
3. Tensorflow GPU
4. JupyterLab

## Using This Repository to Configure Your Environment

1. [Installation](#Installation)
2. [Configuration](#Configuration)
3. [Running](#Running)

---

### Installation

Ansible runs on your local machine and sends commands to the remote (machine learning) machines. You'll need ansible installed locally (not on the machine learning boxes). 
For macOS users, the easiest way to install Ansible is via [Homebrew](https://brew.sh/):

```bash
$ brew install ansible
```

If that's not your cup of tea, install Ansible by following the directions for your machine [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine).

---

### Configuration

Gather the following:

- SSH key or user credentials for the remote account

  **Note:** Ansible does not expose a channel to allow communication between the user and the ssh process to accept a password manually to decrypt an ssh key when using the ssh connection plugin (which is the default). The use of `ssh-agent` is highly recommended.

- List of servers you wish to manage:
  - hostnames/IP addresses
  - SSH port
  - usernames

Copy [hosts.example] to `/etc/ansible/hosts` (if it does not already exist). Populate the `hosts` file (no extension) with the information about the servers you gathered above.

Confirm that you have populated your Ansible hosts file correctly:

```bash
$ ansible-inventory --list
```

---

### Running

Once you're satisfied that you correctly populated your `hosts` file, update the `- hosts:` line of [tensorflow.yml] to reflect the hosts or groups you want to configure.

Examples:

- Apply against a single host defined as `ml2` in `/etc/ansible/hosts`:
  ```yaml
  - hosts: ml2
  ```
- Apply against a group of hosts defined as `production` in `/etc/ansible/hosts`:
  ```yaml
  - hosts: production
  ```
- Apply against all hosts defined in `/etc/ansible/hosts`:
  ```yaml
  - hosts: all
  ```

Then, when you're ready, run the playbook:

```bash
$ ansible-playbook tensorflow.yml --ask-become-pass
```

**Note:** You must have `sudo` access to run the playbook!

Review the output:

- `[ok]` means no change (this task was already completed)
- `[changed]` means the task successfully ran and the change was applied
- `[unreachable]` means the host could not be reached
- `[failed]` means the task ran but failed to complete

`[ok]` and `[changed]` are successful outcomes. Any `[unreachable]` and `[failed]` outputs should be investigated and resolved.

**Note:** This Ansible playbook is idempotent; once a configuration has been successfully applied, if you apply it again, all actions will report `[ok]`.

## Executing Tensorflow Jobs in Your New Environment

1. Login to the remote machine.
2. Drop yourself into the shell on a Python 3 GPU-based Tensorflow container:
  ```bash
  $ docker run --runtime=nvidia -it tensorflow/tensorflow:latest-gpu-py3 bash
  ```
3. Profit!

TODO: Add specifics on how to map volumes and run notebooks once discussed and agreed.

**Note:** You must be a member of the `docker` group or have `sudo` access to run Docker commands.
