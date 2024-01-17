
# Oracle BI Publisher 12c Lab: Part 1 - Load Data and Define Relationships

In this part of the lab, we will load data into Oracle BI Publisher 12c and establish relationships between datasets. We will use two datasets: one detailing customer information and the other containing country names and codes.

## Step 1: Download the Datasets

### Customers Dataset

1. Go to the Datablist Customers Dataset at the following URL:
   [Datablist - Customers Dataset](https://media.githubusercontent.com/media/datablist/sample-csv-files/main/files/organizations/organizations-10000.csv).
2. Download the `organizations-10000.csv` file to your local machine.

### Country Names and Codes

1. Navigate to the WS Form Country Names and Codes dataset here:
   [WS Form - Country Names and Codes](https://cdn.wsform.com/wp-content/uploads/2018/09/country.csv).
2. Download the `country.csv` file to your local machine.

## Step 2: Load Data into Oracle BI Publisher

1. Open Oracle BI Publisher.
2. In the main menu, select 'Data Model' and then choose 'New Data Model'.
3. In the Data Model Editor, click on the 'New Data Set' button to create your first dataset.
4. Choose 'CSV File' as the data set source and upload the `organizations-10000.csv` file.
5. Repeat the process to add a second dataset. This time, upload the `country.csv` file.

## Step 3: Define Relationships

1. In the Data Model Editor, navigate to the 'Diagram' tab to view the datasets.
2. Drag and drop to create a link between the 'Country' field in the Customers Dataset and the corresponding Name in the Country Names and Codes dataset.
3. A dialog will appear to define the relationship. Choose the appropriate fields from each dataset to match.
4. After setting the relationship, click 'OK' to establish the link.

You have now successfully created a relational data model in Oracle BI Publisher 12c that connects customer information with geographic data.

**Note:** Ensure that the 'Country' field formats match between the two datasets to establish a correct relationship. Consult your instructor if you encounter any issues or have questions.


# Oracle BI Publisher 12c Lab: Part 2 - Create Global Functions  (OPTIONAL - SKIP THIS SECTION)

In this part of the lab, we will create global functions in Oracle BI Publisher 12c. Global functions are reusable calculations or transformations that you can apply to data fields within your reports.

## Prerequisites

- Complete Part 1 of the lab where you have loaded the customer data into Oracle BI Publisher.
- Familiarize yourself with the sample data structure provided.

## Creating Global Functions

### Step 1: Open the Data Model

1. From the Oracle BI Publisher interface, navigate to the 'Data Model' that contains your Customers Dataset.
2. Click on the data model to open it in the Data Model Editor.

### Step 2: Access Global Functions

1. In the Data Model Editor, locate and select the 'Functions' tab at the bottom of the screen.
2. Click on the 'Create New Function' button to start defining a global function.

### Step 3: Define Global Functions

We will define the following five global functions:

1. **Function Name:** `FormatWebsite`
   - **Description:** Adds "https://" to the beginning of the Website field if it's not already present.
   - **Expression:** Use an `IF` statement to check if the `Website` field begins with "http://", "https://", or not and prepend "https://" if necessary.

2. **Function Name:** `StandardizeCountryName`
   - **Description:** Ensures the first letter of each word in the Country field is capitalized.
   - **Expression:** Apply a capitalization function to the `Country` field.

3. **Function Name:** `CalculateCompanyAge`
   - **Description:** Calculates the age of the company from the Founded field to the current year.
   - **Expression:** Subtract the `Founded` year from the current year to get the age.

4. **Function Name:** `CategorizeEmployeeSize`
   - **Description:** Categorizes the company based on the number of employees into Small, Medium, or Large.
   - **Expression:** Use a `CASE` statement to return "Small" for less than 1000 employees, "Medium" for 1000 to 9999 employees, and "Large" for 10000 or more employees.

5. **Function Name:** `GenerateIndustryCode`
   - **Description:** Creates a unique code for each Industry by taking the first three letters and appending a unique number.
   - **Expression:** Concatenate the first three letters of the `Industry` field with a unique number derived from another field or sequence.

### Step 4: Save and Test Global Functions

1. After defining each function, click 'OK' to save.
2. To test the functions, apply them to the dataset fields in a sample report layout and preview the results.

You have now successfully created global functions that can be used across reports in Oracle BI Publisher 12c.

**Note:** If you face any issues or have questions regarding the expression syntax or the function logic, please reach out to your instructor for assistance.


# Oracle BI Publisher 12c Lab: Part 3 - Create a Global Function for Average Number of Employees

In this part of the lab, we will create a global function that computes the average number of employees for the organizations listed in our dataset.

## Prerequisites

- Ensure you have completed Part 1 and Part 2 of this lab series, which include loading the customer data and creating global functions in Oracle BI Publisher 12c.
- Familiarize yourself with the sample data structure provided in Part 2.

## Step-by-Step Instructions

### Step 1: Open the Data Model

1. From the Oracle BI Publisher interface, navigate to 'Data Models' under the 'Data Model' section.
2. Select the Data Model you have been working with that contains the Customers Dataset.

### Step 2: Navigate to Global Functions

1. Within the Data Model Editor, find and click on the 'Functions' tab located towards the bottom part of the interface.

### Step 3: Define a New Global Function

1. Click on the 'Create New Function' button within the Functions tab.
2. Set the following parameters for your new global function:

   - **Function Name:** `ComputeAverageNumberOfEmployees`
   - **Description:** Calculates the average number of employees across all listed organizations.
   - **Return Type:** Choose 'Number' as the return type, as the function will return a numerical value.

### Step 4: Write the Function Expression

1. In the function expression area, you will write a SQL expression that computes the average. Use the SQL `AVG()` function, which calculates the average of a set of values.
2. The expression should look like this:
   ```sql
   AVG( CAST( "Number of employees" AS INTEGER ) )
   ```
   This expression casts the "Number of employees" field to an integer type and computes the average value.

### Step 5: Save the Global Function

1. After entering the expression, click 'OK' to save the new global function.
2. You will be returned to the list of global functions, where you should now see your newly created function listed.

### Step 6: Test the Function

1. To ensure that your global function is working correctly, create a simple report layout that uses the `ComputeAverageNumberOfEmployees` function.
2. Preview the report to see if the average number of employees is calculated and displayed as expected.

Congratulations, you have now added a global function to compute the average number of employees in Oracle BI Publisher 12c. This function can be used in any report within this data model to gain insights into workforce data.

**Note:** If there are any discrepancies or errors in the function's output, revisit the expression and make sure it is written correctly. If you continue to experience issues, seek assistance from your instructor.


# Oracle BI Publisher 12c Lab: Part 4 - Create a List of Values (LOV)

In this lab exercise, we will create a List of Values (LOV) in Oracle BI Publisher 12c, which can be used for prompts and parameters in your reports to allow users to select from a predefined list.

## Prerequisites

- Completion of previous lab parts, including data loading, creating global functions, and computing the average number of employees.
- Understanding of the sample customer data structure.

## Step-by-Step Instructions

### Step 1: Open the Data Model

1. In Oracle BI Publisher, go to the 'Data Model' section and open the existing data model containing the Customers Dataset.

### Step 2: Access the LOVs Section

1. Within the Data Model Editor, find the 'List of Values' tab in the lower part of the screen and click on it to open the LOVs section.

### Step 3: Create a New LOV

1. Click on the 'New List of Values' button to begin creating your LOV.

### Step 4: Define the LOV

1. Provide a meaningful name for your LOV, such as `IndustryLOV`.
2. In the 'Value' field, select the column that will provide the values for the list. For this exercise, choose the 'Industry' column from your dataset.
3. In the 'Display Label' field, you can simply reuse the 'Industry' column or create a more user-friendly name if necessary.
4. Optionally, you can define a default value for the LOV. This could be one of the industries from your dataset or a prompt for users to select an option.

### Step 5: Write the LOV Query

1. The query for the LOV should retrieve distinct values from the 'Industry' column to ensure each industry is only listed once. An example query would be:
   ```sql
   SELECT DISTINCT "Industry" FROM "CustomersDataset"
   ```
2. Enter this query in the provided query builder or SQL editor within the LOV creation dialog.

### Step 6: Save and Test the LOV

1. After completing the LOV setup, click 'OK' to save your new LOV.
2. To test the LOV, create a parameter in a report that uses this LOV and preview the report. Make sure the parameter shows the list of industries correctly.

Congratulations, you have successfully created a List of Values based on the 'Industry' column in your data. This LOV can now be used in report parameters for filtering and selection, enhancing the interactivity and user-friendliness of your reports.

**Note:** It is essential to verify that your LOV is functioning as expected. If you encounter any issues with the values displayed in the LOV, check the query and ensure it is correctly written and returning the expected results. For further assistance, consult with your instructor.


# Oracle BI Publisher 12c Lab: Part 5 - Create a Report from Scratch

In this part of the lab, we will create a report from scratch in Oracle BI Publisher 12c. This report will include a header, footer, and logo, along with a table with conditional formatting and a pie chart.

## Prerequisites

- Ensure completion of previous lab parts, which include setting up the data model and creating a List of Values (LOV).
- Basic understanding of the layout editor in Oracle BI Publisher 12c.

## Creating the Report

### Step 1: Start a New Report

1. Navigate to the 'Reports' section within Oracle BI Publisher.
2. Click on 'Create a new Report'.
3. Choose the data model that you have been working on in the previous labs.

### Step 2: Design the Layout

1. In the layout editor, start by designing your report's header:
   - Click on the header section.
   - Insert a text object and type in your report title, such as "Customer Analysis Report".
   - You can adjust the font size, style, and alignment to fit the desired look.

2. Add a footer:
   - Click on the footer section.
   - Insert the page number or any other desired text.
   - Format the footer to match the style of the header.

3. Insert a logo:
   - If a logo image is required, use the 'Insert Image' option.
   - Place the image in the header or any appropriate place within the report.

### Step 3: Create a Table with Conditional Formatting

1. Drag and drop a table object onto the report canvas.
2. Choose the columns to display from your dataset, such as Name, Website, Country, Industry, and Number of Employees.
3. To add conditional formatting:
   - Select the table cell you wish to format conditionally.
   - Use the 'Conditional Format' option to set the rules, such as changing the background color if the 'Number of Employees' is greater than a certain value.

### Step 4: Add a Pie Chart

1. Select the 'Chart' object from the layout components.
2. Choose 'Pie Chart' as the chart type.
3. Define the data series by selecting the 'Industry' field for the pie slices and the 'Number of Employees' field for the pie slice sizes.
4. Format the chart with appropriate labels and a legend.

### Step 5: Save and Preview the Report

1. Once you have completed the layout design, save the report.
2. Click on the 'Preview' button to generate a preview of your report.
3. Ensure that the header, footer, table, and pie chart appear as expected and that the conditional formatting is correctly applied.

Congratulations, you have created a comprehensive report from scratch in Oracle BI Publisher 12c, showcasing your data in both tabular and graphical formats.

**Note:** Creating a report can involve many details and choices. If something doesn't work as expected, review each step and ensure all settings are correctly applied. For assistance or clarification, do not hesitate to ask your instructor.

