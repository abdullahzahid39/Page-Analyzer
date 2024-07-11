pipeline {
    agent any  // Use any available agent
    
    tools {
        // Specify the Git tool explicitly
        git 'Default'
    }
    
    triggers {
        githubPush()
    }
    
    environment {
        DEPLOY_DIR = '/home/abdullah/test' 
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Install Python, Poetry, and PostgreSQL
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
        
        stage('Run Docker Container') {
            steps {
                // Build and run Docker container using Docker Compose
                dir(DEPLOY_DIR) {
                    sh 'docker-compose up -d'
                }
            }
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
