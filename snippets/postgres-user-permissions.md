# Granting access to postgres users

```sql
CREATE USER myuser  WITH ENCRYPTED PASSWORD 'ppp';
GRANT USAGE ON SCHEMA public to myuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO myuser;

GRANT CONNECT ON DATABASE mydb to myuser;
\c mydb
GRANT USAGE ON SCHEMA public to myuser;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO myuser;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO myuser;
```
