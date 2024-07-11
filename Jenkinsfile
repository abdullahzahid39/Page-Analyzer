pipeline {
    agent any
    triggers {
        githubPush()
    }
    environment {
        DEPLOY_AGENT = 'deploy-agent' 
        DEPLOY_DIR = '/home/abdullah/test' 
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/abdullahzahid39/Page-Analyzer.git'
            }
        }
        stage('Build') {
            steps {
                // Add build steps here
                sh 'echo "Building the project..."'
                // Example: npm install or other build commands
                sh 'npm install'
            }
        }
        stage('Deploy') {
            agent {
                label "${env.DEPLOY_AGENT}"
            }
            steps {
                // Add deploy steps here
                sh """
                cp -r * ${DEPLOY_DIR}
                echo "Deployment completed."
                """
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
