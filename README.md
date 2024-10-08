# HR-Employee data management analysis using SQL and power BI
Data Analysis on Human Resource
## Table of Contents
- [Introduction](#introduction)
- [Goal](#goal)
- [Data](#data)
- [Technology](#tech)
- [Process](#process)
- [Question of Interest](#QestiionOfInterest)
- [Result](#result)
- [Key Insights](#keyInsights)
## Introduction
Employee datasets plays a vital role in HR management. In this project, I have implemented data analysis in HR employee data so that I can find meaningful employee data insights.
## Goal
The main goal of this project is to get the thorough data cleaning, analysis and visualization for human resource employee data of a company utilizing SQL and Power BI.
## Data
The dataset I used in this project is from [here](https://github.com/arpitachy/HR-management/tree/main/dataset).
## Technology
- Data Cleaning & Analysis - MySQL Workbench
- Data Visualization - PowerBI
## Process
1. Imported tthe data in MySQL Workbench.
2. Analyzed the data using SQL query.
3. Prepared a cleaned new datasets.
4. Utilized the new datasets in Power BI for visualization task.
## Questions of Interest
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?
## Result
I have analyzed the question of interest using SQL qyuries. Here is my queries ran on  MySQL Workbench:
![image](https://github.com/arpitachy/HR-management/blob/main/images/q1.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q2.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q3.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q4.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q5.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q6.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q7.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q8.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q9.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q10.PNG)
![image](https://github.com/arpitachy/HR-management/blob/main/images/q11.PNG)

After running the SQL quesries, new datasets are produced for further analysis. The cleaned datasets are [here](https://github.com/arpitachy/HR-management/tree/main/processed%20dataset).

Finally, I have created dashboard utilizing some features in Power BI such as bar chart, line chart, pie chart, column chart, table, map, card etc . Here is the dashboard:
![image](https://github.com/arpitachy/HR-management/blob/main/images/HR%20data%20analysis_page-0001.jpg)
![image](https://github.com/arpitachy/HR-management/blob/main/images/HR%20data%20analysis_page-0002.jpg)

## Key Insights
1. There are more male employees.
2. White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
3. The youngest employee is 21 years old and the oldest is 58 years old.
4. 8 age groups were created (20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50-54, 55+). A large number of employees were between 35-39 while the smallest group was 20-24.
5. A large number of employees work at the headquarters than remotely.
6. The average length of employment for terminated employees is around 8 years.
7. The gender distribution across departments is fairly balanced but there are generally more male than female employees.
8. The auditing department has the highest turnover rate followed by Legal. The least turn over rate is in business development department.
9. A large number of employees come from the state of Ohio.
10. The net change in employees has increased over the years.
12. Research Analyst II has the highest number of emplyees working, in each job male worker is prominant.
