# ulta-gcp-docker-image-with-packer
This is a repo for Docker image creation using Packer and CICD build for docker image using Jenkins on Google Cloud Platform

# GCP Docker/Container Image Management and Hardening through CICD Pipeline

* Build a Docker image using packer <br/>
* Build CICD pipeline for Docker image using Jenkins

Manually create GKE Docker image using packer:

$ packer build -var "team_name=quazi" packer.json

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/1-packer-image-build.PNG)

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/2-packer-image-build.PNG)

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/3-packer-image-build.PNG)

Automate CICD for GKE Docker image using Jenkins:

$ packer build -var "build_number=$BUILD_NUMBER" -var "job_name=$JOB_NAME" -var "team_name=quazi" packer.json

![alt text](https://github.com/sahanasj/ulta-gcp-docker-image-with-packer/blob/master/screenshots/15-jenkins-job-running-success.png)

# Multi Team Automated Image Creation Usage:

# For Quazi Team:
$ packer build -var "build_number=$BUILD_NUMBER" -var "job_name=$JOB_NAME" -var "team_name=quazi" packer.json

# For CCP Team:
$ packer build -var "build_number=$BUILD_NUMBER" -var "job_name=$JOB_NAME" -var "team_name=ccp" packer.json
