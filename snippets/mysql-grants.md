# Granting access to mysql users

```sql
SHOW GRANTS FOR deployer
# ALL ACCESS
GRANT ALL ON myshop.* TO 'deployer'@'%' IDENTIFIED BY 'pass' ;
# SELECT ONLY, and filtered by IP
GRANT SELECT ON myshop.* TO deployer@'192.168.1.%' IDENTIFIED BY 'pass';
# Or by domain name
GRANT SELECT ON myshop.* TO deployer@'webapp.myserver.com' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
```
## Removing access to mysql users

```sql
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'deployer'@'%';
```