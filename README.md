# How to run
1. Add new file from template
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image1.png?raw=true)

2. Search for configuration file and than click next
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image2.png?raw=true)

3. Rename the file to Development.xcconfig and than click create
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image3.png?raw=true)

4. Open the Development.xcconfig file and that type the code:
```bash
API_URL = https:/$()/api.tvmaze.com/
```
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image4.png?raw=true)

5. Click TV App file and click the TV App project (not target)
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image5.png?raw=true)

6. Expand debug and release dropdown
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image6.png?raw=true)

7. Change the configuration to Development.xcconfig
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image7.png?raw=true)

8. Go to TV App Target and than navigate to info/info.plist. After that add key "API_URL" and value "$(API_URL)"
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image8.png?raw=true)

9. After that, run the App
![alt text](https://github.com/ariefrnr/TV-App/blob/develop/image9.png?raw=true)
