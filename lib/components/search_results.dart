import 'package:flutter/material.dart';
import 'package:wally/components/wallpapers.dart';
import 'package:wally/view_models/home_provider.dart';

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;
  final HomeProvider homeProvider;
  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
    this.homeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => homeProvider.getFeeds(),
        child: (searchTerm == null)
            ? wallPaper(homeProvider.feed.photos, context)
            : ListView(
                padding: EdgeInsets.only(top: 56.0),
                children: List.generate(
                  50,
                  (index) => ListTile(
                    title: Text('$searchTerm search result'),
                    subtitle: Text(index.toString()),
                  ),
                ),
              ),
      ),
    );
  }
}
