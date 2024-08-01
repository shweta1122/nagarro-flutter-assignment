# Movie ticket Booking App 
Please follow the following steps to the question. Create a movie ticket booking app in flutter, which contains the following features.  

## Pages 
1. Home Page with tabs – a) Movies Page and b) Current Bookings 
2. Drawer having Profile Header and options for Login and Contact Us 
3. Login Page – with email/mobile and password to login 
4. Contact us – dummy page 
5. Movies Page – List of currently running movies with Image and Name of movie 
6. Current Bookings Page – List of my bookings with Movie name, theatre name, Time 
of show. 
7. Movie Detail Page - with image, name, and a list of theatres running that movie. 
8. Booking Page - with number of seats, price per seat and total price.  
9. Booking confirmation page  

### Home Page 
1. Home page should have 2 tabs – Movies and Current bookings 
2. One icon on top left to open drawer 

### Drawer 
Drawer should have 
1.  Profile Information in header 
    1. Display profile picture (initially dummy picture will be shown and user can update the profile picture by clicking image /uploading from gallery)  
    Note – no need to save the picture . It only needs to be visible in the current session 
    2. Logged in User information like : Email/Mobile 
1.  Navigation menu with options: 
    1. Login 
    2. Contact Us  - Dummy - No need to add functionality on click – just list of option is sufficient 

### Login Page 
Redirect here from the drawer option. 
User can login either with email/mobile number and password. 
Use 1 or 2 credentials to allow the user to login. Keep them in the code. And share the same 
with your solution in a text file. 

### Tabs 
1. Movies Tab 

    List of movies with: 
    1. Name of the movie 
    1. Image 
    
    On click of a movie tile, User should be redirected to Movie Detail Page. 
    
2. Current bookings Tab 
    List of current bookings with following details: 
    1. Name of movie 
    1. Theatre name 
    1. Show start time 
    1. Price paid 

### Movie Detail Page 
Detail Page should have name, short description and image of the movie and a list of movie 
halls currently running the movie. Use hard coded data to get the detail, cloud api or 
database is nice to have. 

(Assumption – ticket availability to be shown for next day only. Don’t go into details of the 
date. Each theatre to have only 3 shows  with start time 12 noon, 3 pm, 6pm) 

### Booking Page 
On clicking any of the seat count (show button), user will be redirected to Booking Page with 
Name of movie and Cinema Hall, remaining seat count and price per ticket.  

User can select number of tickets from 0-10 and confirm booking. 


### Booking Confirmation Page 
On click of Confirm Booking button above, user will be directed to this page. This page will 
have a confirmation message and a button to go back to home page. 

**Things to consider:**

1. Native feature implementation like Camera/upload from gallery is mandatory 
1. You can use any state management solution 
1. Solution should work on different screen resolution and sizes. 