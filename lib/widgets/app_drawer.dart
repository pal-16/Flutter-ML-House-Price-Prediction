import 'package:flutter/material.dart';
import 'package:housing_app/screens/products_overview.dart';
import 'package:housing_app/screens/user_products_screen.dart';
import './products_grid.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('SPY'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
           Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('home page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
         
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('list of all houses '),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('About us'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
            Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Contact us'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
         
         
         
         
         
        ],
      ),
    );
  }
}
