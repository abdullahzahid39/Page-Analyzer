
pipeline {
    agent any  // Use any available agent
    
    tools {
        // Specify the Git tool explicitly
        git 'Default'
    }
    
    triggers {
        githubPush()  // Trigger on GitHub push events
    }
    
    environment {
        DEPLOY_DIR = '/home/abdullah/docker-test'  // Define deployment directory
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm  // Checkout source code from the Git repository
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Install Python dependencies from requirements.txt
                script {
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
    }  // Close stages block
    
    post {
        success {
            echo 'Build and deployment successful.'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}  // Close pipeline block
