require 'aws-sdk-s3'
require 'openssl'

key = OpenSSL::PKey::RSA.new(1024)
bucket = 'encrypt-client-fun-clds'
ob_key = 'hello.txt'

# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1, # the key_wrap_schema must be rsa_oaep_sha1 for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # use :v2_and_legacy to allow reading/decrypting objects encrypted by the V1 encryption client
)

# round-trip an object, encrypted/decrypted locally
s3.put_object(bucket:bucket, key:ob_key, body:'handshake')
resp = s3.get_object(bucket:bucket, key:ob_key).body.read
#=> 'handshake'
puts resp

# reading encrypted object without the encryption client
# results in the getting the cipher text
Aws::S3::Client.new.get_object(bucket:bucket, key:ob_key).body.read
#=> "... cipher text ..."