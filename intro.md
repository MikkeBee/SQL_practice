# Intro

## storing data

1. memory
   - memory will be cleared on every boot / programme start
2. disk
   - for persistance, stores until next boot / programme start

## Disk storage

- plain text file
- structured text file
  - json
  - csv / tab
  - xml
  - ini
  - svg (xml for images)
- binary file
  - data in binary format
  - images
  - audio

### Examples

#### JSON

```json
{
  "firstname": "Matt",
  "lastname": "River",
  "age": 20
}
```

#### CSV

```
firstname,lastname,age
"Matt", "River", "20" (if spaces, then quotations)
```

#### XML

```xml
<?xml version="1.1" encoding="UTF-8" ?>
<persons>
    <person>
    <firstname>Matt</firstname>
    <lastname>River</lastname>
    <age>20</age>
    </person>
</persons>

```

#### ini

```ini
;this is a comment in an ini file
[database]
driver = mysql
host = localhost
port = 3306
databasename = persondb
[user]
username = zeke
```

#### svg

## Databases

includes database handling programmes such as manipulating data and manipulating database structure and users, etc.

- relational databases
  - sql language
- non-relational databases
  - NoSql (for example MongoDB)

## Datastorage Usage

`client app`

`datastorage layer` (API)

`database engine` (API, for example SQL)

`disk storage` (API, read/write disk etc.)

### Version 2 with different storage engine

`client app`

`datastorage layer` (API)

`Our own dataengine` (API)

`disk storage` (API, read/write disk etc.)

# Relational databases

```json
{
  "firstname": "Matt",
  "lastname": "River",
  "age": 20
}
```

csv-format resembles relational table

```csv
firstname,lastname,age
"Matt", "River", "20"
```

Relation/table

| firstname | lastname | age |
| --------- | -------- | :-: |
| 'Matt'    | 'River'  | 20  |
| 'Mary'    | 'Smith'  | 30  |

```csv
id,firstname,lastname,age
1,Matt,River,20
2,Mary,Jones,30
3,Mary,Jones,10
```

Relation/table

| id  | firstname | lastname | age |
| :-: | --------- | -------- | :-: |
|  1  | 'Matt'    | 'River'  | 20  |
|  2  | 'Mary'    | 'Smith'  | 30  |
|  3  | 'Mary'    | 'Smith'  | 10  |

## multiple tables

```json
{
  "firstname": "Matt",
  "lastname": "River",
  "age": 20,
  "computer": { "name": "Brain I", "price": 200 }
}
```

```csv
firstname,lastname,age,cname,cprice
Matt,River,20,"Brain I",200
```

put all computers in their own csv file, also add ID to computer

```csv
id,name,price
1,"Brain I",200
2,"Blast X200 GT",900
```

add computer as reference to person csv-file

```csv
id,firstname,lastname,age
1,Matt,River,20
```

persons and computers

````csv
personid, computerid
1,1
1,2


```json
{
  "firstname": "Matt",
  "lastname": "River",
  "age": 20,
  "computer": [
    { "name": "Brain I", "price": 200 },
    { "name": "Blast X200 GT", "price": 900 }
  ]
}
````

in relational terms personid and computerid are foreign keys. Foreign key refers to another table's primary key.

## Relational model

**person**
id|firstname|lastname|age
:---:|---|---|:---:
1|'Matt'|'River'|20
2|'Mary'|'Smith'|30
3|'Mary'|'Smith'|10

**computer**
id|name|price
:---:|---|---:
1|'Brain I'|200
2|'Blast X200 GT'|900

**person_has_computer**
personid|computerid
:---:|:---:
1|1
1|2
2|1

### create statements for tables

```sql
create table person(
  id integer not null primary key,
  firstname varchar(20) not null,
  lastname varchar(30) not null,
  age integer not null
);

create table computer(
  id integer not null primary key,
  name varchar(50) not null,
  price integer
);

create table person_has_computer(
  personid integer not null,
  computerid integer not null,
  primary key(personid,computerid),
  foreign key (personid) references person(id),
  foreign key (computerid) references computer(id)
);
```
