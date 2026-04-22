pipeline {
    agent any 
    tools {
        // The name must match exactly what you configured in Step 1
        nodejs 'NodeJS'
    }
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

 

        // NEW STAGE 2: Packaging
        stage('Packaging') {
            steps {

            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
