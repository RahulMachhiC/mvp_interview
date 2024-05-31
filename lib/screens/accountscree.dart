import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/screen_config.dart';
import 'package:mvp/screens/notification.dart';
import 'package:mvp/size_extension.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              "Kyle Calica",
              style: GoogleFonts.montserrat(
                color: const Color(0xff262626),
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "nathan@mvp-app.com",
              style: GoogleFonts.montserrat(
                color: const Color(0xff262626),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.all(20.r),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: const Color(0xffBCC4CF).withOpacity(0.25),
                    spreadRadius: -4,
                    blurRadius: 40,
                    offset: const Offset(0, 12))
              ]),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/notification.svg",
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Notifications",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff575757),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/mode.svg",
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Dark mode",
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff575757),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      AdvancedSwitch(
                        //   controller: _controller,
                        activeColor: Colors.green,
                        inactiveColor: const Color.fromARGB(255, 213, 212, 212),

                        // activeChild: Text('ON'),
                        // inactiveChild: Text('OFF'),
                        // activeImage: AssetImage('assets/images/on.png'),
                        // inactiveImage: AssetImage('assets/images/off.png'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12.r,
                          ),
                        ),
                        width: 52.w,
                        height: 22.h,
                        enabled: true,
                        disabledOpacity: 0.5,
                      ),
                      // Switch(
                      //   value: false,
                      //   onChanged: (v) {},
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            ScreenUtil.getInstance().init(context);

                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              actionsPadding: EdgeInsets.zero,
                              surfaceTintColor: Colors.white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Text(
                                        "Logout",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Are You sure you want to logout?",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Center(
                                      child: Text(
                                        "Yes",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Center(
                                      child: Text(
                                        "No",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.white,
                            );
                          });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/exit.svg",
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Logout",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff575757),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
