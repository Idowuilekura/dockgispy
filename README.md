Dockgispy is a battery included docker image for the Gis Python Ecosystem, inspired by the QGISPY Battery Included Gis Python Module. The image was developed to solve the challenges beginners encounter while setting up Gis based Python Modules on different operating systems especially on Windows. Installing Python modules on Linux based operating system is easier and seamless, however this can be tedious and frustrating for new users and also experienced GIS users. With Dockgispy, users will only care about the execution of their workflows while the setting up processes is removed from the workflow. The image aims to be a low-code solution for deploying python GIS infrastructure for development and work. With a simple command, users have access to either a Jupyter Notebook or Jupyter Lab which is common with GIS Python Users for development and prototyping. 

**Features**
- 🫙 Low code Python Based Environment for Gis Development and workflow.
- 🔥 Image python modules built with UV, the fastest python package manager and installer.
- 🥰 Faster and easier way to go from ideation to development without worrying about your underlying operating system.
- ⚔ Ability to be creative and explore without fear of destroying your local system. 

**Tags**
- Smallest contains few GIS python module, intended for beginners, students or those who want to quickly prototype with basic GIS modules in Python. The installed libraries can be checked with this link. 
- Medium contains python modules from the smallest and more modules. This is intended for those who wish to explore GIS in python at an intermediate level.
- Large contains python modules from the Medium image size and the inclusion of GDAL python module.
- Largest Contains python modules from the Large with the inclusion of Apache Spark, a big data analytics tool for data processing and transformation.

**Image Environment Variables**
To run the docker image, you need to provide two optional environment variables which are
1. The option to set the development environment to either open a Jupyter Notebook or Jupyterlab. This can be done with the *IDE_SET* environment variable, which expects either "lab" to start a jupyterlab or "notebook" to start a JupyterNotebook. You can choose to omit specifying the variable, however JupyterLab server will be started by default. 

**How to Run the Image**

Running docker images involves two methods:
1. Pulling the image before running the image as a container 
2. Running the image, which pulls the image automatically and run the image as a container. 
Dockgispy can also be run with either of the above methods. 
Both methods will be demostrated as shown below
    
    1. Pulling the image before running the image as a container. You can either pull the image with a tag which pulls the largest image tag by default or you pull with a tag 
        - Pulling without a tag, this pulls the largest image tag by default. The command to pull the image is shown below

            ```sh
            docker pull idowuilekura/dockgispy
            ```
        - Pulling the image with a tag of your choice. The command to pull the image with your specified tag is shown below

            ```sh
            docker pull idowuilekura/dockgispy:your_tag_name
            ```

        Once you are done, pulling the image, you need to run the image with this command and specify an optional argument which is the volume and the port mapping. 
        - The `-v` command is needed to map the directory on the docker container with that on your local system. This ensures you can persit your work or operation (such as files created or notebook created) on the container to your local system. If you do not provide the option, any task will be lost once the container shuts down. The workdir on the container is `app`. Hence, to map a directory with name `work_dir` on your local system to the `app`, you need to do path_to_work_dir:app e.g `./work_dir:app` for relative path or pass the absolute path with `/home/pc/app:app`
        - The `-p` is a docker command to map the port on your system to that of the running container. You need to map any available port to port 8888 on the container. Jupyterlab and JupyterNotebook listens on port 8888 in the container. If you do not map the port on your system to that on the container, you will not be able to access the running instance of JupyterLab or Notebook in the container. 
        
        To run the image you pulled without a tag, use the command below

            docker run idowuilekura/dockgis -v  path_to_your_folder:app -p port_number:8888
            
        To run the image you pulled with a tag, use the command below 
            
            docker run idowuilekura/dockgispy:prefered_tag -v path_to_your_folder:app -p port_number:8888
    2. Running the image, which pulls the image automatically and run the image as a container.
    To run the image without first pulling the image, you can use the below command, add the tag attribute if you want to automaticall pull and run a particular image. 
        ```
        docker run idowuilekura/dockgispy -v path_to_your_folder:app -p port_number:8888
        ```
**Running the Image with Docker Compose**

A much easier method to run the image is through a docker compose file. Docker-compose helps to automate the running of docker images. 
A sample docker compose file is shown below to run the smallest dockgispy image. If you are not familiar with docker-compose, you can read more with this [link](https://www.freecodecamp.org/news/what-is-docker-compose-how-to-use-it/). 

If you want to specify the environment variable, you can uncomment or remove the hash key behind the environment and the -IDE_SET=lab. If you wish to set the development environment to a notebook can you use `IDE_SET=notebook` 
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
- The next step is to build your docker image. To build your image type this command `docker build -t name_of_your_image` e.g if you wish to use `dockgispy` as the name of your new image then run this command `docker build -t dockgispy`. The image will automatically build with a speed of light, thanks to `UV` 😉 for installing the packages.
- Once you have built the image, you can run this command `docker image ls` and see your newly built image.
- The last step is to run your image, by using `docker run -v path_to_your_local_folder:/app -p your_desired_port:8888 dockgispy` assume your newly built image is dockgispy. You can also use docker-compose, replace the image with your image name, save the content below into a file and run `docker compose up`
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
