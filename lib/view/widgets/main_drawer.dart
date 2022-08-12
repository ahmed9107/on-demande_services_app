import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(child: Image.asset('assets/images/a.png')),
        const ListTile(
          leading: Icon(Icons.contact_phone_outlined),
          title: Text('Contact'),
        ),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),
        const ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
        ),
      ]),
    );
  }
}
