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

    parameters {
        string(name: 'PERSON', defaultValue: 'saikiran', description: 'hello saikiran how are you man ?')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
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
        stage('testing parameters with string values') {
            steps {
                echo "${params.PERSON}"
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