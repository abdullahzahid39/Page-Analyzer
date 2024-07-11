pipeline {
    agent {
        label 'Built-In Node'
    }
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
            agent {
                label "Built-In Node"
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
