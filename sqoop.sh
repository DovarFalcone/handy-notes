#!/bin/bash

sqoop import \
    --connect jdbc:sqlserver://<MSServer>:<Port>;database=<DBName> \
    --username <Username> \
    --password <Password> \
    --table <TableName> \
    --target-dir <TargetDirectoryInHDFS> \
    --delete-target-dir \
    --m 1
