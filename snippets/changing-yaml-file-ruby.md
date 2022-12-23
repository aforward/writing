# Changing a YAML file in Ruby

```ruby
require "yaml"
File.open("./example.yml", 'w') {|f| f.write("
workbook: 5
sheet: 10
header_index: 5
headers:
  - hello
  - hi
  - bye
") }
data = YAML.load_file("./example.yml")
puts "OLD DATA: #{data}"

data["headers"] = [ "Hello", "Hi", "Bye" ]
File.open("./example.yml", 'w') {|f| f.write(data.to_yaml) }

data = YAML.load_file("./example.yml")
puts "NEW DATA: #{data}"
```
