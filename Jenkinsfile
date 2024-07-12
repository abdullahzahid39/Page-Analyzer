pipeline {
    agent any

    tools {
        git 'Default' // Use Git tool
    }

    triggers {
        githubPush() // Trigger on GitHub push events
    }

    environment {
        DEPLOY_DIR = '/home/abdullah/docker-test'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install Python dependencies
                    sh '''
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    '''
                }
            }
        }

         stage('Deploy') {
            steps {
                // Copy files to deployment directory
                sh """
                cp -r * ${DEPLOY_DIR}
                echo 'Deployment completed.'
                """
            }
        }
        


    post {
        success {
            echo 'Build and deployment successful.'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
