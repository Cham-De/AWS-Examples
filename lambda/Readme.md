## Install SAM CLI

```sh
wget "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip"
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install
sam --version
```

## Build Lmbda Function

```sh
sam build
```

## Validate the SAM template

```sh
sam validate --lint
```

## Test Lmbda Function locally

Create a test.json file matching the event parameters in handler

```sh
sam local invoke
```

## Deploy 

```sh
sam deploy \
--template-file template.yaml \
--stack-name "my-basic-lambda" \
--resolve-s3 \
--capabilities CAPABILITY_IAM \
--region ap-south-1 \
--no-confirm-changeset \
--no-fail-on-empty-changeset
```

## Install Docker Engine

for ubuntu: https://docs.docker.com/engine/install/ubuntu/

```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

verify with,

```sh
sudo docker run hello-world
```
## Deploy container image

https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-cli-command-reference-sam-deploy.html
push image to a managed repository in ECR created by SAM

```sh
sam deploy \
--template-file template.yaml \
--stack-name "my-containerized-lambda" \
--resolve-image-repos \
--capabilities CAPABILITY_IAM \
--region ap-south-1 \
--no-confirm-changeset \
--no-fail-on-empty-changeset
```

Can save the parameters in the samconfig.toml file for reuse

```sh
sam deploy \
--config-file samconfig.toml
```

## Deploying containerized function (**Without SAM / IaC**)

https://docs.aws.amazon.com/lambda/latest/dg/python-image.html

