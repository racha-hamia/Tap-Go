STEPS TO START THE PROJECT : 

To start the project, you need to check if you are on the right versions of php and Laravel, which are php 7.4.27 and Laravel 8. 
When you pull the project, get in the api folder, and execute the following command : composer install. 
Next, you need to execute this one : cp .env.example .env, in order to set a .env for the project. 
Make sur  that you database has the same name as the one in the .env, which is called Laravel by default. You can either change it if needed, or create a new one with the same name. 
Then, all you need is to run the command : ./artisan serve to start your server ( if this command does not work later, do not worry, run ./artisan optimize before it to clear all you caches, and you should be all set to start it again. ) 

About the routes : 
- For starters, to create a user, you need to make a post request on the following url : http://127.0.0.1:8000/register 
The parameters needed for this step would be : login (with a maximum of 20 characters), password (with a minimum of 8 characters), email, name, first_name, & age.
- Then, for authentification to that user's account, make a a post request on the url : http://127.0.0.1:8000/auth 
The parameters needed here are obviously login and password. 
- If you need the users' list, just make a get request on the url : http://127.0.0.1:8000/users
- On the same path, if you need the restaurants' list, make a get request on the url : http://127.0.0.1:8000/restaurants 
- Now, to create one of these restaurants, make a post request on the url : http://127.0.0.1:8000/restaurant 
The parameters you will need for it are : name (with a minimum of 1 character), description(with a minimum of 25 characters to describe you place), grade, localization, phone_number(obviously containing exactly 10 characters), website, hours. 
- If you need to modify one of these parameters you just entered, all you have to make is a put request on the url : http://127.0.0.1:8000/restaurant/{id}, with the exact same parameters we just listed. 
- On the other hand, if you need to delete a restaurant, you will have to go on the same previous link using a delete request. 
- Following this same logic, to get the list of menus of a restaurant, make a get request on the url : http://127.0.0.1:8000/restaurant/{id}/menus.
- To create them, type a post request on the url : http://127.0.0.1:8000/restaurant/{id}/menu. 
The parameters you'll need here are : name, description, and price.
