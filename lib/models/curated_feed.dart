import 'package:wally/models/photo.dart';

class CuratedFeed {
  int page;
  int perPage;
  List<Photo> photos;
  int totalResults;
  String nextPage;

  CuratedFeed(
      {this.page, this.perPage, this.photos, this.totalResults, this.nextPage});

  CuratedFeed.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    if (json['photos'] != null) {
      photos =[];
      json['photos'].forEach((v) {
        photos.add(new Photo.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['total_results'] = this.totalResults;
    data['next_page'] = this.nextPage;
    return data;
  }
}
