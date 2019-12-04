import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final double rm;
  final double lstat;
  final double ptratio;
  final double nox;
  final double dist;
 // final double imageUrl;


  UserProductItem(this.id, this.rm, this.lstat,this.ptratio,this.nox,this.dist);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('my app'),
      leading: CircleAvatar(
      //  backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(

        width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                 Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              
            ],
          ),
      
      ),
    );
  }
}
