## Create a bucket

aws s3 mb s3://encryption-fun-clds

## Upload  a file

echo "hello encryption fun here" > enchello.txt
aws s3 cp enchello.txt s3://encryption-fun-clds

## Put object with SSE-KMS

aws s3api put-object \
--bucket encryption-fun-clds \
--key enchello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id 55263fbc-6497-476b-b9aa-0bf9f9f5340b \
--body enchello.txt

## Put object with SSE-C

### Generate a 32-byte encryption key

export ENCRYPTION_KEY=$(openssl rand -base64 32)

### Compute the MD5 hash of the encryption key (base64 encoded)

export ENCRYPTION_KEY_MD5=$(echo "$ENCRYPTION_KEY" | md5sum | awk '{print $1}' | base64 -w0)

aws s3api put-object \
--bucket encryption-fun-clds \
--key enchello.txt \
--body enchello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $encKey \
--sse-customer-key-md5 $md5Key

$ aws s3api put-object \
  --body /etc/magic \
  --bucket <bucket_name> \
  --key encrypt_magic \
  --sse-customer-algorithm AES256 \
  --sse-customer-key $encKey \
  --sse-customer-key-md5 $md5Key

ENCRYPTION_KEY=$(cat encryption.key | base64 --decode)
ENCRYPTION_KEY_MD5=$(echo -n "$ENCRYPTION_KEY" | openssl dgst -md5 -binary | base64)

export secret=$(openssl rand 32)
export encKey=$(echo -n $secret | base64)
export md5Key=$(echo -n $secret | openssl dgst -md5 -binary | base64)

