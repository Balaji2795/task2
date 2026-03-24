pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://your-repo-url.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("instagram-clone")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker stop insta-container || true'
                    sh 'docker rm insta-container || true'
                    sh 'docker run -d -p 8080:80 --name insta-container instagram-clone'
                }
            }
        }
    }
}
