pipeline {
    agent any 

    stages {
       stage('Setup Dependencies') {
           steps {
              // Example for a Debian-based agent
                sh 'sudo apt-get update && sudo apt-get install -y libatomic1'
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
