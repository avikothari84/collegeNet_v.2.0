import 'package:collegenet/models/users.dart';
import 'package:collegenet/services/auth.dart';
import 'package:flutter/material.dart';

class LocalFiles extends StatefulWidget {
  LocalFiles({
    this.auth,
    this.onSignedOut,
    this.user,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  final User user;
  @override
  _LocalFilesState createState() => _LocalFilesState();
}

class _LocalFilesState extends State<LocalFiles> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Local Files"
    );
  }
}