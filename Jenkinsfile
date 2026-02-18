pipeline {
    agent any

    environment {
        KUBECONFIG = "C:\\Users\\DELL\\.kube\\config"
    }

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning repository...'
            }
        }

        stage('Check Kubernetes Connection') {
            steps {
                bat 'kubectl config get-contexts'
                bat 'kubectl get nodes'
            }
        }

        stage('Build Backend') {
            steps {
                bat 'docker build -t backend:latest backend'
            }
        }

        stage('Build Frontend') {
            steps {
                bat 'docker build -t frontend:latest frontend'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f fullstack-deployment.yaml --validate=false'
            }
        }

    }
}
