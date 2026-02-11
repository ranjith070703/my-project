pipeline {
    agent any

    environment {
        MINIKUBE_HOME = "${WORKSPACE}/.minikube"
        // Use Docker inside Minikube
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                echo "📥 Cloning GitHub repository..."
                git branch: 'main', url: 'https://github.com/ranjith070703/my-project.git'
            }
        }

        stage('Start Minikube') {
            steps {
                echo "🚀 Starting Minikube..."
                sh '''
                minikube start --driver=docker
                eval $(minikube docker-env)
                '''
            }
        }

        stage('Build Backend Image') {
            steps {
                echo "🔨 Building backend image..."
                sh 'docker build -t backend:latest ./backend'
            }
        }

        stage('Build Frontend Image') {
            steps {
                echo "🔨 Building frontend image..."
                sh 'docker build -t frontend:latest ./frontend'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "📦 Applying Kubernetes manifests..."
                sh 'kubectl apply -f k8s/'
            }
        }

        stage('Restart Deployments') {
            steps {
                echo "♻️ Restarting backend/frontend deployments..."
                sh 'kubectl rollout restart deployment backend-deployment'
                sh 'kubectl rollout restart deployment frontend-deployment'
            }
        }

        stage('Verify') {
            steps {
                echo "✅ Checking pods and services..."
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }

    post {
        always {
            echo "🚀 CI/CD Pipeline finished!"
        }
    }
}
