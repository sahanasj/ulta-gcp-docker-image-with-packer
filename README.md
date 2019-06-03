# GCP Docker/Container Image Management and Hardening through CICD Pipeline
This is a repo for Docker image creation using Packer and CICD build for docker image using Jenkins on Google Cloud Platform

# 1. Build a Docker base image using Dockerfile

| Config-file | Description |
|-------------|-------------|
| [Dockerfile](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/Dockerfile)<br> | To create a Docker base image with OpenJDK, packer package & SSH for Jenkins Slave/agent node configuration  |
| [Build-Base-Docker-Image-cmds](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/Build-Base-Docker-Image-cmds)<br> | Commands to build Base Docker image and push to your Docker hub account  |

# 2. Manually Build a Ulta Golden Docker image and upload an artifact to Google container registry using Packer Script

| Config-file | Description |
|-------------|-------------|
| [Packer.json](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/packer.json)<br> | To create/build a Golden Docker base image with ulta's quazi packages  |

* Commands to manually build GKE - Golden Docker image using packer
Step 1: Make sure, you have Team Libraries(**install-package.sh** shell script) and Python packages(**python_requirements.txt**) are specified under "teams" folder.

Step 2:**cat packer.json**

Step 3: To validate packer script <br>
**$ ./packer validate packer.json**

Step 2: To build using packer script <br>
**$ ./packer build -var "image_name=<your-image-type>" -var "team_name=<quazi-or-ccp>" -var "project_id=<your-project-id>" -var "gcp_container_reg_name=<gcp-container-reg-name>" -var "docker_hub_id=<your_docker_hub_id>" -var "docker_hub_password=<your_docker_hub_password>" packer.json**

Example outputs from Packer script

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/1-packer-image-build.PNG)

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/2-packer-image-build.PNG)

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/3-packer-image-build.png)

# 3. Automate CICD pipeline to build a Ulta Golden Docker image using Jenkins:

| Config-file | Description |
|-------------|-------------|
| [Packer.josn](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/packer.json)<br> | Automate CICD to create/build a Golden Docker base image with ulta's quazi packages  |
| [configure-docker-host](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/configure-docker-host)<br> | On docker host, to expose docker’s TCP port so DockerPlugin can access docker host and create build slave container  |

* Step 1: Integrate/Configure Jenkins with Github repo and Google cloud platform.
* Step 2: Configure Jenkins with required plugins
* Step 3: Configure Jenkins slave/agent node
* Step 4: Create a GCP firewall rule for Docker TCP port 
* Setp 5: Create a jenkins job to build process for docker golden image

GCP Firewall Rule to docker’s TCP port:

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/GCP-firewall-for-docker-host.PNG)

* Command to build GKE - Golden Docker image using automation

**$ packer build -var "build_number=$BUILD_NUMBER" -var "job_name=$JOB_NAME" -var "team_name=quazi" packer.json**

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/15-jenkins-job-running-success.png)

# 4. CICD for creation of Docker image and upload to Google container registry.

**Verification on Google Container Registry**

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/5-google-container-registry.png)

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/6-google-container-registry.png)

# Multi Team Automated Image Creation Usage:

# For Quazi Team:
**$ packer build -var "build_number=$BUILD_NUMBER" -var "job_name=$JOB_NAME" -var "team_name=quazi" packer.json**

# For CCP Team:
**$ packer build -var "build_number=$BUILD_NUMBER" -var "job_name=$JOB_NAME" -var "team_name=ccp" packer.json**
