# Ansible Demo: Deploying a Static Website to GitHub Pages

This project demonstrates how to use Ansible, Jinja2 templates, and Docker to automate the deployment of a static website to GitHub Pages.

## Features
- Automated deployment using GitHub Actions
- Ansible for configuration management
- Jinja2 templating for dynamic HTML generation
- Docker for consistent execution environment
- Secure configuration management with Ansible Vault

## Project Structure
```sh
ansible-demo/
├── .github/workflows/ansible.yml  # GitHub Actions workflow for deployment
├── Dockerfile                     # Containerizes Ansible execution
├── README.md                      # Project documentation
└── ansible/
    ├── inventory.ini               # Ansible inventory file (local)
    ├── playbook.yml                # Defines deployment tasks
    ├── roles/
    │   └── deploy/
    │       ├── tasks/main.yml       # Deployment steps using Ansible
    │       ├── templates/index.html.j2  # Jinja2 template for the website
    ├── secrets.yml                  # Encrypted secrets (e.g., GitHub token)
    └── static/index.html             # Static fallback page
```

## Running the Deployment Locally
Ensure Docker is installed, then run:
```sh
docker build -t ansible-deploy .
docker run --rm ansible-deploy
```

## GitHub Actions Workflow
On every push to the `main` branch, the pipeline:
1. Checks out the repository.
2. Builds and runs Ansible inside Docker.
3. Pushes the generated website to the `gh-pages` branch.

## Customization
- Modify [`ansible/roles/deploy/templates/index.html.j2`](ansible/roles/deploy/templates/index.html.j2) for custom page content.
- Update Ansible variables inside [`ansible/roles/deploy/tasks/main.yml`](ansible/roles/deploy/tasks/main.yml) as needed.

## Security: Ansible Vault
Encrypt sensitive credentials using:
```sh
ansible-vault encrypt ansible/secrets.yml
```
Edit later with:
```sh
ansible-vault edit ansible/secrets.yml
```

## License
This project is open-source under the [MIT License](LICENSE).
