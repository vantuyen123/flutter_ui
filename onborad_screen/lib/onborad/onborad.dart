import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onborad_screen/onborad/onboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import '../home.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      appBar: AppBar(
        backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnBoardInfo();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: currentIndex % 2 == 0 ? kblack : kwhite),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var item = screens[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(item.img),
                Container(
                  height: 10.h,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: currentIndex == index ? 25.0.w : 8.w,
                            height: currentIndex == index ? 25.0.w : 8.w,
                            decoration: BoxDecoration(
                                color:
                                    currentIndex == index ? kbrown : kbrown300,
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  item.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.bold,
                    color: index % 2 == 0 ? kblack : kwhite,
                  ),
                ),
                Text(
                  item.desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: index % 2 == 0 ? kblack : kwhite,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (index == screens.length - 1) {
                      await _storeOnBoardInfo();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                    _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.bounceIn);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
                    decoration: BoxDecoration(
                        color: index % 2 == 0 ? kblue : kwhite,
                        borderRadius: BorderRadius.circular(15.0.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 16,
                            color: index % 2 == 0 ? kwhite : kblue,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: index % 2 == 0 ? kwhite : kblue,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
