pipeline {
    agent {
        node {
            label 'saikiran'
        }
    }
    options {
        //ansiColor('xterm')
        disableConcurrentBuilds()  
    }
    environment {
        variable = 'This is the environment variable iam testing in jenkins file'
    }
    stages {
        stage('build') {
            steps {
                echo 'Building the code...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the code...'
            }
        }
        stage('deploy') {
            steps {
                echo 'Deploying the code...'
            }
        }
        stage('env') {
            steps {
                sh """
                    echo "$variable"
                """
            }
        }
    }

    post {
        always {
            echo 'I will always say hello'
        }
        success {
            echo 'This pipeline will run only when it successed'
        }
    }
}