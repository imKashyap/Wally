import 'package:flutter/widgets.dart';

class Viewer with ChangeNotifier {
  String name;
  String uid;
  String email;
  String imgUrl;

  Viewer({
    @required this.name,
    @required this.uid,
    @required this.email,
    @required this.imgUrl,
  });

  // void updateWith({
  //   String name,
  //   String uid,
  //   String email,
  //   String imgUrl,
  // }) {
  //   this.email = email ?? this.email;
  //   this.name = name ?? this.name;
  //   this.uid = uid ?? this.uid;
  //   this.imgUrl = imgUrl ?? this.imgUrl;
  //   notifyListeners();
  // }
}
