# Livestock Disease Data Pipeline

#### This project is a data pipeline written in R which extracts, transforms and loads livestock disease data.

### Installation:

The project repository can be cloned by executing the following command in the terminal:

``` bash
git clone https://github.com/aaakerberg/data_wrangling_exercise
```

The cloned repository should now be located in the directory you cloned the repository in.

### Usage:

#### 1. Load the required packages using 'renv'.

After cloning the repository, navigate to the project directory and open the project file **data_wrangling_exercise.Rproj**.

Once the project is opened in RStudio, run the following commands in the R console:

``` r
install.packages("renv")
renv::restore()
```

This automatically installs all the packages (and their correct versions) needed for running the pipeline.

#### 2. Navigate to the project root directory.

In RStudio, check if you are in the project root directory by running this command in the terminal window:

``` bash
pwd
```

The file path should end with '/data_wrangling_exercise'. If you are not in this directory, pipeline execution will not work.

#### 3. Execute pipeline R script.

Run the following command in the RStudio terminal window:

``` r
Rscript scripts/pipeline_execution/execute_pipeline.R 
```

If execution is successful, the message "Data wrangling pipeline and analysis completed!" should be printed in the terminal console.

## Project directory contents

This project contains 3 main directories:

### 1. Data

Contains 2 sub-directories storing the raw and processed livestock disease data:

#### 1a. Input Data

Contains the input data stored as an Excel file.

#### 1b. Output Data

Contains the output data stored as an Excel file.

### 2. Scripts

Contains 4 sub-directories storing all the R code referenced in this pipeline:

#### 2a: Config

Contains the **'config.R'** file storing all the settings and parameters used for each pipeline function.

#### 2b. Functions

Contains 5 R scripts storing various functions of the pipeline:

i.  **data_extract.R**: extracts the livestock data from the Excel file.

ii. **data_validation.R**: validates the data against defined rules.

iii. **data_transform.R**: transforms the livestock data (cleaning and restructuring).

iv. **data_load.R**: writes the processed data to an Excel file.

v.  **data_analysis.R**: calculates the sum of total animals tested and filters for the data entry with the highest percentage of positively tested livestock.

#### 2c. Pipeline Execution

Contains the **'execute.pipeline.R'** script which orchestrates pipeline execution when called.

#### 2d. Tests

Contains unit and integration tests and mock data for pipeline testing:

i.  **test_data_validation.R**: tests the data validation function (unit test) using testthat.
ii. **test_full_pipeline.R**: tests the full pipeline (integration test) using testthat.

### 3. Renv

Contains files enabling r environment and package dependencies. This can be ignored.
