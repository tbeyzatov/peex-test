pipeline {
    agent {
        node {
            label 'main-node'
        }
    }

    stages {

        
        // EXISTING STAGES (Modified for Jenkins)
        stage('Build and Test') {
            steps {
               sh 'cowsay "Build Successful!"'

            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
