CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'AltafAnsari@123';

CREATE DATABASE SCOPED CREDENTIAL altaf_cred
WITH IDENTITY = 'Managed Identity';


CREATE EXTERNAL FILE FORMAT parquet_format
WITH(
    FORMAT_TYPE = PARQUET
);


CREATE EXTERNAL DATA SOURCE datasource_adls
WITH (
    LOCATION = 'https://stecomanalyticsprod.dfs.core.windows.net/bronze-raw/bronze',
    CREDENTIAL = altaf_cred
);

CREATE EXTERNAL DATA SOURCE silver_datasource
WITH (
    LOCATION = 'https://stecomanalyticsprod.dfs.core.windows.net/silver-clean/silver layer',
    CREDENTIAL = altaf_cred
);

CREATE EXTERNAL DATA SOURCE gold_datasource
WITH (
    LOCATION = 'https://stecomanalyticsprod.dfs.core.windows.net/gold/gold model',
    CREDENTIAL = altaf_cred
);