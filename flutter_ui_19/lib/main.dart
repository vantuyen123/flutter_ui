import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_19/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users you can follow",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: ListView.builder(
            itemCount: listUsers.length,
            itemBuilder: (context, index) {
              var item = listUsers[index];
              return UserComponent(
                  name: item.name,
                  username: item.username,
                  image: item.image,
                  isFollowed: item.isFollowedByMe,
                  user: item);
            }),
      ),
    );
  }

  Widget UserComponent(
          {name, username, image, isFollowed, required User user}) =>
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: 60.w,
                  height: 60.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      username,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffeeeeee)),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    user.isFollowedByMe = !user.isFollowedByMe;
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          side: BorderSide(color: Color(0xffeeeeee)))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isFollowed ? Color(0xffeeeeee) : Color(0xfffffff),
                  ),
                  elevation: MaterialStateProperty.all<double>(0)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Text(
                    isFollowed ? 'Unfollow' : 'Follow',
                    style: TextStyle(color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
