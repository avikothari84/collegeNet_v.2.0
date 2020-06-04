import 'package:collegenet/models/users.dart';
import 'package:collegenet/services/auth.dart';
import 'package:flutter/material.dart';

class HostEvent extends StatefulWidget {
  HostEvent({
    this.auth,
    this.onSignedOut,
    this.user,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  final User user;
  @override
  _HostEventState createState() => _HostEventState();
}

class _HostEventState extends State<HostEvent> {
  @override
  Widget build(BuildContext context) {
    return Text("HostEvent");
  }
}