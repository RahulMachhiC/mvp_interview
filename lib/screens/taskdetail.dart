import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/screen_config.dart';
import 'package:mvp/size_extension.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
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
            Container(
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
              const Divider(),
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
              const Divider(),
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
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(40.r),
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "20",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Points",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 20.w),
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Approved",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "All",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(40.r),
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "10",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Hours",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
