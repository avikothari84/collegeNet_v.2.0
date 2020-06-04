import 'package:collegenet/models/users.dart';
import 'package:collegenet/services/auth.dart';
import 'package:flutter/material.dart';

class GlobalFiles extends StatefulWidget {
  GlobalFiles({
    this.auth,
    this.onSignedOut,
    this.user,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  final User user;
  @override
  _GlobalFilesState createState() => _GlobalFilesState();
}

class _GlobalFilesState extends State<GlobalFiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("GlobalFiles"),
    );
  }
}