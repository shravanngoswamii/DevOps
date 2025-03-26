pipeline {
    agent {
        docker {
            image 'cytopia/ansible:latest-tools'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Lint Ansible Playbook') {
            steps {
                sh 'ansible-lint ansible/playbook.yml'
            }
        }
    }
}