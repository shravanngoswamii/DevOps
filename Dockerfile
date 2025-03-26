FROM ubuntu:latest

# Install dependencies
RUN apt update && \
    apt install -y ansible git && \
    mkdir -p /workspace/ansible

WORKDIR /workspace/ansible

# Copy playbook
COPY ansible/ /workspace/ansible/

# Run Ansible
CMD ["ansible-playbook", "-i", "inventory.ini", "playbook.yml"]