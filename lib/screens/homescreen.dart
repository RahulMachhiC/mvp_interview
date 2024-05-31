import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/screen_config.dart';
import 'package:mvp/screens/taskdetail.dart';
import 'package:mvp/screens/taskdetail2.dart';
import 'package:mvp/screens/taskdetail3.dart';
import 'package:mvp/size_extension.dart';
import 'package:mvp/widgets/customtabbarindecator.dart';
import 'package:badges/badges.dart' as badges;

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning, Kyle!",
                  style: GoogleFonts.montserrat(
                      color: const Color(0xff575757),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Let’s Start your task",
                  style: GoogleFonts.montserrat(
                      color: const Color(0xff262626),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            actions: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(
                    0xffF8F8F8,
                  ),
                ),
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10.h, end: 2.w),
                  badgeContent: Text(
                    '',
                    style: GoogleFonts.montserrat(fontSize: 6.sp),
                  ),
                  child: SvgPicture.asset(
                    "assets/notification.svg",
                    height: 25.h,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              )
            ],
            bottom: TabBar(
              indicator: MyCustomIndicator(
                color: Colors.black,
                height: 1.h,
                radius: 10.r,
              ),
              labelStyle: GoogleFonts.montserrat(
                color: const Color(0xff000000),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              padding: EdgeInsets.only(top: 10.r),
              indicatorPadding: EdgeInsets.only(
                top: 10.r,
              ),
              unselectedLabelColor: const Color(0xff666666),
              unselectedLabelStyle: GoogleFonts.montserrat(
                color: const Color(0xff666666),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              tabs: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.r,
                  ),
                  child: const Text(
                    "Today",
                    // style: GoogleFonts.montserrat(
                    //   color: const Color(0xff000000),
                    //   fontSize: 14.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.r,
                  ),
                  child: const Text(
                    "History",
                    // style: GoogleFonts.montserrat(
                    //   color: const Color(0xff000000),
                    //   fontSize: 14.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: TabBarView(children: [
            ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskDetailScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 12.w),
                          spreadRadius: -4,
                          blurRadius: 40,
                          color: Color(0xffBCC4CF).withOpacity(0.25),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Text(
                            "UI ux Design",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Design Task management App",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xff262626),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "Redesign fashion app for up dribble",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xff575757),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              index.isEven
                                  ? Icons.play_circle
                                  : Icons.pause_circle,
                              color: Colors.black,
                              size: 30.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today, 10:00 am",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff575757),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "5 hours",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff575757),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index.isEven) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetail2creen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetail3Screen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 12.w),
                          spreadRadius: -4,
                          blurRadius: 40,
                          color: Color(0xffBCC4CF).withOpacity(0.25),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Text(
                            "UI ux Design",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Design Task management App",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xff262626),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "Redesign fashion app for up dribble",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xff575757),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.black,
                              size: 20.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today, 10:00 am",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff575757),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "5 hours",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff575757),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
