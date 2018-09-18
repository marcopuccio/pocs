-- RESTORE DATABASE FacturadorBeta
-- FROM DISK = '/var/opt/mssql/backup/db_Facturador_Beta.bak'
-- WITH 
-- MOVE 'FacturadorBeta' TO '/var/opt/mssql/data/FacturadorBeta.mdf',
-- MOVE 'FacturadorBeta_log' TO '/var/opt/mssql/data/FacturadorBeta_log.ldf';

RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/backup/db_Facturador_Beta.bak'