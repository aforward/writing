# Delete Rails sessions

Remove all old sessions, and then optimize the table.</p>

```sql
DELETE
FROM sessions
WHERE updated_at < DATE_SUB(NOW(), INTERVAL 1 DAY);

optimize TABLE sessions;
```