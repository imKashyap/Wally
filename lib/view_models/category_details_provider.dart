import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wally/models/category.dart';
import 'package:wally/utils/api.dart';
import 'package:wally/utils/enum/api_request_status.dart';
import 'package:wally/utils/functions.dart';

class CategoryDetailsProvider with ChangeNotifier {
  CategoryDetails details = CategoryDetails();
  APIRequestStatus apiRequestStatus = APIRequestStatus.loading;
  Api api = Api();

  getCategoryDetails(String q) async {
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      CategoryDetails cat = await api.getCategoryDetails(q);
      setDetails(cat);
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

  void setDetails(value) {
    details = value;
    notifyListeners();
  }
}
