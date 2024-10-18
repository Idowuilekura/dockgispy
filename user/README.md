# Introduction
**Dockgispy** is a super fast Python-based Docker Image environment designed for quick GIS development and workflow. In a nutshell, it helps you with your workflow without the hassle of installing python modules.  It solves a common challenge faced by both GIS beginners and professionals: installing Python modules across different operating systems.

To get started with GIS development on any operating system, you typically need to account for the underlying system requirements. However, it can be challenging to install certain Python modules, particularly on Windows.

The usual steps for starting any GIS workflow with Python are:

- Check your underlying infrastructure and operating system.
- Find and download a compatible Python version.
- Use `pip` to install the required modules.
- Anticipate a smooth installation of the module.
- Start your favorite development platform e.g Jupyter Notebook, Jupyter Lab, Vscode or anyone.
- Start your Gis Analysis or Geospatial Workflow. 

However, following this method doesn't always guarantee a successful installation due to several dependencies that might not be compatible with your operating system. To address this issue, Conda (from Anaconda) was developed to handle these dependencies effectively. However, Conda doesn't contain certain modules that are developed by external developers, which makes life easier. In addition, Conda can be too big and bulky to work with. Also, certain Python modules need external modules that aren't developed in Python, which can pose challenges during installation.

Beyond carring for the underlying operating system, a common challenge faced by beginners and experienced GIS python users is the difficulty of installing their commonly used modules accross different virtual environments. To solve this challenge, Qiusheng Wu [giswqs](https://github.com/giswqs) developed [geospatial](https://pypi.org/project/geospatial/) a python module that installs commonly used python module for GIS workflow. Although, this amazing module removes the hassle of remembering or searching for commonly used python module, the common challenge of taking into account the underylying infrastrucute is still an issue. 

Dockgispy was developed to solve the challenge of installing your commonly used python module, and cut off the time taken to get your environment ready for your GIS workflow. You can think, of a system that removes the hassles of setting up your environment and take you directly to your workflow. Dockgispy is the tool hat helps to speed up your productive and enhace your efficiency.

## How does Dockgispy Work
If you have read up till this point, you would have wondered how Dockgispy solves common installation challenge. So, Dockgispy is a Docker based image with preinstalled GIS python module which runs in a separate environment from your operating system. Your next question will be, what is Docker?? Docker is a tool that solves a problem of "it works on my computer, but not on another system". Docker runs containers in isolated processes on the host system without affecting any process or files on the host system. Docker was initially built on Linux, hence whatever runs on Linux will run on Linux based docker images. 
### Why was Docker Chosen for Dockgispy
[Docker](https://www.docker.com/) was chosen because it provides a light-weight version of [Linux](https://en.wikipedia.org/wiki/Linux) that can run in a separate process. With a light-weight version of Linux and the ease of installing application on Linux, Docker is the perfect tool for building Dockgispy. Docker has a concept called images, which contains the installed modules, applications in the light-weight Linux environment. Containers are created when you run the image, which gives you access to the installed modules and packages. The docker image can be ran multiple times as containers, and the containers do not mutate the underlying image properties.
The features of docker makes it the perfect choice for Dockgispy, which is to have preinstalled GIS based python module in an image, that can be run multiple times and provide a quick environment for development. 
### Why you should migrate your workflow to Dockgispy
An important question on your mind, is why should I leave my traditional method of starting my python environment for GIS workflow for Dockgispy. 
-    🫙 Low code Python Based Environment for GIS Development and workflow. Dockgispy, provides zero code based environmental setup for your GIS workflow. You do not need to battle with the manual code creation of virtual environment and issues with installing packages with `pip` or `conda` in a virtual environment.  
- 🥰 Faster and easier way to go from ideation to development without worrying about your underlying operating system. With Dockgispy, you speed of going from when an idea comes to your head to starting your development environment is faster than the speed of light 😉. 
- ⚔ Ability to be creative and explore without fear of destroying your local system. Dockgispy is based on docker, which open the development environment in an isolated environment away from your local filesystem and processes.
- 💰 Access to different GIS python modules and big data analytics modules based on your preference. 
- 🔥 Fast image build with  [UV](https://astral.sh/blog/uv), the fastest python package manager and installer in the world. Dockgispy installed python modules were installed with UV, which speed up the image build. Hence, rebuilding the image for your desired use, is blazing fast. 

## How to use Dockgispy 
You have read about Dockgispy, your next question will be how to use Dockgispy. Before you get started with running the Dockgispy docker image, you need to note certain things. To ensure, Dockgispy caters for different users and their use cases, the image as been given different tags. Docker images, are given name and tags which can be for versioning, for specific tasks e.t.c. The information about the different tags are shown below:
**Tags**
- Smallest contains few GIS python module, intended for beginners, students or those who want to quickly prototype with basic GIS modules in Python. You can view the list of installed libraries through this [link](https://github.com/Idowuilekura/dock_gis_py/blob/master/dockgispysmallest/requirements.txt). 
- Medium contains python modules from the smallest and more modules. This is intended for those who wish to explore GIS in python at an intermediate level. You can view the list of installed libraries through this [link](https://github.com/Idowuilekura/dock_gis_py/blob/master/dockgispymedium/requirements.txt)
- Large contains python modules from the Medium image size and the inclusion of GDAL python module. You can view the list of installed libraries through this [link](https://github.com/Idowuilekura/dock_gis_py/blob/master/dockgispylarge/requirements.txt)
- Largest Contains python modules from the Large with the inclusion of Apache Spark, a big data analytics tool for data processing and transformation. You can view the list of installed libraries through this [link](https://github.com/Idowuilekura/dock_gis_py/blob/master/dockgispylargest/requirements.txt)
**Image Environment Variables**
To run the docker image, you need to provide one optional environment variables which is
1. The option to set the development environment to either open a Jupyter Notebook or Jupyterlab. This can be done with the `IDE_SET` environment variable, which expects either the word `lab` to start  Jupyterlab or `notebook` to start a JupyterNotebook environment. You can choose to omit specifying the variable, however JupyterLab server will be started by default. 

### How to Run Dockgispy Image
With the understanding that you have now, you are well equipped to run the Dockgispy docker image.  
Before you proceed, you need to be aware of two methods of running docker images which are:
1. Pulling the image before running the image as a container 
2. Running the image, which pulls the image automatically and run the image as a container. 
Dockgispy can also be run with either of the above methods given that, it is a docker image. 
Both methods will be demonstrated as shown below
    #### 1. Pulling the image before running the image as a container 
   Pulling the image before running the image as a container. You can either pull the image with a tag which pulls the largest image tag by default or you pull with a tag 
        - Pulling without a tag: This pulls the largest image tag by default. The command to pull the image without a tag is shown below

            ```sh
            docker pull idowuilekura/dockgispy
            ```
        - Pulling the image with a tag of your choice. The command to pull the image with your specified tag is shown below

            ```sh
            docker pull idowuilekura/dockgispy:your_tag_name
            ```

### Running the Pulled Docker Image
Once you are done, pulling the image, you need to run the image with this command and specify an optional argument which is the volume and the port mapping. 
  -   The `-v` command is needed to map the directory on the docker container with that on your local system. This ensures you can persit your work or operation (such as files created or notebook created) on the container to your local system. If you do not provide the option, any task will be lost once the container shuts down. The workdir on the container is `app`. Hence, to map a directory with name `work_dir` on your local system to the `app`, you need to do path_to_work_dir:app e.g `./work_dir:app` for relative path or pass the absolute path with `/home/pc/app:app`
    - The `-p` is a docker command to map the port on your system to that of the running container. You need to map any available port to port 8888 on the container. Jupyterlab and JupyterNotebook listens on port 8888 in the container. If you do not map the port on your system to that on the container, you will not be able to access the running instance of JupyterLab or Notebook in the container. 
        
        To run the image you pulled without a tag, use the command below

            docker run idowuilekura/dockgis -v  path_to_your_folder:app -p port_number:8888
            
        To run the image you pulled with a tag, use the command below 
            
            docker run idowuilekura/dockgispy:prefered_tag -v path_to_your_folder:app -p port_number:8888
  #### 2. Running the image without pulling first
   To run the image without first pulling the image, you can use the below command, add the tag attribute if you want to automatically pull and run a particular image. 
        ```
        docker run idowuilekura/dockgispy -v path_to_your_folder:app -p port_number:8888
        ```
        
### Running the Image with Docker Compose**

A much easier method to run the image is through a docker compose file. Docker-compose helps to automate the running of docker images. 
A sample docker compose file is shown below to run the smallest dockgispy image. If you are not familiar with docker-compose, you can read more with this [link](https://www.freecodecamp.org/news/what-is-docker-compose-how-to-use-it/). 

If you want to specify the environment variable, you can uncomment or remove the hash key behind the environment and the `-IDE_SET=lab`. If you wish to set the development environment to a notebook can you use `IDE_SET=notebook` 
Copy the below, into a file with the name `docker-compose.yaml` and save it.

```
services:
  app:
    image: dockgispy:smallest
    container_name: dockgispycont
    # environment:
    #   - IDE_SET=lab
    ports:
      - "8000:8888"
    volumes:
      - ./app:/app
```
Once the file has been saved, you can start the container with this command `docker compose up`. The `docker compose up` command automatically pull the image if it doesn't exist and run the image. 
*N.B Ensure you run the command in the terminal that matches the directory where the file is saved.*
**Video Demostration of Running the Image**
You can follow, the step below if you wish to watch a video on how to run the images with or without docker-compose

- Without Docker-compose 

https://github.com/user-attachments/assets/9127f8f6-4147-4ea9-8c42-d9cf5ec4e5e2

- With Docker-compose

  https://github.com/user-attachments/assets/878d5ede-e1c9-4580-82ff-9f56a58dfc09

**Build your own Image from Scratch**
If you wish to build your own image, probably because the images do not have modules your need for your workflow or you wish to strip down the modules that are installed. You can follow the steps below to build your image from scratch. 
- Clone the repository with this command `git clone https://github.com/Idowuilekura/dock_gis_py.git`
- Change your directory into the cloned folder which is `dock_gis_py` with this command `cd dock_gis_py`
- You can change the directory to any of the folder tag of your choice such as `dockgispysmallest`.
- Once you are in the folder of your choice, you will see a file named `requirements.txt`. To learn more about the importance of `requirements.txt` you can check this [link](https://pip.pypa.io/en/stable/reference/requirements-file-format/). You need to open the `requirements.txt` and remove or add the python Gis module of your choice.
- Once, you are done with the editing, save the file. Ensure you confirm that your changes are saved.
- The next step is to build your docker image. To build your image type this command `docker build -t name_of_your_image` e.g if you wish to use `dockgispy` as the name of your new image then run this command `docker build -t dockgispy`. The image will automatically build with a speed of light, thanks to `UV` 😉 for installing the python packages.
- Once you have built the image, you can run this command `docker image ls` and see your newly built image.
- The last step is to run your image, by using `docker run -v path_to_your_local_folder:/app -p your_desired_port:8888 dockgispy` assume your newly built image is dockgispy. You can also use docker-compose, replace the image with your image name in the content shown below, save the content into a file and run `docker compose up`.
  
  ```
  services:
  app:
    image: your_image_name
    container_name: your_preferred_container_name
    # environment:
    #   - IDE_SET=lab
    ports:
      - "8000:8888"
    volumes:
      - ./app:/app
  ```



