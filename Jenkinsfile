pipeline {
    agent any 

    options {
       disableConcurrentBuilds()
       retry(2)
       timeout(time: 1, unit: 'SECONDS')
    }
    environment {
       name = 'saikiran'
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
        stage('printing the env variable') {
            steps {
                sh """
                    echo "$name"
                """
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