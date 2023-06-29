
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FireStorageServices extends ChangeNotifier {
  FireStorageServices();

  static final Map<String, Image> _cachedImages = {};

  static Future<Image> loadImage(BuildContext context, String imageName) async {
    if (_cachedImages.containsKey(imageName)) {
      return _cachedImages[imageName]!;
    } else {
      final url = await FirebaseStorage.instance.ref().child(imageName).getDownloadURL();
      final image = Image.network(url.toString(), fit: BoxFit.scaleDown);
      _cachedImages[imageName] = image;
      return image;
    }
  }

  Future<Image> getImage(BuildContext context, String imageName) async {
    return await loadImage(context, imageName);
  }
}





// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// class FireStorageServices extends ChangeNotifier{

//   FireStorageServices( );

//   static Future<dynamic> loadImage(BuildContext context,String Image) async {
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }



// Future<Widget> getImage(BuildContext context, String imageName) async {
//   return FireStorageServices.loadImage(context, imageName).then((value) {
//     return Container(
//       child: Image.network(
//         value.toString(),
//         fit: BoxFit.scaleDown,
//       ),
//     );
//   });
// }




// }
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// class FireStorageServices extends ChangeNotifier {
//   FireStorageServices();

//   static Future<dynamic> loadImage(BuildContext context, String imageName) async {
//     return await FirebaseStorage.instance.ref().child(imageName).getDownloadURL();
//   }

//   Future<List<Widget>> getImages(BuildContext context, List<String> imageNames) async {
//     List<Widget> images = [];

//     for (String imageName in imageNames) {
//       await loadImage(context, imageName).then((value) {
//         images.add(
//           Container(
//             child: Image.network(
//               value.toString(),
//               fit: BoxFit.scaleDown,
//             ),
//           ),
//         );
//       });
//     }

//     return images;
//   }
// }





