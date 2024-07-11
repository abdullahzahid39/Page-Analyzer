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
        stage('Install Dependencies') {
            steps {
                // Install dependencies from requirements.txt
                sh '''
                sudo apt-get update
                sudo apt-get install -y python3 python3-venv python3-pip
                python3 -m venv venv
                source venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
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
