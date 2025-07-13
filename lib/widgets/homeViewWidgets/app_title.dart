import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "W",
          style: TextStyle(
            fontSize: 96.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xffFF0000),
            fontFamily: "inter",
          ),
        ),
        SizedBox(width: 13.w),
        Column(
          children: [
            Text(
              "Weather",
              style: TextStyle(
                fontSize: 25.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "inter",
              ),
            ),
            Text(
              "App",
              style: TextStyle(
                fontSize: 30.sp,
                color: Colors.black.withOpacity(.5),
                fontFamily: "inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
