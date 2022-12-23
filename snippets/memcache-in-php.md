# Memcache in PHP

```php
$memcache = new Memcache();
$memcache->connect('localhost', 11211);

function doSomethingSlow() {
  sleep(5);
  return "foobar";
}

$name = $memcache->get('name');
if (!$name)
{
  $name = doSomethingSlow();
  $memcache->set('name',$name);
}

echo $name;
```
