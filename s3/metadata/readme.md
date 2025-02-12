## Creating a bucket 
```
aws s3 mb s3://metadata-test-clds 
```

## Uploading an object with metadata
```
aws s3api put-object --bucket metadata-test-clds --key newfile.txt --body test_metadata.txt --metadata Planet=earth
```

## Check object metadata
aws s3api head-object --bucket metadata-test-clds --key newfile.txt