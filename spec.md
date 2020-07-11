# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  Runs on the web

- [x] Use ActiveRecord for storing information in a database
  Uses ActiveRecord for a database under the db file.

- [x] Include more than one model class (e.g. User, Post, Category)
  Has three models. User, Category and Fact.

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  Has two many to many relationships. Users have many facts and categories have many facts.

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  facts belong to both users and categories

- [x] Include user accounts with unique login attribute (username or email)
  Signup route checks to see if the name is already in use

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  facts belong to users and can be viewed and deleted. User information can be edited. Comments belong to a
  user and they can be created, viewed, updated and deleted.

- [x] Ensure that users can't modify content created by other users
  Sessions and user ids are used to keep track of which user is currently logged in and accounts have secured passwords.

- [x] Include user input validations
  login checks to see if nothing is added

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  README has all of this information

Confirm
- [x] You have a large number of small Git commits
  has a large number of commits

- [x] Your commit messages are meaningful
  tried to make it as meaningful as possible within one sentence

- [x] You made the changes in a commit that relate to the commit message
  commit messages are tied to what was done in the commit

- [x] You don't include changes in a commit that aren't related to the commit message
  to the best of my ability
