import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/products_overview.dart';
import '../screens/products_detail_screen.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Expanded(
              child: new Material(
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      child: Text(
                        'Search your property',
                        style: TextStyle(color: Colors.white),
                      ),
                      elevation: 3.0,
                      color: Colors.black,
                      onPressed: () {
                     

              Navigator.of(context).push(MaterialPageRoute(
                builder:(ctx)=>ProductsOverviewScreen(),
              ),);
              },
                    ),
                  ),
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: new NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRsSNC3JzTCC7XUayDtvmwj1eCCSKvje3fvxn0yuUnYSRKtlsn0"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            new Expanded(
              child: new Material(
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      child: Text(
                        'Predict your property',
                        style: TextStyle(color: Colors.white),
                      ),
                      elevation: 3.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(EditProductScreen.routeName);
                      },
                    ),
                  ),
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: new NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTnfBDLzEJlxCLW2-SaDoZCxmv5ovkOeeM8SC9rN_oyje85mePh"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
