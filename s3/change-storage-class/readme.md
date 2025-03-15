## Create a bucket

aws s3 mb s3://class-fun-clds

## Create a file

echo "Hello world" > hello.txt
aws s3 cp hello.txt s3://class-fun-clds

## Change storage class

aws s3 cp hello.txt s3://class-fun-clds --storage-class STANDARD_IA

## Cleanup
aws s3 rm s3://class-fun-clds/hello.txt
aws s3 rb s3://class-fun-clds