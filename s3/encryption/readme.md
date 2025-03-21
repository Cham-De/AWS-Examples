## Create a bucket

```sh
aws s3 mb s3://encryption-fun-clds
```

## Upload  a file

```sh
echo "hello encryption fun here" > enchello.txt
aws s3 cp enchello.txt s3://encryption-fun-clds
```

## Put object with SSE-KMS

the id from the aws managed id automatically created by s3 service

```sh
aws s3api put-object \
--bucket encryption-fun-clds \
--key enchello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id 55263fbc-6497-476b-b9aa-0bf9f9f5340b \
--body enchello.txt
```

## Upload object with SSE-C with s3api
### did upload the object with configuration but displays an internal error on the console, so did not work w/ s3api

```sh
export secret=$(openssl rand 32)
export encKey=$(echo -n $secret | base64)
export md5Key=$(echo -n $secret | openssl dgst -md5 -binary | base64)

aws s3api put-object \
--bucket encryption-fun-clds \
--key enchello.txt \
--body enchello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $encKey \
--sse-customer-key-md5 $md5Key
```

## Upload object with SSE-C, with s3

```sh
openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-fun-clds/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```

## Download object encrypted with SSE-C

```sh
aws s3 cp s3://encryption-fun-clds/hello.txt hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```