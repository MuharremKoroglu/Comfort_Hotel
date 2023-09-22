# Comfort Hotel
### Hi there, I'm Muharrem <img src = "https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width = "42"> 
#### Thank You for taking the time to view my repository 

## <h2> About This App <img src = "https://c.tenor.com/JsoERRQcZqYAAAAi/thumbs-up-joypixels.gif" width = "42"></h2>
This application is a hotel guest registration application. Shows developers how to use the Core Data class. When opening the application, the name of the hotel logo and two buttons appear on the screen. Segue operations are performed with these buttons. The first button is used to show registered guests. A Label and Tableview greet the user who clicks this button. To use the TableView structure, we inherited the UITableViewDelegate and UITableViewDataSource classes into our project. Then we activated the numberOfRowsInSection and cellForRowAt functions. This is how we started using the TableView structure. The second button on the main screen leads to the new guest registration screen. On this Screen, an ImageView is used for the guest image and five textFields are used for the guest's personal information. At the bottom of the screen is the save button. This button is not active until the guest image is added. It also doesn't show up when reviewing records. We have created a function using the UIImagePickerController() class so that the user can select an image from the phone's photo gallery. We determined what happens when the selection screen is closed with the didFinishPickingMediaWithInfo function. We do the saving to Core Data inside the save button. First, we reach the appDelegate and context structures. Then, we inform you that we will save information to the Core Data we created using the NSentityDescription.insertNewObject method. Then we bring the data from TextFields to CoreData with the setValue method. Finally, we perform the recording process with the context.save method. But this structure needs to be used within the do-try-catch block. Otherwise, we may encounter an error. Finally, we made a publication about adding a new element to the guest list page using the NotificationCenter class. To show the visitors we registered in the visitor list, we reached the AppDelegate and context structures in the same way. Then we got the data stored in CoreData with the NSFetchRequest method. We gave the data we received to ImageView and TextField structures and showed it to the user. We showed the broadcast we sent from the guest add the page to the user with the NotificationCenter.default.addObserver method in viewWillAppear. Then we used the commit function so that the user could delete the saved visitors. To delete the data here, we first pulled the data from CoreData. Then we filtered the incoming data with the .predicate method. In this way, only the data that the user wants to delete will be deleted, not the entire list. Finally, we showed the user added warning using the UIAlertController class.

<h2> Used Technologies <img src = "https://media2.giphy.com/media/QssGEmpkyEOhBCb7e1/giphy.gif?cid=ecf05e47a0n3gi1bfqntqmob8g9aid1oyj2wr3ds3mg700bl&rid=giphy.gif" width = "42"> </h2>
<div class="row">
      <div class="column">
<img width ='72px' src 
     ='https://raw.githubusercontent.com/MuharremKoroglu/MuharremKoroglu/main/swift-icon.svg'>
  </div>
</div>

<h2> Used Language <img src = "https://media.giphy.com/media/Zd6jPg8hcp4Q3vrvjo/giphy.gif" width = "42"> </h2>
<div class="row">
      <div class="column">
<img width ='82px' src 
     ='https://upload.wikimedia.org/wikipedia/commons/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg'>
  </div>
</div>

<h2> Images <img src = "https://media2.giphy.com/media/psneItdLMpWy36ejfA/source.gif" width = "62"> </h2>
  <div class="column">



https://user-images.githubusercontent.com/68854616/194701026-7f847e1c-2d18-4f89-8125-c3629e388df2.mp4





  </div>
<h2> Connect with me <img src='https://raw.githubusercontent.com/ShahriarShafin/ShahriarShafin/main/Assets/handshake.gif' width="100"> </h2>
<a href = 'mailto:muharremkoroglu245@gmail.com'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/MuharremKoroglu/MuharremKoroglu/main/gmail-logo-2561.svg"/></a> &nbsp;
<a href = 'https://www.linkedin.com/in/muharremkoroglu/'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/rahulbanerjee26/githubAboutMeGenerator/main/icons/linked-in-alt.svg"/></a> &nbsp;
<a href = 'https://muharremkoroglu.medium.com/'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/rahulbanerjee26/githubAboutMeGenerator/main/icons/medium.svg"/></a> &nbsp;
<a href="https://www.instagram.com/m.koroglu99/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/instagram.svg" alt="_._.adam._"  width="32px" align= 'center' /></a> &nbsp;
<a href = 'https://synta-x.com/'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/MuharremKoroglu/MuharremKoroglu/main/internet-svgrepo-com%20(2).svg"/></a> &nbsp;















