# The `jupyter` Role

The `jupyter` role installs the TensorFlow GPU Python3 container and launches the Jupyter Notebook.

This role may be executed independently by running:

```bash
$ ansible-playbook tensorflow.yml --tags "jupyter"
```

On execution, this role executes a single instance of the following container:

### Docker Container

- Image: `arricor/tensorflow`
- Name: `jupyter`
- Tag: `1.12.0-gpu-py3`
- Published Port Mappings: `8888`(Host) -> `8888`(Container)
- Volumes:
  - Data Volume: (value of `secrets.volumes.data`), e.g., `/nfs/data:/data`
  - Source Volume: (value of `secrets.volumes.source`), e.g., `/nfs/src:/notebooks`

The role checks to see if a container by the given name exists before attempting to launch a new instance. If so, no attempt is made.

**Note:** The ability to define the container runtime is not provided in the Ansible 2.17 Docker module. This feature has been merged into the Ansible 2.18 codebase, scheduled for release on 02 May 2019. Once Ansible 2.18 is released, the commented `docker` module in [tasks/main.yml](tasks/main.yml) should be used instead of the current workaround based on the `command` module, as the `docker` module is more robust.
