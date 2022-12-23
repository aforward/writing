# How to change owners of a postgres database

```sql
GRANT ALL PRIVILEGES ON DATABASE @DATABASE_NAME@ TO @NEW_USERNAME@;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO @NEW_USERNAME@;
```

For example, changing from the 'postgres' user to the 'deployer' user.

```sql
GRANT ALL PRIVILEGES ON DATABASE my_app TO deployer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO deployer;
```
