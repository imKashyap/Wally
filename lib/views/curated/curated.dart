import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:wally/components/search_results.dart';
import 'package:wally/models/viewer.dart';
import 'package:wally/view_models/home_provider.dart';

class Curated extends StatefulWidget {
  final Viewer loggedInUser;
  const Curated({Key key, this.loggedInUser}) : super(key: key);
  @override
  _CuratedState createState() => _CuratedState();
}

class _CuratedState extends State<Curated> with AutomaticKeepAliveClientMixin {
  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Provider.of<HomeProvider>(context, listen: false).getFeeds(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        return Scaffold(
          body: FloatingSearchBar(
            controller: controller,
            body: FloatingSearchBarScrollNotifier(
              child: SearchResultsListView(
                searchTerm: selectedTerm,
              ),
            ),
            transition: CircularFloatingSearchBarTransition(),
            physics: BouncingScrollPhysics(),
            title: Text(
              selectedTerm ?? 'Search in Wally',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            hint: 'Search over million walls...',
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: Container(
                  width: 37.0,
                  height: 37.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(widget.loggedInUser.imgUrl)),
                  ),
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            onQueryChanged: (query) {
              setState(() {
                filteredSearchHistory = filterSearchTerms(filter: query);
              });
            },
            onSubmitted: (query) {
              setState(() {
                addSearchTerm(query);
                selectedTerm = query;
              });
              controller.close();
            },
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4,
                  child: Builder(
                    builder: (context) {
                      if (filteredSearchHistory.isEmpty &&
                          controller.query.isEmpty) {
                        return Container(
                          height: 56,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            'Start searching',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      } else if (filteredSearchHistory.isEmpty) {
                        return ListTile(
                          title: Text(controller.query),
                          leading: const Icon(Icons.search),
                          onTap: () {
                            setState(() {
                              addSearchTerm(controller.query);
                              selectedTerm = controller.query;
                            });
                            controller.close();
                          },
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: filteredSearchHistory
                              .map(
                                (term) => ListTile(
                                  title: Text(
                                    term,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  leading: const Icon(Icons.history),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      setState(() {
                                        deleteSearchTerm(term);
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    setState(() {
                                      putSearchTermFirst(term);
                                      selectedTerm = term;
                                    });
                                    controller.close();
                                  },
                                ),
                              )
                              .toList(),
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }
}
