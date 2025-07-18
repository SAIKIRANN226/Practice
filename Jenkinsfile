pipeline {
    agent any

    environment {
        name = 'This section is to test environment nothing but like key-value pair'
    }
    options {
        disableConcurrentBuilds()
        timeout(time: 30, unit: 'SECONDS')
        ansiColor('xterm')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the code...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the code...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the code...'
            }
        }
        stage('Environment') {
            steps {
                echo "$name"
            }
        }
    }
    post {
        always {
            echo 'I will always say hello'
        }
        success {
            echo 'This will run if pipeline success'
        }
        failure {
            echo 'This will run if pipeline fails'
        }
    }
}

