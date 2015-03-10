User - Devise

has many recipes
has many comments
has many likes 
- name
- email
- bio

Recipe

belongs to user

-user_id
- name
- image
- category
- instructions

Comments

belongs to user
belongs to recipe

-user_id
-body

Like

belongs to user
belongs to recipe

- userid
-recipeid