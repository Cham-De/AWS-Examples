Import-Module AWS.Tools.S3

$region = "ap-south-1"
$BucketName = Read-Host -Prompt 'Enter the s3 bucket name'

Write-Host "Aws region : $region"
Write-Host "s3 bucket: $BucketName"

function BucketExists {

    $bucket = Get-S3Bucket -BucketName $BucketName -ErrorAction SilentlyContinue

    if ($bucket) {
        return $bucket
    } else {
        return $null
    }
}

if (-not (BucketExists)){
    Write-Host "Bucket does not exist"
    New-S3Bucket -BucketName $BucketName -Region $region
}
else{
    Write-Host "Bucket already exists"
}

#creating a new file

$fileName = "hello.txt"
$fileContent = "this is a new file"

Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $BucketName -Key powerfile1 -File $fileName