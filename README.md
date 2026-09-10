# How to run
1. Add new file from template
![image1](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image1.png?raw=true)

2. Search for configuration file and than click next
![image2](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image2.png?raw=true)

3. Rename the file to Development.xcconfig and than click create
![image3](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image3.png?raw=true)

4. Open the Development.xcconfig file and that type the code:
```bash
API_URL = https:/$()/api.tvmaze.com/
```
![image4](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image4.png?raw=true)

5. Click TV App file and click the TV App project (not target)
![image5](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image5.png?raw=true)

6. Expand debug and release dropdown
![image6](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image6.png?raw=true)

7. Change the configuration to Development.xcconfig
![image7](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image7.png?raw=true)

8. Go to TV App Target and than navigate to info/info.plist. After that add key "API_URL" and value "$(API_URL)"
![image8](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image8.png?raw=true)

9. After that, run the App
![image9](https://github.com/ariefrnr/TV-App/blob/develop/TV-App/images/image9.png?raw=true)
