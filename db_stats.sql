WITH database_stats AS (
  -- Get the size of the database in bytes
  SELECT pg_database_size(current_database()) AS db_size_bytes
),
table_stats AS (
  -- Get information about tables in the current database
  SELECT
    schemaname || '.' || tablename AS table_name,
    pg_total_relation_size(schemaname || '.' || tablename) AS table_size_bytes,
    pg_total_relation_size(schemaname || '.' || tablename) / (1024 * 1024) AS table_size_mb,
    pg_relation_size(schemaname || '.' || tablename) AS table_data_size_bytes,
    pg_total_relation_size(schemaname || '.' || tablename) - pg_relation_size(schemaname || '.' || tablename) AS table_index_size_bytes,
    pg_total_relation_size(schemaname || '.' || tablename) / (pg_relation_size(schemaname || '.' || tablename) + 1) AS table_bloat_ratio,
    pg_total_relation_size(schemaname || '.' || tablename) / (pg_total_relation_size(schemaname || '.' || tablename) + 1) AS table_compression_ratio,
    pg_total_relation_size(schemaname || '.' || tablename) / (NULLIF(pg_statistic(NULL, schemaname || '.' || tablename), 0) + 1) AS row_to_disk_ratio,
    pg_total_relation_size(schemaname || '.' || tablename) / (pg_total_relation_size(schemaname || '.' || tablename) / (pg_statistic(NULL, schemaname || '.' || tablename) + 1) + 1) AS row_to_total_ratio,
    pg_total_relation_size(schemaname || '.' || tablename) / (pg_statistic(NULL, schemaname || '.' || tablename) / (NULLIF(pg_statistic(NULL, schemaname || '.' || tablename), 0) + 1) + 1) AS disk_to_total_ratio,
    pg_total_relation_size(schemaname || '.' || tablename) / (pg_total_relation_size(schemaname || '.' || tablename) / (pg_stat_get_live_tuples(c.oid) + 1) + 1) AS tuple_to_total_ratio,
    pg_stat_get_live_tuples(c.oid) AS table_row_count
  FROM
    pg_tables t
  JOIN
    pg_class c ON t.tablename = c.relname
  WHERE
    schemaname NOT IN ('pg_catalog', 'information_schema')
)
-- Get the count of open connections
SELECT
  (SELECT count(*) FROM pg_stat_activity) AS open_connections,
  db_size_bytes / (1024 * 1024) AS db_size_mb,
  table_name AS largest_table,
  table_row_count AS largest_table_row_count,
  table_size_mb AS largest_table_size_mb,
  table_bloat_ratio,
  table_compression_ratio,
  row_to_disk_ratio,
  row_to_total_ratio,
  disk_to_total_ratio,
  tuple_to_total_ratio
FROM
  database_stats, table_stats
ORDER BY
  table_size_bytes DESC
LIMIT 1;
