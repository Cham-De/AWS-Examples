## Create a new bucket

```sh
aws s3 mb s3://cors-fun-clds
```
## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-fun-clds \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-fun-clds --policy file:///workspace/AWS-Examples/s3/cors/bucket-policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-fun-clds --website-configuration file://website.json
```

## Upload index.html and include a resource that would be the cross-origin

```sh
aws s3 cp index.html s3://cors-fun-clds
```
## View website endpoint

http://cors-fun-clds.s3-website.ap-south-1.amazonaws.com
or (based on region)
http://cors-fun-clds.s3-website-ap-south-1.amazonaws.com

## Apply a CORS policy