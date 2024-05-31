import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/screen_config.dart';
import 'package:mvp/size_extension.dart';

class TaskDetail3Screen extends StatefulWidget {
  const TaskDetail3Screen({super.key});

  @override
  State<TaskDetail3Screen> createState() => _TaskDetail3ScreenState();
}

class _TaskDetail3ScreenState extends State<TaskDetail3Screen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(
                  MediaQuery.of(context).size.width > 700 ? 3.r : 12.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.w,
                  )),
              child: Center(
                  child: SvgPicture.asset(
                "assets/back.svg",
                height: 13.h,
              )),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      ScreenUtil.getInstance().init(context);

                      return Container(
                        padding: EdgeInsets.all(20.r),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              topRight: Radius.circular(
                                8.r,
                              )),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
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
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/edit.svg",
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    "Edit task",
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xff262626),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/copy.svg",
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    "Duplicate task",
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xff262626),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/delete.svg",
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    "Delete task",
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xffFF0000),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                margin: EdgeInsets.all(12.r),
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffD7D7D7),
                    )),
                child: Center(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            20.r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project Name",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff646464),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Mvp Task manager",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff262626),
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 0.5,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Task details",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff646464),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Design Task management App",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff262626),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 0.5,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Description",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff646464),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Design Task management App  Design Task management App  Design Task management App  Design Task management App  Design Task",
                maxLines: 3,
                style: GoogleFonts.montserrat(
                  color: const Color(0xff000000),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 0.5,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Start date",
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff646464),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "4Apr2024",
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff262626),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Start time",
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff646464),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "04:45PM",
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff262626),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 0.5,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
