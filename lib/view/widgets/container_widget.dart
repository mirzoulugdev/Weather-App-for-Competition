import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton/utils/app_colors.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  final String measure;
  final String iconPath;
  const ContainerWidget({
    super.key,
    required this.title,
    required this.measure,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xFFFCD3B2),
      ),
      child: ListTile(
        leading: Container(
          alignment: Alignment.center,
          width: 40.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.whiteColor,
          ),
          child: SvgPicture.asset(
            iconPath,
            width: 50.w,
            height: 50.h,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
        ),
        trailing: Text(
          measure,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
        ),
      ),
    );
  }
}
