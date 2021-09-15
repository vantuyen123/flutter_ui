import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_16/helper/color_sys.dart';
import 'package:flutter_ui_16/pages/single_post.dart';
import 'package:flutter_ui_16/pages/single_user.dart';

import 'data/sample.dart';
import 'models/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorSys.lightGrey,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorSys.darkGray,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildSearchBox(),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "For you",
                    style: TextStyle(
                        color: ColorSys.darkGray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: ColorSys.lightGrey),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Recommend",
                              style: TextStyle(
                                  color: ColorSys.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorSys.orange,
                                    width: 3,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Likes",
                          style: TextStyle(
                              color: ColorSys.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildMakePost(context, Sample.postOne),
                  _buildMakePost(context, Sample.postTwo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Best place to \nFind awesome photos",
            style: TextStyle(
                fontSize: 22,
                color: ColorSys.darkGray,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search for photo",
                        hintStyle:
                            TextStyle(color: ColorSys.grey, fontSize: 20),
                        border: InputBorder.none),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minWidth: 50,
                  elevation: 0,
                  color: ColorSys.orange,
                  height: double.infinity,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMakePost(BuildContext context, Post? post) => Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SingleUser(
                              user: post!.user,
                            )));
              },
              child: Hero(
                transitionOnUserGestures: true,
                tag: post!.user!.username.toString(),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 20,
                      backgroundImage:
                          AssetImage(post.user!.profilePicture.toString()),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.user!.name.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                post.location.toString(),
                                style: TextStyle(
                                    fontSize: 13, color: ColorSys.grey),
                              ),
                              Text(
                                post.dateAgo.toString(),
                                style: TextStyle(
                                    fontSize: 13, color: ColorSys.grey),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.photos!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SinglePost(
                            image: post.photos![index],
                            post: post,
                          ),
                        ),
                      );
                    },
                    child: AspectRatio(
                      aspectRatio: 1.2 / 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(post.photos![index].toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSys.orange),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Colors.grey[600]!
                                                  .withOpacity(0.1)),
                                          child: Center(
                                            child: Image.asset(
                                                'assets/icons/link.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Colors.grey[600]!
                                                  .withOpacity(0.1)),
                                          child: Center(
                                            child: Image.asset(
                                                'assets/icons/heart.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
}
