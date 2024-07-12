pipeline {
    agent any
    
    tools {
        git 'Default' // Use Git tool
    }
    
    triggers {
        githubPush() // Trigger on GitHub push events
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
                script {
                    // Install Python dependencies
                    sh '''
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    '''
                }
            }
        }
        
        stage('Build Docker Compose') {
            steps {
                script {
                    // Build Docker Compose services
                    sh "docker-compose build"
                }
            }
        }
        
        stage('Deploy Docker Compose') {
            steps {
                script {
                    // Ensure any previous container is removed
                    sh '''
                    docker-compose down || true
                    '''
                    
                    // Run Docker Compose services
                    sh '''
                    docker-compose up -d
                    '''
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
