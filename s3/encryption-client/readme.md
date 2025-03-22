## Create new bucket

```sh
aws s3 mb s3://encrypt-client-fun-clds
```

## Run the ruby script that use the aws-sdk-s3's s3 encryption client 

```sh
bundle exec ruby encrypt.rb
```

## Cleanup

```sh
aws s3 rm s3://encrypt-client-fun-clds/hello.txt
aws s3 rb s3://encrypt-client-fun-clds
```