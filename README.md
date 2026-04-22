# Jenkins Cowsay Pipeline

This repository contains a Jenkins pipeline designed to run on a dedicated build agent to perform build tasks and provide visual feedback using the `cowsay` utility.

## 🚀 Pipeline Configuration

### Agent Requirements
This pipeline is restricted to run only on nodes matching the following criteria:
*   **Label:** `main-node`

Ensure your Jenkins agent is configured with the `main-node` label under **Manage Jenkins > Nodes > [Node Name] > Labels**.

### Prerequisites
The agent must have `cowsay` installed. Since this pipeline uses a Debian-based Jenkins environment, install it via:

```bash
# Run on the 'main-node' agent
sudo apt-get update
sudo apt-get install -y cowsay
```

## 🛠 Pipeline Structure

```groovy
pipeline {
    agent {
        node {
            label 'main-node'
        }
    }

    stages {
        stage('Build and Test') {
            steps {
                // Uses the absolute path for Debian-based installs
                sh '/usr/games/cowsay "Build Successful!"'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
```

## 📋 Stages Detail

1.  **Build and Test**: 
    - Executes the shell command to display the "Build Successful!" cow. 
    - Note: The absolute path `/usr/games/cowsay` is used because `/usr/games` is typically not in the default Jenkins `$PATH`.
2.  **Post Execution**:
    - **Always**: Prints a confirmation message to the console output regardless of the build result.

## ⚠️ Troubleshooting

*   **Error: `Permission Denied`**: Ensure the `jenkins` user on the agent has execution rights for `/usr/games/cowsay`.
*   **Error: `No such file or directory`**: Verify the path by running `which cowsay` on the agent. If it's different, update the `sh` step in the Jenkinsfile.
*   **Status: `Pending - Waiting for next available executor on main-node`**: Ensure the node is online and the label matches exactly (case-sensitive).
