import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final int rs;
  final int gift;
  final Function() ontap;
  final Color color;
  final Color textcolor;
  final Color subtextcolor;

  const CustomContainer(
      {super.key,
      required this.rs,
      required this.gift,
      required this.ontap,
      required this.color,
      required this.textcolor,
      required this.subtextcolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 70.h,
          width: 150.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //   height: 25.h,
              //   width: 90,
              //   child: Center(child: Text('data')),
              //   decoration: BoxDecoration(
              //       color: Colors.green,
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(8),
              //           bottomRight: Radius.circular(8))),
              // ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '₹ ${rs}',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: textcolor),
              ),
              SizedBox(
                height: 0.h,
              ),
              Text(
                'Gift ₹ ${gift}',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: subtextcolor),
              )
            ],
          )),
    );
  }
}
