require "aws-sdk-s3"
require "pry"
require "securerandom"

bucket_name = ENV['BUCKET_NAME']
region = "ap-south-1"

client = Aws::S3::Client.new

resp = client.create_bucket({
  bucket: bucket_name, 
  create_bucket_configuration: {
    location_constraint: region, 
  }
})

#binding.pry -------to interactively check the session responses mid-execution

#create a file to put into bucket
file_name = '/tmp/example.txt'
text_to_write = "Hello, this is a sample text written to a file using Ruby!"

File.open(file_name, 'w') do |file|
  file.write(text_to_write)
end

puts "Text has been written to #{file_name}."

resp_put_object = client.put_object({
  body: File.open(file_name, 'rb'), 
  bucket: bucket_name, 
  key: "example.txt", 
})
