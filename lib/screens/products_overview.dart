

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/products_detail_screen.dart';
import '../providers/products.dart';
import '../widgets/products_grid.dart';
import '../widgets/app_drawer.dart';
class ProductsOverviewScreen extends StatelessWidget {
   static const routeName = '/overview';

  @override
 Widget build(BuildContext context) {
   return ChangeNotifierProvider(
      builder:(ctx)=>Products() ,
          child: Scaffold(
      appBar: AppBar(
        title: Text('SPY'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),

      body: 
            ProductsGrid()
      
    
        
        
      
     
    ),
    
    );
  }
 
}



