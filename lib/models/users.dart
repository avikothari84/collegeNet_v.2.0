import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String id;
  final String username;
  final String college;
  
  User({
    this.id,
    this.username,
    this.college,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['id'],
      username: doc['username'],
      college: doc['college'],
    );
  }
}