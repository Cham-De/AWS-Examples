## Create a user with no permissions for demonstration 

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```
Add the credentials to the credential file (~/.aws/credentials) created by aws configure, by entering the access key values to the prompt

```sh
aws configure
```
Edit the credentials file and replace [default] with [sts] and check who you are 

```sh
aws sts get-caller-identity --profile sts 
```
Confirm that new user do not have permissions to services, ex: s3

```sh
aws s3 ls --profile sts
```

## Create a role

Create the resources with cloudformation

```sh
source /bin/deploy # A script w/ cloudformation cli command for deploying
```

## Use the new user and assume role

Attach the assumerole policy to the user to give permissions to switch to a role

```sh
aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::647264525674:role/my-sts-fun-stack-MyStsRole-T22CLZgmGl9a \
--role-session-name s3-sts-fun \
--profile sts
```
Update the credentials file by including the temporary credentials provided for the assumed role by sts

```sh
open ~/.aws/credentials
```

Confirm the assumed role

```sh
aws sts get-caller-identity --profile assumed
```

## Cleanup

Remove resources

```sh
aws cloudformation delete-stack --stack-name my-sts-fun-stack
```

Need to delete attached policy and access keys before deleting the user

```sh
aws iam delete-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy
```
```sh
aws iam delete-access-key \
--access-key-id AKIAZNM7Y3VVIAGONS4G \
--user-name sts-machine-user
```
```sh
aws iam delete-user --user-name sts-machine-user
```