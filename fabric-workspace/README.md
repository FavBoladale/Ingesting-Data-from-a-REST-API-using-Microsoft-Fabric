# Ingesting Data from a REST API using Microsoft Fabric
---
This project is a complete solution for integrating external weather data into a Microsoft Fabric Lakehouse using a scheduled pipeline and transformation flow. The solution enables consistent, enriched analytics by leveraging real-time or forecasted weather data.

## Objective
To ingest weather forecast data from a REST API, store it in Microsoft Fabric's Lakehouse, transform key fields, and ensure reliability via automated scheduling and failure notifications.

## Step-by-Step Workflow
1. API Integration (Data Source)
API Used: OpenWeatherMap 5-day forecast API


2. Fabric Pipeline: Ingestion
Create a Pipeline in the Data Factory experience within Microsoft Fabric.
* Copy Data Activity:
* Source: HTTP REST dataset connected to the weather API.
* Sink: Lakehouse – write output to /Files/raw_weather/ folder.
* Format: JSON (auto-detected or schema-defined).

3. Scheduling: Trigger Every 5 Hours
* Type: Scheduled Trigger
* Frequency: Every 5 hours
* Time zone: UTC (adjust if needed). This ensures the weather data is updated regularly throughout the day.

4. Data Transformation: Dataflow Gen2:
* Create a new Dataflow Gen2 in Microsoft Fabric.
* Source: Lakehouse > raw weather JSON file.
Transformations:
Make the necessary transformation(s) as needed. Then, write to sink to the Lakehouse for analytics and reporting.

5. Failure Handling: Office 365 Email Alert
On any activity failure, configure a "Failure Path" using an Office 365 Outlook activity to send an email notification


## Lakehouse Structure
Path	Description
/Files/raw_weather/	Raw weather data from the API
/Tables/transformed_weather/	Cleaned & transformed table for reporting

## Outcome
With this pipeline, data is refreshed every 5 hours with minimal manual intervention. The transformation step ensures clean schema compatibility (especially for datetime).
While the failure notifications allow quick response, improving reliability.

Data can be queried in Fabric Notebooks, Power BI, or SQL analytics workloads.

