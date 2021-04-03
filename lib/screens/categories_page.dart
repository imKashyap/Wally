import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  List<String> _categories = [
    'Abstract',
    'Animals',
    'Beach',
    'Bikes',
    'Brands',
    'Buildings',
    'Cars',
    'Celebrity',
    'Games',
    'Landscapes',
    'Love',
    'Miscellaneous',
    'Movies',
    'Music',
    'Nature',
    'Planes',
    'Seasons',
    'Sports',
    'Texture',
    'Water'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111820),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context, int index) =>
              _buildCategoriesContainer(_categories[index], context),
          itemCount: _categories.length,
          separatorBuilder: (context, int index) => SizedBox(
            height: 15.0,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesContainer(String title, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35.0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
