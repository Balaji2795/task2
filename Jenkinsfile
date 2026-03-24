pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "your-dockerhub-username/myapp"
        DOCKER_TAG = "latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-repo.git'
            }
        }

        stage('Build Artifact') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-password', variable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u your-dockerhub-username --password-stdin'
                }
            }
        }

        stage('Push to Docker Repo') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }
    }
}
