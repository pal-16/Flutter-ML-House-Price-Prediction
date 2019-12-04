import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';

class ProductsGrid extends StatelessWidget {
    static const routeName = '/grid';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products=productsData.items;
    return GridView.builder(
      padding:const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx,i)=>ChangeNotifierProvider(
        builder: (c)=>products[i],
         //child:Scaffold(  
           //drawer: AppDrawer(),
      //body
      child:ProductItem(
        //products[i].id,
        //products[i].title,
        //products[i].imageUrl,

      ),
     
),
//),
        
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing:10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
