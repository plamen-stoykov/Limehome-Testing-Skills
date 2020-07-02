### Directory Structure
drivers - WebDriver executables for different browsers - chromedriver.exe, geckodriver.exe etc.  
output  - Output directory where the output, report, log and screenshot files will be saved  
tests   - Collection of test cases files  


### Setup
1. Open file "tests/resource.robot"
2. Update the value of ${CHROMEDRIVER} variable to the full path to chromedriver.exe
   - Example: ${CHROMEDRIVER}    C:/Projects/Automation/drivers/chromedriver.exe
   - The chromedriver.exe in this project works with Chrome browser version 83.


### Execution
In the PyCharm or in the terminal execute the following from the root directory of the project.
1. Execute "pipenv install"
2. Execute "pipenv shell"
3. Execute "robot -d output -T tests"
