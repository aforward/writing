# See how much memory something consumes in PHP

```php
$start_time = microtime(true);
$start_memory = memory_get_usage();

// INSERT CODE HERE

$end_memory = memory_get_usage();
$end_time = microtime(true);

print_r(array(
  'memory (Mb)' => ($end_memory - $start_memory) / (1024 * 1024),
  'time (s)' => $end_time - $start_time
));
```
