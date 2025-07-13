import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityInputField extends StatelessWidget {
  const CityInputField({super.key, required this.controller, required this.onSubmit});
final TextEditingController controller;
  final VoidCallback onSubmit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) => onSubmit(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.0.h,
          horizontal: 20.0.w,
        ),
        hintText: 'Enter city name',
        filled: true,
        fillColor: Colors.grey[300],
        // light grey background
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0.r),
          borderSide: BorderSide(
            color: Color(0xffD9D9D9), // blue border
            width: 2.0.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0.r),
          borderSide: BorderSide(
            color: Color(0xffD9D9D9),
            // keep blue when focused
            width: 2.5.r,
          ),
        ),
      ),
    );
  }
}
