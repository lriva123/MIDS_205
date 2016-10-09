select stateprovince as sate, round(sum(score),2) as agg_score, round(avg(score),2) as avg_score, round(variance(score),2) as var_score from (select h.stateprovince, ec.score from effective_care_c ec join hospitals_c h on ec.provider_id = h.provider_id union all select h.stateprovince, r.score from readmissions_c r join hospitals_c h on r.provider_id = h.provider_id) h group by stateprovince order by avg_score desc limit 10;
