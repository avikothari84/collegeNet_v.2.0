import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegenet/pages/localfiles.dart';
import 'package:collegenet/pages/hostevent.dart';
import 'package:collegenet/pages/profilepage.dart';
import 'package:collegenet/services/auth.dart';
import 'package:collegenet/models/users.dart';
import 'package:collegenet/pages/globalfiles.dart';
import 'package:collegenet/pages/activeevents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collegenet/pages/setupusername.dart';

final usersRef = Firestore.instance.collection("users");
User  currentUser;

class HomePage extends StatefulWidget {

  HomePage({
    this.auth,
    this.onSignedOut
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variables 
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    print("1time");
    createUserInFirestore();
    pageController = PageController();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  createUserInFirestore() async {

    //Check if user exist in user database according to ID

    final String userid = await widget.auth.getCurrentUser();
    DocumentSnapshot doc = await usersRef.document(userid).get();
    
    //if user doesn't exist then go to create account page
    if(!doc.exists)
    {
      final data = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));  
      print(data);
  
    //get username from create account, use it to make new document in users collection

      usersRef.document(userid).setData({
        "id":userid,
        "username":data[0],
        "college":data[1],
      });
      doc = await usersRef.document(userid).get();
    }
    currentUser = User.fromDocument(doc);
    print(currentUser.username);
  }

  onPageChanged(int pageIndex){
      setState(() {
        this.pageIndex= pageIndex;
      });
  }

  onTap(int pageIndex){
    pageController.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Chelsea',
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        children: <Widget>[
          LocalFiles(),
          GlobalFiles(),
          ActiveEvents(),
          HostEvent(),
          ProfilePage(
            auth: widget.auth,
            onSignedOut: widget.onSignedOut,
            user: currentUser,
          )
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics()
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: onTap,
          activeColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.book)),
            BottomNavigationBarItem(icon:Icon(Icons.collections_bookmark)),
            BottomNavigationBarItem(icon:Icon(Icons.event_available)),
            BottomNavigationBarItem(icon:Icon(Icons.event_note)),
            BottomNavigationBarItem(icon:Icon(Icons.person)),
          ]
          )
    );
  }
}
