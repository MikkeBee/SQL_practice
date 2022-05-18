drop database if exists recipesdb3;
create database recipesdb3;

use recipesdb3;

create table country(
    countryId varchar(3) not null primary key,
    countryName varchar(50) not null,
    countrycodeAlpha2 varchar(2) not null,
    primaryLanguage varchar(30) not null
);

create table recipe(
    recipeId integer not null primary key,
    recipeName varchar(100) not null,
    countrycode varchar(3),
    instructions varchar(1000),
    foreign key (countrycode) references country(countryId)
);

create table recipeImage(
    imageId integer not null primary key,
    imageName varchar(20) not null,
    altText varchar(255),
    imageFile varchar(30) not null
);

create table recipe_has_image(
    recipeRef integer not null,
    imageRef integer not null,
    primary key(recipeRef,imageRef),
    foreign key (recipeRef) references recipe(recipeId),
    foreign key (imageRef) references recipeImage(imageId)
);

create table ingredient(
    ingredientId integer not null primary key,
    ingredientName varchar(40) not null,
    pictureName varchar(30)
);

create table recipe_has_ingredient(
    recipeNumber integer not null,
    ingredientNumber integer not null,
    amount decimal(5,2) not null,
    unit varchar(10) not null,
    primary key(recipeNumber, ingredientNumber),
    foreign key(recipeNumber) references recipe(recipeId),
    foreign key(ingredientNumber) references ingredient(ingredientId)
);

drop user if exists 'baker'@'localhost';
create user 'baker'@'localhost' identified by 'cake123';

grant all privileges on recipesdb3.* to 'baker'@'localhost';

insert into country values('FIN','Finland','FI','Finnish');
insert into country values('SWE','Sweden','SE','Swedish');

insert into recipe values(1,'cake','FIN','Bake a cake...');
insert into recipe values(2,'pancake','SWE','To make a Swedish pancake...');
insert into recipe values(3,'pannukakku','FIN','To make a Finnish pancake...');

+----------+------------+-------------+------------------------------+
| recipeId | recipeName | countrycode | instructions                 |
+----------+------------+-------------+------------------------------+
|        1 | cake       | FIN         | Bake a cake...               |
|        2 | pancake    | SWE         | To make a Swedish pancake... |
+----------+------------+-------------+------------------------------+


insert into ingredient values(1,'flour','flour.png');
insert into ingredient values(2,'sugar','sugar.png');
insert into ingredient values(3,'egg',null);
insert into ingredient values(4,'baking powder','bpowder.png');
insert into ingredient values(5,'milk','cow.png');
insert into ingredient values(6,'oil',null);
insert into ingredient values(7,'butter','butter.png');
insert into ingredient values(8,'salt',null);

+--------------+----------------+-------------+
| ingredientId | ingredientName | pictureName |
+--------------+----------------+-------------+
|            1 | flour          | flour.png   |
|            2 | sugar          | sugar.png   |
|            3 | egg            | NULL        |
|            4 | baking powder  | bpowder.png |
|            5 | milk           | cow.png     |
|            6 | oil            | NULL        |
|            7 | butter         | butter.png  |
+--------------+----------------+-------------+



insert into recipe_has_ingredient values(1,1,3.5,'dl');
insert into recipe_has_ingredient values(1,2,1,'handfull');
insert into recipe_has_ingredient values(1,3,3,'big ones');
insert into recipe_has_ingredient values(2,7,150,'g');
insert into recipe_has_ingredient values(2,1,0.5,'l');
insert into recipe_has_ingredient values(2,3,1,'cup');
insert into recipe_has_ingredient values(2,4,0.5,'spoon');
insert into recipe_has_ingredient values(2,5,1,'l');
insert into recipe_has_ingredient values(2,6,1,'dl');

+--------------+------------------+--------+----------+
| recipeNumber | ingredientNumber | amount | unit     |
+--------------+------------------+--------+----------+
|            1 |                1 |   3.50 | dl       |
|            1 |                2 |   1.00 | handfull |
|            1 |                3 |   3.00 | big ones |
|            2 |                1 |   0.50 | l        |
|            2 |                3 |   1.00 | cup      |
|            2 |                4 |   0.50 | spoon    |
|            2 |                5 |   1.00 | l        |
|            2 |                6 |   1.00 | dl       |
|            2 |                7 | 150.00 | g        |
+--------------+------------------+--------+----------+


select recipeName,instructions,ingredientName,amount,unit from recipe 
inner join ingredient on ingredient.ingredientId=recipe_has_ingredient.ingredientNumber
inner join recipe_has_ingredient on recipe_has_ingredient.recipeNumber=recipe.recipeId
where recipeName like 'pancake' order by amount desc; 

select * from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where recipeName='cake';

select ingredientName,amount,unit from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId where recipeName='pancake';

select recipeName from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where ingredientName='flour';

select ingredientName, recipeName from ingredient
left join recipe_has_ingredient on ingredientNumber=ingredientId
left join recipe on recipeNumber=recipeId;

-- all ingredients that are not used in any recipe
select ingredientName from ingredient
left join recipe_has_ingredient on ingredientNumber=ingredientId
where ingredientNumber is null;

-- all ingredients in use. the name is only once in the result set
select distinct ingredientName from ingredient
left join recipe_has_ingredient on ingredientNumber=ingredientId
where ingredientNumber is not null;

select distinct ingredientName from ingredient
inner join recipe_has_ingredient on ingredientNumber=ingredientId;

--get number of recipes by country
select countrycode, count(*) as NumberOfRecipes from recipe
group by countrycode
order by countrycode;

--get the number of ingredients in recipe. 
--resultset should include recipeName and numberOfIngredients
select recipeName, count(*) as `number of ingredients` from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
group by recipeName;

select recipeName, count(ingredientNumber) as `number of ingredients` from recipe
left join recipe_has_ingredient on recipeNumber=recipeId
left join ingredient on ingredientNumber=ingredientId
group by recipeName;


--get recipeName and instructions
select recipeName,instructions from recipe;

--shopping list for a cake and pancake, recipeName, ingredientName, amount and unit
select recipeName,ingredientName,amount,unit from recipe_has_ingredient
inner join recipe on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where recipeName in ('cake','pancake')
order by recipeName asc;

select recipeName,ingredientName,amount,unit from recipe_has_ingredient
inner join recipe on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where recipeName in ('cake','pancake')
order by ingredientName asc;¨

select ingredientName,amount,unit,recipeName from recipe_has_ingredient
inner join recipe on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where recipeName in ('cake','pancake')
order by ingredientName asc;

select ingredientName,amount,unit,recipeName from recipe_has_ingredient
inner join ingredient on ingredientNumber=ingredientId
inner join recipe on recipeNumber=recipeId
where recipeName in ('cake','pancake') and ingredientName='egg'
order by ingredientName asc;

insert into recipeImage values(1,'a',null,'a.png');
insert into recipeImage values(2,'b','b','b.png');
insert into recipeImage values(3,'c','c','c.png');
insert into recipeImage values(4,'d','d','d.png');
insert into recipeImage values(5,'e','e','e.png');
insert into recipeImage values(6,'f',null,'f.png');

insert into recipe_has_image values(1,1);
insert into recipe_has_image values(1,3);
insert into recipe_has_image values(1,4);
insert into recipe_has_image values(2,2);

select recipeName, countryName from recipe
inner join country on countrycode=countryId;


select imageName from recipeImage
inner join recipe on recipeRef=recipeId
where recipeName='cake';

select imageName from recipeImage
where recipeRef is null;

select recipeName from recipe
left join recipeImage on recipeRef=recipeId
where recipeRef is null;