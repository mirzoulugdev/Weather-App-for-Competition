import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/routes/app_router_names.dart';
import 'package:hackaton/utils/app_colors.dart';
import 'package:hackaton/utils/app_icons.dart';
import 'package:hackaton/viewModel/providers/weather_provider.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<WeatherProvider>(context, listen: true).forecastWeather;
    log("Forecast Screen Data: ${data.toString()}");

    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            );
          }

          return Container(
            width: double.infinity.w,
            height: double.infinity.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.backgroundColor1,
                  AppColors.backgroundColor2,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 25,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go(AppRouterNames.home),
                        icon: SvgPicture.asset(
                          AppIcons.arrowBack,
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                      SizedBox(width: 50.w),
                      Text(
                        "Next 7 Days",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    width: 300.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.backgroundColor1.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 15,
                          color: AppColors.lightGreyColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tomorrow",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 100.w),
                              Text(
                                "${provider.forecastWeather?.forecast.forecastday[1].day.maxtempC.ceil()}°",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Image.network(
                                  "https:${provider.forecastWeather?.forecast.forecastday[1].day.condition.icon}")
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: AppColors.whiteColor
                                            .withOpacity(0.7),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.umbrellaIcon,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "${provider.forecastWeather?.forecast.forecastday[1].day.dailyWillItRain} cm",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: AppColors.whiteColor
                                            .withOpacity(0.7),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.windIcon,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "${provider.forecastWeather?.forecast.forecastday[1].day.maxwindMph.ceil()} km/h",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: AppColors.whiteColor
                                            .withOpacity(0.7),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.humidityIcon,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "${provider.forecastWeather?.forecast.forecastday[1].day.avghumidity}%",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 450.h,
                    width: 300.w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          provider.forecastWeather?.forecast.forecastday.length,
                      itemBuilder: (context, index) {
                        final perDayData = provider
                            .forecastWeather?.forecast.forecastday[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          width: 300.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Color.fromRGBO(255, 255, 255, 0.36),
                          ),
                          child: ListTile(
                            leading: Text(
                              DateFormat("EEEE").format(perDayData!.date),
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.blackColor,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${perDayData?.day.avgtempC.ceil()}°",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.blackColor,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Image.network(
                                    "https:${perDayData.day.condition.icon}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
