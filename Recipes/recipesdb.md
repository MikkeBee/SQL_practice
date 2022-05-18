#

We are creating a database to store recipe data.

The database consists of recipes and ingredients needed in the recipe.

The origins of the recipes are stored as a country code (ISO, 2 or 3 chars). For example, FIN or SWE.

http://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes

Recipe:

- id (unique)
- name
- countrycode
- instructions

Ingredients:

- id (unique)
- name
- pictureName

recipe_has_ingredient:

- recipeNumber
- ingredientNumber
- amount
- unit
