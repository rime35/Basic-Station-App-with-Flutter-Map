import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerKullanimi extends StatelessWidget {
  const DrawerKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('home'),
          backgroundColor: Colors.blue,
        ),
        drawer: const NavigationDrawer(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: Text('Favoirets'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.workspaces_outline),
            title: Text('Workflow'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: Text('Updates'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: Text('Plugins'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notification_add_outlined),
            title: Text('Notifications'),
            onTap: () {},
          ),
        ],
      );
}
