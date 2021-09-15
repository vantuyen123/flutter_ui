import 'package:flutter_ui_16/models/user.dart';

class Post {
  final User? user;
  final String? location;
  final String? dateAgo;
  final List<String>? photos;
  final List<String>? relatedPhotos;

  Post({
    this.location,
    this.dateAgo,
    this.photos,
    this.relatedPhotos,
    this.user,
  });
}
