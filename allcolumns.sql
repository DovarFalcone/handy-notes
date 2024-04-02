SELECT 'Table1' AS Table_Name, trim(substr(column_info, 0, instr(column_info, ' '))) AS Column_Name
FROM (
  SELECT regexp_replace(desc_output, ' +', ' ') AS column_info
  FROM (
    SELECT explode(split(regexp_replace(describe_formatted_output, '\n', ''), ',')) AS desc_output
    FROM (
      SELECT trim(regexp_replace(describe_formatted(t1), '\\\\s+', ' ')) AS describe_formatted_output
      FROM Table1 t1
      LIMIT 1
    ) sub1
  ) sub2
) sub3

UNION ALL

SELECT 'Table2' AS Table_Name, trim(substr(column_info, 0, instr(column_info, ' '))) AS Column_Name
FROM (
  SELECT regexp_replace(desc_output, ' +', ' ') AS column_info
  FROM (
    SELECT explode(split(regexp_replace(describe_formatted_output, '\n', ''), ',')) AS desc_output
    FROM (
      SELECT trim(regexp_replace(describe_formatted(t2), '\\\\s+', ' ')) AS describe_formatted_output
      FROM Table2 t2
      LIMIT 1
    ) sub1
  ) sub2
) sub3

-- Repeat similar structure for Table3, Table4, and Table5
