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
If you have read up till this point, you would have wondered how Dockgispy solves common installtion challenge. So, Dockgispy is a Docker based image with preinstalled GIS python module which runs in a separate environment from your operating system. You next question will be, what is Docker?? 



