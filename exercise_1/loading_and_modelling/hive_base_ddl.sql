DROP TABLE IF EXISTS [dbo].[effective_care]
GO

CREATE EXTERNAL TABLE IF NOT EXISTS [dbo].[effective_care](
	[Provider_ID] INT ,
	[Hospital_Name] STRING ,
	[Address] STRING ,
	[City] STRING ,
	[State] STRING ,
	[ZIP_Code] STRING ,
	[County_Name] STRING ,
	[Phone_Number] STRING ,
	[Condition] STRING ,
	[Measure_ID] INT ,
	[Measure_Name] STRING ,
	[Score] STRING ,
	[Sample] STRING ,
	[Footnote] STRING ,
	[Measure_Start_Date] DATE ,
	[Measure_End_Date] DATE 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    
	"separatorChar" = ",",    
	"quoteChar"     = '"', 
    "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare'; 

DROP TABLE IF EXISTS [dbo].[hospitals]
GO

CREATE TABLE IF NOT EXISTS [dbo].[hospitals](
	[Provider_ID] INT ,
	[Hospital_Name] STRING ,
	[Address] STRING ,
	[City] STRING ,
	[State] STRING ,
	[ZIP_Code] STRING ,
	[County_Name] STRING ,
	[Phone_Number] STRING ,
	[Hospital_Type] STRING ,
	[Hospital_Ownership] STRING ,
	[Emergency_Services] STRING 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    
	"separatorChar" = ",",    
	"quoteChar"     = '"', 
    "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare'; 


DROP TABLE IF EXISTS [dbo].[measures]
GO

CREATE TABLE IF NOT EXISTS [dbo].[measures](
	[Measure_Name] STRING ,
	[Measure_ID] INT ,
	[Measure_Start_Quarter] STRING ,
	[Measure_Start_Date] STRING ,
	[Measure_End_Quarter] DATE ,
	[Measure_End_Date] DATE 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    
	"separatorChar" = ",",    
	"quoteChar"     = '"', 
    "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare'; 



DROP TABLE IF EXISTS [dbo].[readmissions]
GO

CREATE TABLE IF NOT EXISTS [dbo].[readmissions](
	[Provider_ID] INT ,
	[Hospital_Name] STRING ,
	[Address] STRING ,
	[City] STRING ,
	[State] STRING ,
	[ZIP_Code] STRING ,
	[County_Name] STRING ,
	[Phone_Number] STRING ,
	[Measure_Name] STRING ,
	[Measure_ID] INT ,
	[Compared_to_National] STRING ,
	[Denominator] STRING ,
	[Score] STRING ,
	[Lower_Estimate] STRING ,
	[Higher_Estimate] STRING ,
	[Footnote] STRING ,
	[Measure_Start_Date] DATE ,
	[Measure_End_Date] DATE 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    
	"separatorChar" = ",",    
	"quoteChar"     = '"', 
    "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare'; 

DROP TABLE IF EXISTS [dbo].[surveyresponses]

CREATE TABLE IF NOT EXISTS [dbo].[surveyresponses](
	[Provider_Number] INT ,
	[Hospital_Name] STRING ,
	[Address] STRING ,
	[City] STRING ,
	[State] STRING ,
	[ZIP_Code] STRING ,
	[County_Name] STRING ,
	[Communication with Nurses Achievement Points] STRING ,
	[Communication with Nurses Improvement Points] STRING ,
	[Communication with Nurses Dimension Score] STRING ,
	[Communication with Doctors Achievement Points] STRING ,
	[Communication with Doctors Improvement Points] STRING ,
	[Communication with Doctors Dimension Score] STRING ,
	[Responsiveness of Hospital Staff Achievement Points] STRING ,
	[Responsiveness of Hospital Staff Improvement Points] STRING ,
	[Responsiveness of Hospital Staff Dimension Score] STRING ,
	[Pain Management Achievement Points] STRING ,
	[Pain Management Improvement Points] STRING ,
	[Pain Management Dimension Score] STRING ,
	[Communication about Medicines Achievement Points] STRING ,
	[Communication about Medicines Improvement Points] STRING ,
	[Communication about Medicines Dimension Score] STRING ,
	[Cleanliness and Quietness of Hospital Environment Achievement Points] STRING ,
	[Cleanliness and Quietness of Hospital Environment Improvement Points] STRING ,
	[Cleanliness and Quietness of Hospital Environment Dimension Score] STRING ,
	[Discharge Information Achievement Points] STRING ,
	[Discharge Information Improvement Points] STRING ,
	[Discharge Information Dimension Score] STRING ,
	[Overall Rating of Hospital Achievement Points] STRING ,
	[Overall Rating of Hospital Improvement Points] STRING ,
	[Overall Rating of Hospital Dimension Score] STRING ,
	[HCAHPS Base Score] STRING ,
	[HCAHPS Consistency Score] STRING 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    
	"separatorChar" = ",",    
	"quoteChar"     = '"', 
    "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare'; 
