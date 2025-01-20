import 'package:Weather/routes/app_router_names.dart';
import 'package:Weather/utils/app_colors.dart';
import 'package:Weather/utils/app_icons.dart';
import 'package:Weather/view/widgets/container_widget.dart';
import 'package:Weather/viewModel/providers/weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.isLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            );
          }
          return Container(
            width: double.infinity,
            height: double.infinity,
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
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            width: 30.w,
                            height: 30.h,
                            AppIcons.searchIcon,
                          ),
                        ),
                        SvgPicture.asset(
                          AppIcons.pointIcon,
                          width: 7.w,
                          height: 7.h,
                        ),
                        IconButton(
                          onPressed: () => context.go(AppRouterNames.forecast),
                          icon: SvgPicture.asset(
                            width: 25.w,
                            height: 25.h,
                            AppIcons.menuIcon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        "${weatherProvider.forecastWeather?.location.name}, ${weatherProvider.forecastWeather?.location.country}",
                        style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          DateFormat.yMMMd().format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SizedBox(
                          height: 150.h,
                          width: 150.w,
                          child: Image.network(
                            fit: BoxFit.cover,
                            "https:${weatherProvider.forecastWeather?.current.condition.icon}",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${weatherProvider.forecastWeather?.current.tempC.ceil()}℃",
                              style: TextStyle(
                                fontSize: 60.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Inter",
                                color: AppColors.blackColor,
                              ),
                            ),
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                "${weatherProvider.forecastWeather?.current.condition.text}",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          ContainerWidget(
                            title: "RainFall",
                            measure:
                                "${weatherProvider.forecastWeather?.current.windKph.ceil()}cm",
                            iconPath: AppIcons.umbrellaIcon,
                          ),
                          SizedBox(height: 5.h),
                          ContainerWidget(
                            title: "Wind",
                            measure:
                                "${weatherProvider.forecastWeather?.current.windMph.ceil()} km/h",
                            iconPath: AppIcons.windIcon,
                          ),
                          SizedBox(height: 5.h),
                          ContainerWidget(
                            title: "Humidity",
                            measure:
                                "${weatherProvider.forecastWeather?.current.humidity}%",
                            iconPath: AppIcons.humidityIcon,
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      indicatorColor: AppColors.blackColor,
                      indicatorWeight: 5,
                      dividerColor: AppColors.blurTextColor,
                      unselectedLabelColor: AppColors.blurTextColor,
                      labelColor: AppColors.blackColor,
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: "Today",
                        ),
                        Tab(
                          text: "Tomorrow",
                        ),
                        Tab(
                          text: "Next 7 Days",
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 120
                          .h, // Overflow oldini olish uchun balandlikni cheklash
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            width: 300.w,
                            height: 150.h,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: weatherProvider.forecastWeather!
                                  .forecast.forecastday[1].hour.length,
                              itemBuilder: (context, index) {
                                final hourlyData = weatherProvider
                                    .forecastWeather!
                                    .forecast
                                    .forecastday[0]
                                    .hour[index];
                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  width: 50.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat("HH:mm").format(
                                          DateTime.parse(hourlyData.time),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Inter",
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Image.network(
                                          "https:${hourlyData.condition.icon}"),
                                      Text(
                                        "${hourlyData.tempC.ceil()}℃",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Inter",
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 300.w,
                            height: 150.h,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: weatherProvider.forecastWeather!
                                  .forecast.forecastday[1].hour.length,
                              itemBuilder: (context, index) {
                                final hourlyData = weatherProvider
                                    .forecastWeather!
                                    .forecast
                                    .forecastday[0]
                                    .hour[index];
                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  width: 50.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat("HH:mm").format(
                                          DateTime.parse(hourlyData.time),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Inter",
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Image.network(
                                          "https:${hourlyData.condition.icon}"),
                                      Text(
                                        "${hourlyData.tempC.ceil()}℃",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Inter",
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Center(child: Text("Next 7 Days")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
