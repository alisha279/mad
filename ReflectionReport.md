CS 442 - Week 1 Lab Task

Enhance the Counter App

Name: Alisha
Registration No: 04072313019

Personal Parameters

myThreshold = (0 + 1 + 9) + 5 = 15
mySeedColor = Colors.amber

Tasks Completed

1. I added a reset button with the refresh icon. It resets the counter back to 0.
2. I added a message **"You're on a roll!"** which appears when the counter goes above 15.
3. I added a reset counter which shows how many times the reset button has been pressed.
4. I changed the app theme using my personal seed color `Colors.amber`.
5. I added my name and registration number at the bottom of the app.

Screenshot
<img width="938" height="377" alt="image" src="https://github.com/user-attachments/assets/85eadefc-a681-45d3-85cd-f8039022dbf8" />


Reflection

In this lab, I learned how to use setState() to update the values shown on the screen. When I press the plus button, the counter increases because the value is changed inside setState(). I also used it for the reset button so that both the counter and reset count update on the screen. Without setState(), Flutter would not rebuild the screen when these values change.
