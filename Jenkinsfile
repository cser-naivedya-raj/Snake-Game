Jenkinsfile
pipeline {
    agent any

    environment {
        IMAGE_NAME = "snake-game"
        CONTAINER_NAME = "snake-container"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/cser-naivedya-raj/Snake-Game'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Remove Old Container') {
            steps {
                bat 'docker rm -f %CONTAINER_NAME% || exit 0'    
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run -d --name %CONTAINER_NAME% %IMAGE_NAME%'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
