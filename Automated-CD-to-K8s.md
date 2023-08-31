## __IMPLEMENTING AUTOMATED CONTINUOUS DELIVERY OF CONTAINERS TO KUBERNETES CLUSTER__

In this project, my goal is to establish a system designed to consistently build Docker images and seamlessly deploy them to a Kubernetes cluster.

__SCENARIO__

Developers consistently enhance the application, striving for ongoing improvements. Simultaneously, the operations team is tasked with the responsibility of frequent deployment requests which is essential for effectively managing and operating the Kubernetes cluster.

__CHALLENGE__

Given that the Operations team manually handles deployments, the process is subject to human intervention, resulting in dependencies and significant time consumption.

__SOLUTION__

To address this challenge, the solution lies in implementing an automated deployment framework. This framework will encompass continuous integration, testing, regular image building, and uninterrupted deployment. As soon as a developer commits code changes, the system will instantaneously initiate the image building process and deploy containers to the Kubernetes cluster, ensuring a rapid and streamlined deployment pipeline.

__TOOLS__

The project will utilize the following tools:

- Kubernetes - For orchestrating container deployment
- Docker  runtime environment - For building and testing docker images.
- __Jenkins__ - CI/CD tool for the process.
- __Dockerhub__ - To serve as a repository for the images.
- __Helm__ - For packaging and deploying the images to kubernetes cluster.
- __Git__ - For Version control system.
- __Maven__ - To build the java code.
- __Sonarqube__ - For code analysis.

__ARCHITECTURE DESIGN__

![](./images/image.PNG)


When a developer makes changes to the code and commits them to the Git repository, Jenkins takes action. Jenkins retrieves the updated code, which includes the Dockerfile required to build the Docker image. Jenkins proceeds to collect all code modifications and initiates a sequence of actions which include tests and code analysis. Utilizing tools such as Checkstyle and the SonarQube scanner, it evaluates the code's quality. The outcome of this evaluation is then transmitted to the SonarQube server.

In the event that the code meets the established quality criteria, Jenkins advances to the subsequent stages. Initially, it triggers the Maven build process to build the code into an artifact. Following the successful Maven build, the process transitions to building the Docker image. This entails the build of the Docker image based on the specifications in the Dockerfile. Should all these steps go through without issue, the resulting Docker image is subsequently uploaded to Dockerhub.

Once the Docker image is successfully uploaded to Docker Hub, Jenkins transitions to employing Helm. It incorporates a Kubernetes Operations (kops) Virtual Machine to function as a slave. Through this slave, Jenkins employs kops to orchestrate the deployment of Helm charts onto the Kubernetes cluster. The Helm chart serves as a blueprint for the creation of Kubernetes objects. When these services are already in existence, the Helm chart adeptly implements modifications, such as the application pod receiving an updated image tag.

__FLOW OF EXECUTION__
- Continuous Integration setup
   - Jenkins and Sonarqube
- Dockerhub account
- Store dockerhub credentials in Jenkins
- Setup docker engine in Jenkins
- Install plugins in Jenkins
   - Docker plugin
   - Docker pipeline plugin
   - Pipeline utility plugin
- Create kubernetes cluster with kops
- Install helm in the kops instance/VM.
- Create helm charts
- Test the helm charts in kubernetes cluster in test namespace.- testing the entire stack.
- Add kops instance/VM as Jenkins slave.
- Create  Jenkinsfile.
- Update Git repo with:
   - Jenkinsfile
   - Dockerfile
   - Helm Chart
- Create Jenkins job for pipeline
- Run and test the job.