import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegenet/models/users.dart';
import 'package:collegenet/services/auth.dart';
import 'package:flutter/material.dart';
 
final userRef = Firestore.instance.collection('users');


class ProfilePage extends StatefulWidget {
  ProfilePage({
    this.auth,
    this.onSignedOut,
    this.user,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  final User user;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
  //  getUserById();
    super.initState();
  }
  // getUserById() async {
  //   final String id="IAmNjAE45F5hW24GuFE4";
  //   final DocumentSnapshot doc = await userRef.document(id);
  //     print(doc.data);
  //     print(doc.documentID);
  //     print(doc.exists);
  // }

  void getUsers() async {
    final QuerySnapshot snapshot = 
      await userRef.where("isAdmin", isEqualTo: false).getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) { 
      print(doc.data);
      print(doc.documentID);
      print(doc.exists);
    });
  }
  void _logoutUser() async {
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e)
    {
      print("error: "+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.user.college),
          SizedBox(
            height: 15,
          ),
          Text(widget.user.username),
          SizedBox(
            height: 15,
          ),
          RaisedButton.icon(
            onPressed: _logoutUser, 
            icon: Icon(Icons.cancel),
            label: Text("SignOut")
          ),
        ],
    ),
    );
  }
}