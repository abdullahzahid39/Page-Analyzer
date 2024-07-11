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
                    sh '''
                    apt-get update -y
                    apt-get install -y python3 python3-venv python3-pip
                    curl -sSL https://install.python-poetry.org | python3 -
                    poetry --version
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
