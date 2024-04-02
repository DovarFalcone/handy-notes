-- Query for forecastdb.1a table
SELECT 'forecastdb.1a' AS Table_Name, trim(substr(column_info, 0, instr(column_info, ' '))) AS Column_Name
FROM (
  SELECT regexp_replace(desc_output, ' +', ' ') AS column_info
  FROM (
    SELECT explode(split(regexp_replace(describe_formatted_output, '\n', ''), ',')) AS desc_output
    FROM (
      SELECT trim(regexp_replace(describe_formatted(t), '\\\\s+', ' ')) AS describe_formatted_output
      FROM forecastdb.`1a` t
      LIMIT 1
    ) sub1
  ) sub2
) sub3

UNION ALL

-- Query for demanddb.2b table
SELECT 'demanddb.2b' AS Table_Name, trim(substr(column_info, 0, instr(column_info, ' '))) AS Column_Name
FROM (
  SELECT regexp_replace(desc_output, ' +', ' ') AS column_info
  FROM (
    SELECT explode(split(regexp_replace(describe_formatted_output, '\n', ''), ',')) AS desc_output
    FROM (
      SELECT trim(regexp_replace(describe_formatted(t), '\\\\s+', ' ')) AS describe_formatted_output
      FROM demanddb.`2b` t
      LIMIT 1
    ) sub1
  ) sub2
) sub3;
