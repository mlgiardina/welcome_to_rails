#Welcome to Rails
##Description
This project was our first foray into Rails. Our job was to write code that would display particular information from a database depending on the url. We took advantage of the url parser in Rails to do this.
##How to Use

- The database table is called "users"
- If you navigate to http://localhost:3000/users, every user in the database will be displayed.
- If you navigate to http://localhost:3000/users/90, only the user with the ID of 90 will be displayed.
- If you navigate to a url where the user ID doesn't exist, you will get a 404 Error.
- If you navigate to http://localhost:3000/users/NUMBER/delete, it will delete that user from the database.