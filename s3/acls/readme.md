## Create a new bucket

```sh
aws s3api create-bucket \
--bucket acl-example-clds \
--region ap-south-1 \
--create-bucket-configuration LocationConstraint=ap-south-1
```

## Turn off block public access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-example-clds \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```
## Retrieve block public access settings

```sh
aws s3api get-public-access-block --bucket acl-example-clds
```

## Enable ACLs by changing object ownership settings

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-clds \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Check ACLs

```sh
aws s3api get-bucket-acl --bucket acl-example-clds
```

## Change ACLs to add another AWS account

```sh
aws s3api put-bucket-acl --cli-input-json file://acl.json
```

## Access bucket from other account

```sh
aws s3 ls s3://acl-example-clds
```

## Cleanup

```sh
aws s3 rb s3://acl-example-clds --force 
```