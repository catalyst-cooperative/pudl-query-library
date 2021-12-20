/*
Select the annual total "Miscellaneous General Expenses" for each FERC Form 1
respondent. This account (FERC Account 930.2) is frequently used for industry
association dues, which are often funneled into political lobbying, and are thus
important for advocates to track. Note that the row in which this account is reported
changed from 163 to 192 in 2006, as can be seen int he f1_row_lit_tbl.  I'm sure there's
a way to extract this automatically by merging in the right row_number based on which
row LIKE '%FERC Account 930.2%' but I don't know the SQL to do that yet.
*/

SELECT
  expenses.report_year,
  expenses.respondent_id,
  respondents.respondent_name,
  SUM(expenses.crnt_yr_amt) AS misc_general_expenses
FROM
  f1_elc_op_mnt_expn AS expenses
  JOIN f1_respondent_id AS respondents
    ON respondents.respondent_id = expenses.respondent_id
WHERE
  -- Get the right row for FERC acct 930.2 based on labels in f1_row_lit_tbl
  CASE
    WHEN expenses.report_year <= 2005 THEN expenses.row_number = 163
    WHEN expenses.report_year > 2005 THEN expenses.row_number = 192
  END
  AND expenses.report_prd = 12
GROUP BY
  expenses.respondent_id, expenses.report_year
ORDER BY
  expenses.report_year, expenses.respondent_id
