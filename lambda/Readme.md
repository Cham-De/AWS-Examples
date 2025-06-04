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
sam deploy \
--template-file template.yaml \
--stack-name "my-basic-lambda" \
--s3-bucket "aws-sam-cli-managed-default-samclisourcebucket-cpiqzeb6knxm" \
--capabilities CAPABILITY_IAM \
--region ap-south-1 \
--no-confirm-changeset \
--no-fail-on-empty-changeset