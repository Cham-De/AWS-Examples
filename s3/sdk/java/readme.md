#create a new maven project specific for s3

```sh
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=AP_SOUTH_1 \
 -DarchetypeVersion=2.29.47 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp
```