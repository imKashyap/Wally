import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wally/models/photo.dart';
import 'package:wally/views/wallpaper/image_view.dart';

Widget wallPaper(List<Photo> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((Photo photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgPath: photoModel.src.large,
                          )));
            },
            child: Hero(
              tag: photoModel.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel.src.portrait,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
  );
}
