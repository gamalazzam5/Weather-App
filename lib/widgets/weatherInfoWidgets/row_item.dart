import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowItem extends StatelessWidget {
  const RowItem({super.key, required this.imageUrl, required this.prograss});
final String imageUrl;
final String prograss;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          height: 24.h,
          width: 24.w,
        ),
        SizedBox(width: 6.w),
        Text(
          "$prograss",
          style: TextStyle(
            fontSize: 17.sp,
            color: Colors.white,
            fontFamily: "inter",
          ),
        ),
      ],
    );
  }
}
