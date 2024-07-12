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
        IMAGE_NAME = 'python-app'  // Replace with your desired Docker image name
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
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }
        
        stage('Deploy Docker Container') {
            steps {
                script {
                    // Ensure any previous container is removed
                    sh '''
                    docker rm -f my-app || true
                    '''
                    
                    // Run Docker container
                    sh '''
                    docker run -d --name my-app \
                      -v ${DEPLOY_DIR}:/code \
                      -p 8000:8000 \
                      ${IMAGE_NAME}
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
