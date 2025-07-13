import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumWeather extends StatelessWidget {
  const ColumWeather({super.key, required this.temp, required this.imageUrl, required this.time});
final double temp;
final String imageUrl;
final String time;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${temp.round()}°C",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontFamily: "inter",fontWeight: FontWeight.w600),),


        Image.asset(imageUrl,height: 24.h,width: 24.w),

        Text(time,style: TextStyle(color: Colors.white,fontSize: 18.sp,fontFamily: "inter",fontWeight: FontWeight.w600),)
      ],
    );
  }
}
