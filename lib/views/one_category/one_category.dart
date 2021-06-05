import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wally/components/body_builder.dart';
import 'package:wally/components/wallpapers.dart';
import 'package:wally/view_models/category_details_provider.dart';

class OneCategory extends StatefulWidget {
  final String query;
  const OneCategory({Key key, this.query}) : super(key: key);

  @override
  _OneCategoryState createState() => _OneCategoryState();
}

class _OneCategoryState extends State<OneCategory>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Provider.of<CategoryDetailsProvider>(context, listen: false)
          .getCategoryDetails(widget.query),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<CategoryDetailsProvider>(builder:
        (BuildContext context, CategoryDetailsProvider provider, Widget child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: Text(
              widget.query,
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
          ),
          body: _buildBody(provider));
    });
  }

  Widget _buildBody(CategoryDetailsProvider provider) {
    return BodyBuilder(
      apiRequestStatus: provider.apiRequestStatus,
      child:WallpapersOfACategory(query: widget.query,provider: provider,),
      reload: () => provider.getCategoryDetails(widget.query),
    );
  }
}

class WallpapersOfACategory extends StatelessWidget {
  final CategoryDetailsProvider provider;
  final String query;
  const WallpapersOfACategory({
    Key key,
    this.query,
    this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => provider.getCategoryDetails(query),
        child: wallPaper(provider.details.photos, context));
  }
}
