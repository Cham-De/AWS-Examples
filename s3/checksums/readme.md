## Create s3 bucket

```
aws s3 mb s3://checksums-example-bucket-4567
```

## Create a new file to create a checksum on

```
echo "hello checksum world!" > myfilechecksum.txt
```

## Get a chcksum of a file with MD5

```
md5sum myfilechecksum.txt
```

## Upload the file to s3 and check the etag

```
aws s3 cp myfilechecksum.txt s3://checksums-example-bucket-4567
aws s3api get-object --bucket checksums-example-bucket-4567 --key myfilechecksum.txt filetosave.txt
```

## Uploading a file with a different checksum algo

```
[//]: # (need to install a package to have crc32 command)
sudo apt-get install libarchive-zip-perl
crc32 myfilechecksum.txt

aws s3api put-object --bucket checksums-example-bucket-4567 --checksum-algorithm SHA-1 --checksum-sha1 ebc23f5e3719a3a4152326ffbfb672b7453416cc --key myfilechecksumcrc.txt --body myfilechecksum.txt
```