import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_16/models/post.dart';

class SinglePost extends StatelessWidget {
  final Post? post;
  final String image;

  const SinglePost({
    Key? key,
    this.post,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 70, bottom: 20, right: 20, left: 20),
              height: height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black.withOpacity(0.2)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: AssetImage(
                                post!.user!.profilePicture.toString()),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${post!.user!.name}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            width: 32,
                            height: 32,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey[600]!.withOpacity(0.1)),
                            child: Center(
                              child: Image.asset('assets/icons/download.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/location.png',
                        scale: 2.2,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Ha Noi, Viet Nam",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildRatePhotos(post!)
          ],
        ),
      ),
    );
  }

  Widget _buildRatePhotos(Post post) {
    return StaggeredGridView.countBuilder(
      itemCount: post.relatedPhotos!.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(post.relatedPhotos![index]),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 2),
    );
  }
}
