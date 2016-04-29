DO $$
BEGIN

IF EXISTS (select * from pg_available_extensions where name = 'dblink' and installed_version is not null) THEN
   RAISE NOTICE 'DBLINK Extension already exists'; 
ELSE
   create extension dblink;
END IF;

END;
$$;

DO $$
BEGIN

IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'MyDb') THEN
   RAISE NOTICE 'Database already exists'; 
ELSE
   PERFORM dblink_exec('dbname=' || current_database() || ' user=postgres password=testresults' -- current db
                     , 'CREATE DATABASE "PerfResults" TABLESPACE = pg_default');
END IF;

END; 
$$;