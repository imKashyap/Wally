import 'package:flutter/material.dart';
import 'package:wally/components/error_widget.dart';
import 'package:wally/components/loading_widget.dart';
import 'package:wally/utils/enum/api_request_status.dart';

class FeedBuilder extends StatelessWidget {
  final APIRequestStatus apiRequestStatus;
  final Widget child;
  final Function reload;

  FeedBuilder(
      {Key key,
      @required this.apiRequestStatus,
      @required this.child,
      @required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return LoadingWidget();
        break;
      case APIRequestStatus.unInitialized:
        return LoadingWidget();
        break;
      case APIRequestStatus.connectionError:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: true,
        );
        break;
      case APIRequestStatus.error:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: false,
        );
        break;
      case APIRequestStatus.loaded:
        return child;
        break;
      default:
        return LoadingWidget();
    }
  }
}
