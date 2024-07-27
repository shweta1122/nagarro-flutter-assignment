import 'package:flutter/material.dart';
import 'login_page.dart';
import 'contact_us_page.dart';

// ignore: use_key_in_widget_constructors
class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "U",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
        ],
      ),
    );
  }
}
