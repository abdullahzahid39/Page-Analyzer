pipeline {
    agent any
    tools {
        // Specify the Git tool explicitly
        git 'Default'
    }
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
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install Python, Poetry, and PostgreSQL
                script {
                    
                    sh 'sudo apt-get update -y'
                    sh 'sudo apt-get install -y python3 python3-venv python3-pip'
                    sh 'curl -sSL https://install.python-poetry.org | sudo python3 -'
                    sh 'poetry --version'
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    '''
                }
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
