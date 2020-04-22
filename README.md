![GitHub Logo](https://cdn.discordapp.com/attachments/684175502340390963/701520952349032568/bce59262-db3b-4a2b-bf0b-ade276fbac6d_200x200.png)

# CollabWare (Project for UWB-Hacks-The-Cloud-2020)
A networking mobile app for developers with tinder-like functionality.

## Contributor
Austin Landas, 
Omar Iqbal, 
Quan Nghiem, 
Pranav Sakthivel

## Inspiration
We were inspired to do this because we wanted to find new ways to network and collaborate with other software developers. This idea came about a while ago, and we decided to stick with it when COVID-19 resulted in a stay at home order. A mobile app such as this allows developers to find new people to meet and work with in the safety of their home.

## What CollabWare does
CollabWare is a mobile app that has tinder-like functionality; you can press the heart button to connect with them, or x if you want to move on to the next person. However, instead of dating, the intention of this app is for software project ideas. A developer can input their idea in the bottom, as well as the languages that they are proficient in. If you press the heart button, they will show up in the chat page, and you can contact them to discuss about collaboration. Otherwise, if you click x, the app will show the next developer and their idea.

## How we built it
Our team used the Dart programming language along with Flutter, an open-source UI software development kit for Dart. Each team member worked on a separate component of the application: A login page, a home page, a settings page, and a chat page. Each page was built in a separate .dart file, and we had to find a way to have them all interact with each other when a button was pressed. Additionally, we had to integrate this with a cloud service. For our service, we chose GCP's Firebase, which allows us to create data with appropriate fields online, and use it for our project instead of hard-coding the text in.

The login page was a simple login page to allow us to sign up or sign in with our gmail account.

The home page has two buttons on the top: settings and chat, each of which leads to that corresponding page when the icon is pressed.

The settings page allows you to change information about yourself.

The chat page shows a list of developers that you pressed like on.

## What's next for CollabWare
CollabWare can implement more chat functionality, hold more users in the home page, and perhaps in the future, replicate the functionality of Tinder further by implementing a swipe feature instead of a button feature.

## WE WON!
We won the most innovative prize for the hackathon.
![GitHub Logo](https://media.discordapp.net/attachments/684175502340390963/702339018666410055/unknown.png?width=1307&height=677)
