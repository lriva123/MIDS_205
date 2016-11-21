create table provider_score as select provider_id, avg(score) as avg_hospital_score from (select h.provider_id, h.hospital_name, ec.score from effective_care_c ec join hospitals_c h on ec.provider_id = h.provider_id union all select h.provider_id, h.hospital_name, r.score from readmissions_c r join hospitals_c h on r.provider_id = h.provider_id) h group by provider_id order by avg_hospital_score desc limit 10;

create table patient_score as select provider_id, avg(HCAHPS_Base_Score) as avg_patient_base_score, avg(HCAHPS_Cons_Score) as avg_patient_cons_score from surveys_responses_c group by provider_id;

select corr(prs.avg_hospital_score, pas.avg_patient_base_score) as hos_pat_corr from provider_score prs join patient_score pas on prs.provider_id = pas.provider_id;

select corr(prs.avg_hospital_score, pas.avg_patient_cons_score) as hos_pat_corr from provider_score prs join patient_score pas on prs.provider_id = pas.provider_id;


