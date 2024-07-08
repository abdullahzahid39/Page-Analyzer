pipeline {
    agent any

    environment {
        VENV = 'venv'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                 git branch: 'main', url: 'https://github.com/abdullahzahid39/Page-Analyzer.git'
            }
        }

        stage('Setup Python') {
            steps {
                // Install Python and create virtual environment
                sh '''
                python3 -m venv $VENV
                source $VENV/bin/activate
                python -m pip install --upgrade pip
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies
                sh '''
                source $VENV/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh '''
                source $VENV/bin/activate
                pytest
                '''
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application
                sh '''
                source $VENV/bin/activate
                # Add your deployment script/command here
                # For example, if you use a specific deployment tool or script:
                # ./deploy.sh
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
