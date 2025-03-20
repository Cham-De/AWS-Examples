# Create website 

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

## Apply CORS policy

```sh
aws s3api put-bucket-cors --bucket cors-fun-clds --cors-configuration file://cors.json
```

# The server side

## Create API Gateway with mock response and test the API endpoint

```sh
curl -X POST -H "Content-Type: application/json" https://9ez68u2ty2.execute-api.ap-south-1.amazonaws.com/prod/my-resource
```

### Reflections

The cors policy did not allow the above request, with the error 'Access-Control-Allow-Origin' not allowing the origin to request the resource from the API. Despite many efforts with different settings, the error persists.