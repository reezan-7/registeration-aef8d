import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registeration/loginpage.dart';

import 'main.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkuser(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator if the future is not yet complete
          return CircularProgressIndicator();
        } else {
          // Return the UI based on the result of the future
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data ?? LoginPage();
          }
        }
      },
    );
  }

  Future<Widget> checkuser()async {
    final user = FirebaseAuth.instance.currentUser;
    if(user!=null) {
      return MyHomePage(title: "HomeScreen");
    }
    else{
      return LoginPage();
    }
    }
}
