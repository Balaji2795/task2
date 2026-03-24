pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "balaji2795/myapp"
        DOCKER_TAG = "latest"
    }

    stages {

        stage('Create Artifact') {
            steps {
                sh 'mkdir -p output'
                sh 'cp index.html output/'
                sh 'tar -cvf output/artifact.tar output/'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'output/artifact.tar', fingerprint: true
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }
    }
}
