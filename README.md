#### **Step 1: Create Google Cloud private container registry**
1. Select **Container Registry** in the navigation menu, and then select **Create Repository**.
2. Click **Create** to complete the creation of the container registry.

#### **Step 2: Log in to the Google Cloud Container Registry with Docker**

1. **Install Google Cloud SDK** 
   
2. Execute the following command at the command line to authenticate:
   ```
   gcloud auth login
   gcloud config set project YOUR_PROJECT_ID //Locking the repository by ID
   gcloud auth configure-docker  //Linking docker
 
3. After executing the `gcloud auth configure-docker` command, Docker will be configured to authenticate through Google Cloud's container registry.

#### **Step 3: Build and push the Docker image**

1. Go to the project directory where the microservice code is stored and add the file `Dockerfile`.

   ```dockerfile
   # Use the official Node.js image as the base image
   FROM node:14

   # Set up a working directory
   WORKDIR /usr/src/app

   # Copy the package.json and package-lock.json files
   COPY package*.json ./

   # Install dependencies
   RUN npm install

   # Copy the source code
   COPY . .

   # Launch the application
   CMD ["node", "app.js"]

   # Open ports
   EXPOSE 8080
   ```

2. In the project root directory, open a terminal and use the following command to build the image:

   ```
   docker build -t gcr.io/PROJECT_ID/IMAGE_NAME:tag .
   ```

   PROJECT_ID is the ID of the Google Cloud project and IMAGE_NAME is the name of the image for which the image was generated.

3. Log in to the Google Cloud container registry:

   ```
   docker login -u _json_key --password-stdin https://gcr.io
   ```

4. Push the image to the Google Cloud container registry:

   ```
   docker push gcr.io/PROJECT_ID/IMAGE_NAME:tag
   ```

#### **Step 4: Verify that the image is running successfully**


1. Run the image pushed to the container registry using the following command:

   ```bash
   docker run -p 8080:8080 gcr.io/PROJECT_ID/IMAGE_NAME:tag
   ```

2. Open a browser and go to `http://localhost:8080` to verify that the microservice is running successfully.

#### **Step 5: Commit the code and Dockerfile**

1.  Commit the code and Dockerfile to the GitHub repository:

   ```bash
   git add .
   git commit -m "Add Dockerfile and push Docker image"
   git push origin main
   ```

