IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'keycloakdb')
BEGIN
    CREATE DATABASE keycloakdb;
END
GO
