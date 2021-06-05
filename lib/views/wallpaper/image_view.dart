import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class ImageView extends StatefulWidget {
  final String imgPath;

  ImageView({@required this.imgPath});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgPath,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.imgPath,
                placeholder: (context, url) => Container(
                  color: Color(0xfff5f8fd),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 25.0),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCustomButton(() async {
                  await _save();
                }, Icons.download),
                _buildCustomButton(setWallpaperDialog, Icons.wallpaper),
                _buildCustomButton(() {
                  _save();
                  //Navigator.pop(context);
                }, Icons.favorite_outline),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _localfile;
  _save() async {
    if (await _askPermission() != null) {
      print('hello');
      Dio dio = Dio();
      final String appDir= (await getApplicationDocumentsDirectory()).path+'/Pictures';
      final Directory dirToSave=await Directory(appDir + '/Wally')
                      .create(recursive: true);
      final String localfile = '$dirToSave/myimage.jpeg';
      try {
        await dio.download(widget.imgPath, localfile,
            options: Options(responseType: ResponseType.bytes));
        setState(() {
          _localfile = localfile;
        });
        print(localfile);
      } on PlatformException catch (e) {
        print(e);
      }
    }
  }

  static Future<bool> _askPermission() async {
    final PermissionStatus permission = await Permission.storage.status;
    PermissionStatus request;
    if (permission != PermissionStatus.granted)
      request = await Permission.storage.request();
    if (request != PermissionStatus.granted) {
      return null;
    }
    return true;
  }

  _buildCustomButton(Function onPressed, IconData icon) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff1C1B1B).withOpacity(0.8),
            ),
          ),
          Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1),
                  gradient: LinearGradient(
                      colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight)),
              child: Icon(
                icon,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  void setWallpaperDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Set a wallpaper',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home Screen',
                ),
                leading: Icon(
                  Icons.home,
                ),
                onTap: () => _setWallpaper(1),
              ),
              ListTile(
                title: Text(
                  'Lock Screen',
                ),
                leading: Icon(
                  Icons.lock,
                ),
                onTap: () => _setWallpaper(2),
              ),
              ListTile(
                title: Text(
                  'Both',
                ),
                leading: Icon(
                  Icons.phone_android,
                ),
                onTap: () => _setWallpaper(3),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _setWallpaper(int wallpaperType) async {
    setState(() {});
    String result;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);
    try {
      result =
          await WallpaperManager.setWallpaperFromFile(file.path, wallpaperType);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
    if (!mounted) return;
    setState(() {});
    Fluttertoast.showToast(
        msg: "Wallpaper set successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // backgroundColor: Colors.white,
        // textColor: Colors.black,
        fontSize: 16.0);
    Navigator.pop(context);
  }
}
