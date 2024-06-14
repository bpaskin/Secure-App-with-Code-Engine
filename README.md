# Securing an application using IBM Code Engine and Cloud App ID

With IBM [Code Engine](https://www.ibm.com/products/code-engine) the communications from the endpoint to the pod are encrypted with SSL encryption.  An [Istio](https://istio.io) container is injected into the pod as a sidecar and then the relevant information is passed to the application container.  Applications that want authentication and authorization can implement it themselves.  This examples shows setting up a Liberty web application that interactions with IBM [Cloud App ID](https://www.ibm.com/products/app-id) using [OAuth](https://oauth.net) to authentice users, though it can be any method, like DB or file store, etc.  IBM Cloud App ID does offer other methods to [secure applications](https://cloud.ibm.com/docs/appid?topic=appid-adding-overview) at a higer level, like at the Istio or network ingress level.

----
## Getting started

1. An [IBM Cloud account](https://cloud.ibm.com/login) is required.  Signup is free, and the example can run for free too using the Code Engine free tier.
2. The [IBM Cloud CLI](https://www.ibm.com/products/cli) needs to be downloaded and installed on your system.
3. The Code Engine and Countainer registry plugins for the CLI need to be installed.
```
ibmcloud plugin install code-engine
ibmcloud plugin install container-registry
```
---
## Creating the necessary resources
1. Logon to the IBM Cloud
```
ibmcloud login -u <username>
```
2. List resource groups
```
ibmcloud resource groups
```
3. Choose one of the resource groups fromt he last command
```
ibmcloud target -g <resource group>
```
4. List available regions
```
ibmcloud regions
```
5. Select a region to host the Code Engine project and resources
```
ibmcloud target -r <region name>
```
---
## Code Engine Time
1.  Create a Code Engine project
```
ibmcloud ce project create --name Secure
```
2. Select the project to use
```
ibmcloud ce project select --name Secure
```
3. Deploy the application by using the Dockerfile.  You may have to add the CE_HOST information later
```
ibmcloud ce app create --name secure --build-source https://github.com/bpaskin/Secure-App-with-Code-Engine.git --build-context-dir . -e CE_HOST=secure.<identfier.region>.codeengine.appdomain.cloud
```
4. Using your browser test the application
```
 https://secure.<from listing>.codeengine.appdomain.cloud
```
---
## Setup Cloud App ID
1. Logon to the IBM Cloud, Select the hamburder menu in the top left and then select `Browser all services...` from the list.
   
![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/1-Browse%20all%20services.png)

2. Select the App ID square from the available services
   
![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/2-App%20Id%20Service.png)

3. If there is currently no instance available, select the Lite plan, check the terms and conditions box and hit the `create` button
   
![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/3-Create%20App%20Id%20Instance.png)

4. Download the sample program
   
![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/6-Download%20Sample.png)

5. Select the Java program so it create an application automatically for you, otherwise you will need to add an application later and chaneg the Liberty configuration
    
![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/7-Download%20Java%20.png)

6. From the main page select `Manage Authentication` from the list, and keep only the `Cloud Directory` enabled.
    
![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/4-Enable%20signon%20features.png)

7. Click on the `Authentication settings` tab and add the URL that was given to you for the deployed secure application and add a `/*` at the end.
```
(i.e., https://secure.<identfier.region>.codeengine.appdomain.cloud/*
```

![image](https://github.com/bpaskin/Secure-App-with-Code-Engine/blob/main/images/5-Add%20%20web%20redirect%20url.png)

8. test you application!

𐕣 Funeral Winter 𐕣
