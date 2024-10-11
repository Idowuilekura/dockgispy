**Dockgispy** is a super fast Python-based Docker Image environment designed for quick GIS development and workflow. It solves a common challenge faced by both GIS beginners and professionals: installing Python modules across different operating systems.

To get started with GIS development on any operating system, you typically need to account for the underlying system requirements. However, it can be especially challenging to install certain Python modules, particularly on Windows.

The usual steps for starting any GIS workflow with Python are:

- Check your underlying infrastructure and operating system.
- Find and download a compatible Python version.
- Use `pip` to install the required modules.
- Anticipate a smooth installation of the module.
- Start your favorite development platform e.g Jupyter Notebook, Jupyter Lab, Vscode or anyone..

However, following this method doesn't always guarantee a successful installation due to several dependencies that might not be compatible with your operating system. To address this issue, **Conda** (from Anaconda) was developed to handle these dependencies effectively. However, Conda doesn't contain some certian modules that are developed by external developers which makes life easy. In addition, conda can be too big and bulky to work with it. To solve these challenges 
