import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/products_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
 // final String id;
  //final String title;
 // final String imageUrl;
  //ProductItem(this.id ,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
        //  child: Image.network(
          //  product.imageUrl,
            //fit: BoxFit.cover,
          //),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          /*leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavorite();
                }),
          ),*/
          title: Text(
            product.nox,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
