import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onSubmit});
final VoidCallback onSubmit;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff08244F),
        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child:  Text(
        'check',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: "inter",
        ),
      ),
    );
  }
}
