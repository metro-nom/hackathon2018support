# hackathon2018support
Support scripts and tools for our hackathon in 2018.

## Create the jenkins Docker image
- Take care that docker is installed on your machine
- run the script createDockerImage.sh to create the image robojenkins on your machine


## Start Jenkins and configure
- Open the file startJenkinsInDocker.sh and set the path for the directory of jenkins ( I'd change the folder to be {PATH/TO/YOUR/DIRECTORY} rather than JK.
- Run the script startJenkinsInDocker.sh to start the jenkins server
- When you run the script the first time, you have to configure it
- Open localhost:8080
- get the password from jenkins home {PATH/TO/YOUR/DIRECTORY}/secrets/defaultAdminPassword
- Select install default plugins
- Create a new account with the username admin (Please do not use a diffrent user because the scripts have the user admin hardcoded)
- install the plugin Build Monitor View (Manage Jenkins -> Manage Plugins -> Available -> Search for Build Monitor View -> Install plugin)
- Restart after plugin was installed

## Create the Jenkins jobs for all coders
- edit the file createJenkinsJobs.sh
- Change the path to the file of the different github projects, provided by Thomas //maybe we should provide a default list packaged in this repo as well. because i have no idea what to create now.
- Add the apiToken from the admin user of jenkins (Manage Jenkins -> Manage Users -> admin -> Configure -> Show API Token)
- Change the path to the jenkinsConfigTemplate.xml //this file is missing , update: it's provided by you
- Change the value of the location such that only the projects from your location will be used
- run the script
- Create a view for all jobs to show up for the audience
- Go to My Views and create a Build Monitor view with all projects

## Run the bettle for all robots
- Edit the script runTestFights.sh
- Change the path to your jenkins workspace
- Change the path to your robocode folder
- Run the Script to start the battle

