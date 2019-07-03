# Flutter_Auth_User-Location_App


A simple Flutter Application that consists of Multiple Screens.



The first screen is a Form Widget that allows user to Log in to the application. It has three fields : Username , Password and Mobile Number. The Username and Password are hard coded to be the same. As soon as the user logs into the application by pressing the Log In Button below the fields , he/she is taken to the second page of the application. 




The second screen has a blank message field where the user can type his/her message that will be displayed in the end of the application. Also below the message the user can click an Image from his Mobile Camera or choose an Image from the Gallery of his/her mobile. This Image selected by the user is displayed below the message .By clicking on the submit button the user can proceed to the final page of the application. 




The final or the third page of the application asks for the permission to access the device's location from the user and if the permission is granted then , the current latitude and longitude of the user is displayed. The message submitted by the user on the second screen is also displayed on this final page. 


Dependencies used : image_picker : ^0.4.5  ,   
                    location : ^1.4.1
