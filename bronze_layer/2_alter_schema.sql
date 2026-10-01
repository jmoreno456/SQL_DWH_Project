-- alter schema name
ALTER SCHEMA bronze_layer
RENAME TO bronze;

ALTER SCHEMA silver_layer
RENAME TO silver;

ALTER SCHEMA gold_layer
RENAME TO gold;