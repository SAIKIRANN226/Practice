pipeline {
    agent any 

    environment {
        sh """
            env
        """
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the code..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the code..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the code'
            }
        }
    }
    
    post {
        always {
            echo 'I will always say hello'
        }
        success {
            echo 'This will run if pipeline is success'
        }
        failure {
            echo 'This will run if pipeline fails'
        }
    }
}