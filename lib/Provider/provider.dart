
import 'package:fashion_e_commerce_app/Firebase/FirebaseStorage.dart';
import 'package:fashion_e_commerce_app/data/app_data.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderClass extends ChangeNotifier{

 bool _isSearchActive = false;

bool get isSearchActive =>_isSearchActive;

 void isSearchFunction(){
  _isSearchActive=!_isSearchActive;
  notifyListeners();



}

 List<int> _favoriteItems = [];
  List<int> get favoriteItems => _favoriteItems;



  void toggleFavorite(int id) {
    if (_favoriteItems.contains(id)) {
      favoriteItems.remove(id);
    } else {
      _favoriteItems.add(id);
    }
    notifyListeners();
  }

  bool isFavorite(int id) {
    return _favoriteItems.contains(id);
  }



   int _selectedSize = 3;
   int get selectedSize => _selectedSize;


  int _selectedColor = 0;
  int get selectedColor => _selectedColor;


  setSize(index){
    _selectedSize=index;
    notifyListeners();
  }

   setColor(index){
    _selectedColor=index;
    notifyListeners();
  }


   onSearch(String search) {
    itemsOnSearch = mainList.where((element) => element.name.toLowerCase().contains(search)).toList();
    notifyListeners();
  }

  onClose(){
     itemsOnSearch = mainList;
     notifyListeners();

  }

//Bottom Nav Bar
int _selectedIndex = 0;
int get selectedIndex => _selectedIndex;

 

 void onItemTapped(int index) {
    _selectedIndex = index;
    
    notifyListeners();
  }

//Firebase Provider


  Image? _image1;
  Image? _image2;
  Image? _image3;

  Image? get image1=>_image1;
   Image? get image2=>_image2;
  Image? get image3=>_image3;



  Future<void> fetchImages(BuildContext context) async {
    FireStorageServices storage = Provider.of<FireStorageServices>(context, listen: false);
    _image1 = await storage.getImage(context, '1.jpg');
    _image2 = await storage.getImage(context, 'background_image.jpg');
    _image3 = await storage.getImage(context, 'man2.jpg');
    notifyListeners();
  }
}


