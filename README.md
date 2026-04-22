This document provides setup instructions and requirements for running your current Jenkins pipeline, which utilizes a specific node label and the cowsay utility.
Pipeline Overview
The pipeline is configured to run on a specific agent labeled main-node and executes a single stage that outputs a "Build Successful!" message using the cowsay character.
Prerequisites
1. Node Configuration
The pipeline will remain in a "Pending" state unless you have an agent configured with the correct label.
Label Required: main-node
Verification: Go to Manage Jenkins > Nodes, select your node, and ensure main-node is listed in the Labels field.
2. Software Requirements
Since the pipeline calls /usr/games/cowsay, the utility must be installed on the main-node agent.
Installation (Debian/Ubuntu):
bash
sudo apt-get update && sudo apt-get install -y cowsay
Use code with caution.
Pathing: The pipeline uses the absolute path /usr/games/cowsay to avoid "command not found" errors, as /usr/games/ is often excluded from the default system $PATH.
Pipeline Structure
Section	Description
Agent	Restricts execution to the node labeled main-node.
Stage: Build and Test	Executes the cowsay command via a shell script (sh).
Post: Always	Prints a completion message to the console regardless of build success or failure.
Troubleshooting
Permission Denied: If the sh step fails with a permission error, ensure the user running the Jenkins agent has execute permissions for /usr/games/cowsay.
Command Not Found: If the file is missing, verify the installation location using which cowsay or whereis cowsay on the agent machine.
Offline Node: Ensure the agent labeled main-node is connected and online in the Jenkins dashboard.
Would you like to add a failure notification to the post block to alert you if the main-node goes offline?