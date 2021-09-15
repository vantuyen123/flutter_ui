import 'package:flutter_ui_16/models/Collocation.dart';

class User {
  final String? name;
  final String? profilePicture;
  final String? username;
  final int? followers;
  final int? following;
  final List<Collocation>? collocations;

  User({
    this.name,
    this.profilePicture,
    this.username,
    this.followers,
    this.following,
    this.collocations,
  });
}
