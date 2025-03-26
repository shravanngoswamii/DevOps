FROM ubuntu:latest

# Install dependencies
RUN apt update && \
    apt install -y ansible git && \
    mkdir -p /ansible

WORKDIR /ansible

# Copy playbook
COPY ansible/ /ansible/

# Run Ansible
CMD ["ansible-playbook", "-i", "inventory.ini", "playbook.yml"]
