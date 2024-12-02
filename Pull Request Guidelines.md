# Pull Request Guidelines for Repository Contributions  

Thank you for contributing to this repository! To ensure smooth collaboration and maintain the integrity of the codebase, please follow these guidelines when creating a pull request (PR):  

---

## Documentation-Only Changes  

1. **Making the Changes**  
   - **Option 1: Directly on GitHub**  
     - If your changes are limited to documentation (e.g., `README.md`), you can edit the file directly on the GitHub website:  
       - Navigate to the file you want to edit.  
       - Click the pencil (✏️) icon to open the editor.  
       - Make your changes, preview them, and commit them by following the prompts to create a pull request.  

   - **Option 2: Locally on Your System**  
     - If you'd prefer to work locally:  
       - **Fork the Repository**:  
         Create a fork of the repository by clicking the "Fork" button on the GitHub page.  
       - **Clone the Forked Repository**:  
         ```bash
         git clone https://github.com/<your-username>/<repository-name>.git
         cd <repository-name>
         ```  
       - Create a new branch for your changes:  
         ```bash
         git checkout -b update-documentation
         ```  
       - Make the necessary changes to the documentation files.  

2. **Submitting the Pull Request**  
   - After committing your changes (locally or on the GitHub website), create a pull request:  
     - Provide a clear title and description, mentioning it is a documentation-only change.  
     - No additional testing is required for documentation changes.  

---

## Changes to `Dockerfile` or `requirements.txt`  

1. **Fork the Repository**  
   - Create a fork of the repository by clicking the "Fork" button on the top-right corner of the GitHub page.  

2. **Clone the Forked Repository**  
   - Clone the forked repository to your local system:  
     ```bash
     git clone https://github.com/<your-username>/<repository-name>.git
     cd <repository-name>
     ```  

3. **Change to the Relevant Directory**  
   - Navigate to the folder corresponding to the Docker image you are modifying:  
     ```bash
     cd <directory-name>
     ```  

4. **Make the Changes**  
   - Modify the `Dockerfile` or `requirements.txt` file as needed.  

5. **Test Locally**  
   - **Validate Docker Build**: Ensure the Docker image builds successfully:  
     ```bash
     docker build -t <directory-name> .
     ```  
   - **Run the Docker Container**: Test the container to confirm it starts correctly:  
     ```bash
     docker run -p <desired-port>:8888 <directory-name>
     ```  
     Copy the `JupyterNotebook` or `JupyterLab` URL from the output and open it in your browser.  

   - **Verify Python Libraries**: Test that all added Python libraries are successfully installed by running:  
     ```bash
     python -c "import geopandas; import shapely; print('GIS libraries imported successfully')"
     ```  

6. **Push to the Fork**  
   - Push your tested changes to your forked repository:  
     ```bash
     git add .
     git commit -m "Update Dockerfile/requirements.txt for <reason>"
     git push origin <branch-name>
     ```  

7. **Open the Pull Request**  
   - Create a new pull request on the original repository.  
   - Provide a detailed title and description, including:  
     - The purpose of the changes.  
     - A summary of the modifications made.  
     - The steps you took to test the changes locally, including Docker build validation, container runs, and library imports.  

---

## Participate in the Review Process  

1. Be available to respond to reviewer feedback.  
2. Address any requested changes promptly to ensure smooth progression of the pull request.  

---

By following these guidelines, you ensure the quality and reliability of the repository. Your contributions are highly valued, and we appreciate your efforts in adhering to this process!  
 
 
