import 'package:flutter_ui_16/models/Collocation.dart';
import 'package:flutter_ui_16/models/post.dart';
import 'package:flutter_ui_16/models/user.dart';

class Sample {
  static List<Collocation>? collocation1 = [
    Collocation(
        name: "Photography",
        tags: ["HD Photos", "Weather", "Photography"],
        thumbnail: "assets/photos/person.jpg",
        post: [
          Post(location: "Ha Noi, Viet Nam", dateAgo: "5 min ago", photos: [
            'assets/photos/splash.jpg',
            'assets/photos/splash-1.jpg',
            'assets/photos/tech.jpg'
          ]),
          Post(location: "Hung Yen, Viet Nam", dateAgo: "2 week ago", photos: [
            'assets/photos/tech-1.jpg',
            'assets/photos/watch.jpg',
          ]),
        ]),
    Collocation(
        name: "Photography",
        tags: ["HD Photos", "Weather", "Photography"],
        thumbnail: "assets/photos/person.jpg",
        post: [
          Post(location: "Ha Noi, Viet Nam", dateAgo: "5 min ago", photos: [
            'assets/photos/splash.jpg',
            'assets/photos/splash-1.jpg',
            'assets/photos/tech.jpg'
          ]),
          Post(location: "Hung Yen, Viet Nam", dateAgo: "2 week ago", photos: [
            'assets/photos/tech-1.jpg',
            'assets/photos/watch.jpg',
          ]),
        ]),
  ];

  static User vanTuyen = new User(
      name: "Văn Tuyền",
      profilePicture: "assets/users/asura.jpg",
      username: "@vantuyen199883",
      followers: 400,
      following: 190,
      collocations: collocation1);
  static User rozo = new User(
      name: "Rozo",
      profilePicture: "assets/users/one_piece.jpg",
      username: "@Rozo",
      followers: 400,
      following: 190,
      collocations: collocation1);

  static Post postOne = new Post(
      user: vanTuyen,
      location: "Ha Noi, Viet Nam",
      dateAgo: '3 min ago',
      photos: [
        'assets/photos/splash.jpg',
        'assets/photos/splash-1.jpg',
        'assets/photos/tech.jpg'
      ],
      relatedPhotos: [
        'assets/photos/tech-1.jpg',
        'assets/photos/watch.jpg',
        'assets/photos/splash.jpg',
        'assets/photos/tech.jpg'

      ]);
  static Post postTwo = new Post(
      user: rozo,
      location: "Ha Noi, Viet Nam",
      dateAgo: '5 min ago',
      photos: [
        'assets/photos/splash.jpg',
        'assets/photos/splash-1.jpg',
        'assets/photos/tech.jpg'
      ],
      relatedPhotos: [
        'assets/photos/tech-1.jpg',
        'assets/photos/watch.jpg',
      ]);
}
