DROP TABLE IF EXISTS effective_care;

CREATE EXTERNAL TABLE IF NOT EXISTS effective_care( Provider_ID string, Hospital_Name string, Address string, City string, StateProvince string, ZIP_Code string, County_Name string, Phone_Number string, Condition string, Measure_ID string, Measure_Name string, Score string, Sample string, Footnote string, Measure_Start_Date DATE, Measure_End_Date DATE ) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    "separatorChar" = ",",   "quoteChar"     = '"', "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/effective_care'; 

DROP TABLE IF EXISTS hospitals;

CREATE EXTERNAL TABLE IF NOT EXISTS hospitals(Provider_ID string,  Hospital_Name string,  Address string,  City string, StateProvince string,  ZIP_Code string, County_Name string, Phone_Number string, Hospital_Type string, Hospital_Ownership string, Emergency_Services string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/hospitals'; 

DROP TABLE IF EXISTS measures;

CREATE TABLE IF NOT EXISTS measures(Measure_Name string, Measure_ID string, Measure_Start_Quarter string, Measure_Start_Date string, Measure_End_Quarter DATE, Measure_End_Date DATE) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/measures'; 

DROP TABLE IF EXISTS readmissions;

CREATE EXTERNAL TABLE IF NOT EXISTS readmissions(Provider_ID string, Hospital_Name string, Address string, City string, StateProvince string, ZIP_Code string, County_Name string, Phone_Number string, Measure_Name string, Measure_ID string, Compared_to_National string, Denominator string, Score string, Lower_Estimate string, Higher_Estimate string, Footnote string, Measure_Start_Date DATE, Measure_End_Date DATE) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/readmissions'; 

DROP TABLE IF EXISTS surveys_responses;

CREATE EXTERNAL TABLE IF NOT EXISTS surveys_responses( Provider_Number string, Hospital_Name string, Address string, City string, StateProvince string, ZIP_Code string, County_Name string, Comm_w_N_Ach_P string, Comm_w_N_Imp_P string, Comm_w_N_Dim_S string, Comm_w_D_Ach_P string, Comm_w_D_Imp_P string, Comm_w_D_Dim_S string, Resp_of_Hosp_St_Ach_P string, Resp_of_Hosp_St_Imp_P string, Resp_of_Hosp_St_Dim_S string, Pain_Mgmt_Ach_P string, Pain_Mgmt_Imp_P string, Pain_Mgmt_Dim_S string, Comm_abt_Med_Ach_P string, Comm_abt_Med_Imp_P string, Comm_abt_Med_Dim_S string, Clean_Quiet_Hosp_Env_Ach_P string, Clean_Quiet_Hosp_Env_Imp_P string, Clean_Quiet_Hosp_Env_Dim_S string, Disc_Info_Ach_P string, Disc_Info_Imp_P string, Disc_Info_Dim_S string, Rating_Ach_P string, Rating_Imp_P string, Rating_Dim_S string, HCAHPS_Base_Score string, HCAHPS_Cons_Score string )ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapeChar"    = '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/surveys_responses'; 

