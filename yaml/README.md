# YAML: Yet another markup language
Yaml is a data serialization language used for cross-language data sharing, log files, debugging of complex data structure, interprocess messaging, object persistence, and configuration files
It uses space to define something(tab can be used but problematic in many cases), is case sensitive, language independent(same yaml can be used with python ruby etc)

## Basic Key value pairs to set value against a key  
```yaml
key1: value1
key2: value2
```
## List of Items

```yaml
list:
  - item1
  - item2
  - item3 
```
## List within List
```yaml
nested_list:
  - item1
  - - item21
    - item22
  - item3
```
## Dictionary : Set of Key/value pairs  
```yaml
dict:
  key1: value1
  key2: value2
```
## Dictionary within in dictionary   
```yaml
nested_dct:
  key3: value3
  key4: value4
  in_dct: 
    key51: value51
    key52: value52
  key6: value6 
```
## Dictionary within List
```yaml
list : 
  - item1
  - key1: value1
    key2: value2
```
## List within Dictionary
```yaml
dict_in_list:
  - item1
  - key3: value3
    key4: value4
  - item4
  - item5
```

## Read Yaml file using python
```py
with open(filename) as ymlfile:
        sample = yaml.load(ymlfile, Loader=yaml.FullLoader)
        l = sample['lst']
        for item in l:
            print l
```
## Write to Yaml file using Python
```py
dct = {
        'key1':'value1',
        'key2':['value21','value22','value23'],
        'key3':{'key31':'value31','key32':'value32','key33':'value33',},
        'key4':'value4',
    }
    with open(filename,'w') as outputfile:
        yaml.dump(dct,outputfile)
```