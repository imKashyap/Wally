import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wally/components/user_info_dialog.dart';
import 'package:wally/models/viewer.dart';
import 'package:wally/utils/consts.dart';
import 'package:wally/utils/router.dart';
import 'package:wally/views/one_category/one_category.dart';

class Categories extends StatelessWidget {
  final Viewer loggedInUser;
  Categories({Key key, this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
          elevation: 0,
          title: Text(
            'Categories',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: IconButton(
                onPressed: () {
                  _showUserDialog(context);
                },
                icon: Container(
                  width: 34.0,
                  height: 34.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(loggedInUser.imgUrl)),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: _buildBody());
  }

  Widget _buildCategoriesContainer(
      String title, BuildContext context, String imgUrl) {
    return InkWell(
      onTap: ()=>MyRouter.pushPage(context, OneCategory(query:title)),
      child: Container(
        width: double.maxFinite,
        height: 100.0,
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: double.maxFinite,
                  height: 150.0,
                  fit: BoxFit.cover,
                )),
            Container(
              // height: 50,
              // width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Center(
              child: Text(
                title ?? "Yo Yo",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showUserDialog(BuildContext context) async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return UserInfoDialog(loggedInUser: loggedInUser);
      },
    );
  }

  Widget _buildBody() {
    List<List<String>> categories = Constants.categories;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 15.0,
        ),
        child: ListView.separated(
          itemBuilder: (context, int index) => _buildCategoriesContainer(
              categories[index][0], context, categories[index][1]),
          itemCount: categories.length,
          separatorBuilder: (context, int index) => SizedBox(
            height: 15.0,
          ),
        ),
      ),
    );
  }
}
