pipeline {
    agent {
        node {
            label 'main-node'
            customWorkspace '/var/lib/jenkins/my-project'
        }
    }

    stages {
       stage('Setup Dependencies') {
           steps {
              // Example for a Debian-based agent
                sh 'apt-get update && sudo apt-get install -y httpd'
            }
        }
        // EXISTING STAGES (Modified for Jenkins)
        stage('Build and Test') {
            steps {
               sh 'apt install cowsay'

            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
