import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _rmFocusNode = FocusNode();
  final _lstatFocusNode = FocusNode();
  final _distFocusNode = FocusNode();
  final _ptratioFocusNode = FocusNode();
  final _noxFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String answer = "Your Price : ";
  var _editedProduct = Product(
    id: null,
    //price: 0,
    nox: 0,
    rm: 0,
    dist: 0,
    ptratio: 0,
    imageUrl:'',
    lstat:0,
  );
  var _initValues = {
    'nox': '',
    'rm': '',
    'dist': '',
    'ptratio':'',
    'lstat':'',
    'price':'',
   'imageUrl': '',
     
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'nox': _editedProduct.nox.toString(),
          'rm': _editedProduct.rm.toString(),
          'dist': _editedProduct.dist.toString(),
          'ptratio': _editedProduct.ptratio.toString(),
          'lstat': _editedProduct.lstat.toString(),
          'imageUrl': _editedProduct.imageUrl,
         
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _noxFocusNode.dispose();
    _rmFocusNode.dispose();
    _distFocusNode.dispose();
    _ptratioFocusNode.dispose();
    _lstatFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
      await Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('An error occurred!'),
                content: Text('Something went wrong.'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('SPY'),
      ),
      drawer: AppDrawer(),
        
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                      TextFormField(
                initialValue: _initValues['nox'],
                decoration: InputDecoration(labelText: 'nox'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _noxFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_noxFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
             onSaved: (value) {
                  _editedProduct = Product(
                      rm: _editedProduct.rm,
                      ptratio: _editedProduct.ptratio,
                      nox:double.parse(value),
                      dist:_editedProduct.dist,
                     // price: double.parse(value),
                      lstat: _editedProduct.lstat,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                    //  isFavorite: _editedProduct.isFavorite
                    );
                },  ),
                
                   TextFormField(
                initialValue: _initValues['rm'],
                decoration: InputDecoration(labelText: 'rooms available'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _rmFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_rmFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
             onSaved: (value) {
                  _editedProduct = Product(
                      rm: double.parse(value),
                      ptratio: _editedProduct.ptratio,
                      nox:_editedProduct.nox,
                      dist:_editedProduct.dist,
                     // price: double.parse(value),
                      lstat: _editedProduct.lstat,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                      //isFavorite: _editedProduct.isFavorite
                      );
                },  ),
                    TextFormField(
                initialValue: _initValues['dist'],
                decoration: InputDecoration(labelText: 'distance from nearest emploement sector'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _distFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_distFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
               onSaved: (value) {
                  _editedProduct = Product(
                      rm: _editedProduct.rm,
                      ptratio: _editedProduct.ptratio,
                      nox:_editedProduct.nox,
                      dist:double.parse(value),
                     // price: double.parse(value),
                      lstat: _editedProduct.lstat,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                      //isFavorite: _editedProduct.isFavorite
                      );
                },  ),
                 TextFormField(
                initialValue: _initValues['ptratio'],
                decoration: InputDecoration(labelText: 'Pupil teacher ratio'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _ptratioFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_ptratioFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                 onSaved: (value) {
                  _editedProduct = Product(
                      rm: _editedProduct.rm,
                      ptratio:double.parse(value),
                      nox:_editedProduct.nox,
                      dist:_editedProduct.dist,
                     // price: double.parse(value),
                      lstat: _editedProduct.lstat,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                     // isFavorite: _editedProduct.isFavorite
                     );
                },  ),
               TextFormField(
                initialValue: _initValues['lstat'],
                decoration: InputDecoration(labelText: 'poverty'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _lstatFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_lstatFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                   onSaved: (value) {
                  _editedProduct = Product(
                      rm: _editedProduct.rm,
                      ptratio: _editedProduct.ptratio,
                      nox:_editedProduct.nox,
                      dist:_editedProduct.dist,
                     // price: double.parse(value),
                      lstat: double.parse(value),
                     imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,);
                     // isFavorite: _editedProduct.isFavorite);
                },  ),
               
               Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                rm: _editedProduct.rm,
                              lstat: _editedProduct.lstat,
                               dist: _editedProduct.dist,
                              ptratio: _editedProduct.ptratio,
                              nox: _editedProduct.nox,
                                imageUrl: value,
                                id: _editedProduct.id,
                               // isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                       Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                      
                          child: FlatButton.icon(
                         color: Colors.red,
                         icon: Icon(Icons.add), //`Icon` to display
                          label: Text('Predict'), //`Text` to display
                        onPressed: _saveForm, 
                         ),
                         ),
                      ],
                  ),
                  Container(
                    child: Text(answer),
                  )
    ],
                ),
              ),
          ),
    );
  }
}
