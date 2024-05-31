import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/screen_config.dart';
import 'package:mvp/screens/timelinescreen.dart';
import 'package:mvp/size_extension.dart';
import 'package:overlapping_avatar/overlapping_avatar.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "Projects",
            style: GoogleFonts.montserrat(
              color: const Color(0xff262626),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: InkWell(
            onTap: () {
              // Navigator.pop(context);
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
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              TextFormField(
                style: GoogleFonts.montserrat(
                  color: const Color(0xff575757),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 15.h,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(minHeight: 18.h, minWidth: 18.w),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: SvgPicture.asset(
                      "assets/search.svg",
                      height: 18.h,
                      width: 18.w,
                    ),
                  ),
                  hintText: "Search your task",
                  hintStyle: GoogleFonts.montserrat(
                    color: const Color(0xff575757),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  fillColor: const Color(0xffF8F8F8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          spreadRadius: 0,
                          blurRadius: 15,
                          color: const Color(0xff8E8E8E).withOpacity(0.08),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.r,
                              backgroundImage: const AssetImage(
                                "assets/ai.jpeg",
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Araby ai",
                              style: GoogleFonts.poppins(
                                color: const Color(0xff262626),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
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
                                  size: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Task planner App with clean and modern... ",
                          style: GoogleFonts.poppins(
                            color: const Color(0xff9F9F9F),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        OverLappingNetworkAvatarBuilder(
                          totalMembersHintTextSize: 12.sp,
                          totalMembersHintTextColor: Colors.black,
                          circularAvatarColor: const Color(0xffE8E8E8),
                          listOfNetworkImages: const [
                            "https://randomuser.me/api/portraits/men/21.jpg",
                            "https://randomuser.me/api/portraits/women/61.jpg",
                            "https://randomuser.me/api/portraits/men/12.jpg",
                            "https://randomuser.me/api/portraits/women/78.jpg",
                            "https://randomuser.me/api/portraits/men/45.jpg",
                          ],
                          limitAvatars: 4,
                          distanceInEachAvatar: 25.w,
                          circularAvatarSize: 18.r,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: const Color(0xffD3D3D3),
                                    width: 1.w,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: const Color(0xffFF0000),
                                    size: 8.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "High priority",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Paused",
                              style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff03A600)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Progress",
                              style: GoogleFonts.poppins(
                                color: Color(0xff787878),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "64%",
                              style: GoogleFonts.poppins(
                                color: Color(0xff787878),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 5.h,
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 200.w,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                  8.r,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEA),
                              borderRadius: BorderRadius.circular(
                                8.r,
                              )),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
