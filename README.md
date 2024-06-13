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
