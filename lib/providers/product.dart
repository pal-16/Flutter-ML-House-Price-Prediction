import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  //final double title;
  //final double price;
  final  nox;
  final double rm;
  final double dist;
  final double ptratio;
  final double lstat;
  //final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {
      @required this.id,
      @required this.nox,
      @required this.rm,
      @required this.dist,
      @required this.ptratio,
      @required this.lstat,
     // @required this.price
      @required this.imageUrl,
    //  this.isFavorite = false
      }
    );
    void toggleFavorite(){
      isFavorite=!isFavorite;
      notifyListeners();
    }
}
