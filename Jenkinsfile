pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning repository...'
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
                bat 'kubectl apply -f fullstack-deployment.yaml'
            }
        }

    }
}
