import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wally/models/curated_feed.dart';
import 'package:wally/utils/api.dart';
import 'package:wally/utils/enum/api_request_status.dart';
import 'package:wally/utils/functions.dart';

class HomeProvider with ChangeNotifier {
  CuratedFeed feed = CuratedFeed();
  APIRequestStatus apiRequestStatus = APIRequestStatus.loading;
  Api api = Api();

  getFeeds() async {
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      CuratedFeed curated = await api.getCurated(Api.curated);
      setTop(curated);
      setApiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      checkError(e);
    }
  }

  void checkError(e) {
    if (Functions.checkConnectionError(e)) {
      setApiRequestStatus(APIRequestStatus.connectionError);
    } else {
      setApiRequestStatus(APIRequestStatus.error);
    }
  }

  void setApiRequestStatus(APIRequestStatus value) {
    apiRequestStatus = value;
    notifyListeners();
  }

  void setTop(value) {
    feed = value;
    notifyListeners();
  }
}
