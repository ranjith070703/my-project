pipeline {
    agent any

    environment {
        MINIKUBE_HOME = "${WORKSPACE}/.minikube"
    }

    stages {
        stage('Start Minikube') {
            steps {
                echo "🚀 Starting Minikube..."
                bat 'minikube delete --purge'
                bat 'minikube start --driver=docker --force'
            }
        }

        stage('Point Docker to Minikube') {
            steps {
                echo "🔗 Pointing Docker to Minikube..."
                bat 'minikube -p minikube docker-env --shell powershell | Invoke-Expression'
            }
        }

        stage('Build Docker Images') {
            steps {
                echo "🛠️ Building backend and frontend images..."
                bat 'docker build -t backend:latest ./backend'
                bat 'docker build -t frontend:latest ./frontend'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "📦 Applying Kubernetes manifests..."
                bat 'kubectl apply -f fullstack-deployment.yaml'
            }
        }

        stage('Wait for Pods') {
            steps {
                echo "⏳ Waiting for pods to be ready..."
                bat 'kubectl rollout status deployment/backend-deployment'
                bat 'kubectl rollout status deployment/frontend-deployment'
                bat 'kubectl get pods'
            }
        }

        stage('Show Frontend URL') {
            steps {
                echo "🌐 Frontend URL:"
                bat 'minikube service frontend-service --url'
            }
        }
    }

    post {
        always {
            echo "✅ CI/CD pipeline finished!"
        }
    }
}
