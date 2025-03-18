## Create new bucket

```sh
aws s3 mb s3://bucket-policy-example-clds
```

## Upload bucket policy

```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-clds --policy file:///workspace/AWS-Examples/s3/bucket-policies/policy.json
```

## Cleanup

```sh
aws s3 rm s3://bucket-policy-example-clds/hellome.txt
aws s3 rm s3://bucket-policy-example-clds/policytest.txt
aws s3 rb s3://bucket-policy-example-clds
```