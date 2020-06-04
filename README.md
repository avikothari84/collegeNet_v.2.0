# collegeNet_v.2.0

## Pending
* loading screens.
* form validations.
* message boxes for duplicate emailid or username.
* message boxes for username,password length.

## Overview
### 5 pages:
  * local files
  * global files
  * host event
  * active events
  * profile page

## Servies
auth.dart has AuthImplementation class, which has 4 functions signin,signout,getcurrrentuser,signup.

## Pages
Pages Directory has all the pages to be displayed in app.
In each page to get username and password: 
 * to get college name of user as a String use: widget.user.college 
 * to get username as a String use: widget.user.college 
 * to get database uid of a user use: widget.user.id 
 
## Models
currently only 1 model users.
