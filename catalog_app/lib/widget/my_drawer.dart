import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://cdn.dribbble.com/users/3734064/screenshots/14413405/media/6744f33319119e4db7637ba5b49e5d78.png";
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        children: const <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Swapnil Patel"),
              accountEmail: Text("sambhu815@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.info,
              color: Colors.white,
            ),
            title: Text(
              "About us",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2
            ),
          )
        ],
      ),
    );
  }
}
