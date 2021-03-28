/*
Calculate the annual total political spending on a per-respondent basis, as
reported in FERC Account number 426.4 in the FERC Form 1 utility income
statements. This account is described as "Expenses for Certain Civic,
Political & Related Activities." Prior to 2004, the individual sub-accounts
of 426 were not broken out individually.
*/
SELECT
  income.report_year,
  income.respondent_id,
  respondents.respondent_name,
  SUM(income.cy_other_total) AS political_spending
FROM
  f1_incm_stmnt_2 AS income
  JOIN f1_respondent_id AS respondents
    ON respondents.respondent_id = income.respondent_id
WHERE
  income.row_number = 48         -- See f1_row_lit_tbl for human readable table labels
  AND income.report_prd = 12     -- Reported quarterly YTD, so Q4 is annual total.
  AND income.report_year >= 2004 -- Prior to 2004 sub-accounts of 426 weren't broken out
GROUP BY
  income.respondent_id, income.report_year
ORDER BY
  political_spending DESC
