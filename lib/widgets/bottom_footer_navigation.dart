import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp/screen_config.dart';
import 'package:mvp/screens/accountscree.dart';
import 'package:mvp/screens/homescreen.dart';
import 'package:mvp/screens/projectsscree.dart';
import 'package:mvp/screens/timelinescreen.dart';
import 'package:mvp/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomNavPage {
  final String label;
  final Widget widget;
  final Color color;
  final String activeIcon;
  final String inactiveIcon;

  BottomNavPage(
    this.label,
    this.widget,
    this.color,
    this.activeIcon,
    this.inactiveIcon,
  );
}

class BottomFooterNavigation extends StatefulWidget {
  const BottomFooterNavigation({
    super.key,
    this.selectedIndex = 0,
  });
  final int selectedIndex;

  @override
  // ignore: library_private_types_in_public_api
  _BottomFooterNavigationState createState() => _BottomFooterNavigationState();
}

class _BottomFooterNavigationState extends State<BottomFooterNavigation>
    with WidgetsBindingObserver {
  int _selectedIndex = 0;
  DateTime currentdate = DateTime.now();
  final List _pages = [
    BottomNavPage(
      'Home',
      const HOmeScreen(),
      Colors.black, //0xffC1C1C1
      "assets/home.svg",
      "assets/home.svg",
    ),
    BottomNavPage(
      'Projects',
      const ProjectsScreen(),
      Colors.black,
      "assets/project.svg",
      "assets/project.svg",
    ),
    const SizedBox(),
    BottomNavPage(
      'Time Line',
      const TimeLineScreen(),
      Colors.black,
      "assets/calendar.svg",
      "assets/calendar.svg",
    ),
    BottomNavPage(
      'Account',
      const AccountScreen(),
      Colors.black,
      "assets/profile.svg",
      "assets/profile.svg",
    ),
  ];

  bool iscalendarvisible = false;
  String selectedday = "Today";

  int selectedhours = 0;
  int taskpoints = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    setState(
      () {
        _selectedIndex = widget.selectedIndex;
      },
    );
  }

  final scaffoldState = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    if (index == 2) {
      showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
            maxHeight: 750.h, // here increase or decrease in width
          ),
          context: context,
          useSafeArea: true,
          builder: (context) {
            return StatefulBuilder(builder: (
              context,
              setState,
            ) {
              ScreenUtil.getInstance().init(context);

              return Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                            size: 25.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "New Task",
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedday = "Yesterday";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                  color: selectedday == "Yesterday"
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: const Color(0xffF5F5F5),
                                    width: 1.w,
                                  )),
                              child: Text(
                                "Yesterday",
                                style: GoogleFonts.montserrat(
                                  color: selectedday == "Yesterday"
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedday = "Today";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                  color: selectedday == "Today"
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: const Color(0xffF5F5F5),
                                    width: 1.w,
                                  )),
                              child: Text(
                                "Today",
                                style: GoogleFonts.montserrat(
                                  color: selectedday == "Today"
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedday = "Tomorrow";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                  color: selectedday == "Tomorrow"
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: const Color(0xffF5F5F5),
                                    width: 1.w,
                                  )),
                              child: Text(
                                "Tomorrow",
                                style: GoogleFonts.montserrat(
                                  color: selectedday == "Tomorrow"
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                iscalendarvisible = !iscalendarvisible;
                              });
                            },
                            child: SvgPicture.asset(
                              "assets/calendars.svg",
                              height: 25.h,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: iscalendarvisible,
                            child: TableCalendar(
                              focusedDay: DateTime.now(),
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  currentdate = selectedDay;
                                });
                              },
                              firstDay: DateTime(1900),

                              lastDay: DateTime(3400),

                              calendarFormat: CalendarFormat.month,
                              calendarStyle: CalendarStyle(
                                defaultTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xff262626),
                                ),
                                selectedTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                                weekNumberTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xff262626),
                                ),
                                weekendTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xff262626),
                                ),
                                outsideDaysVisible: true,
                                //   renderDaysOfWeek: true,
                                markersMaxCount: 20,
                                outsideTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xffCCCCCC),
                                ),
                                todayTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                              daysOfWeekStyle: DaysOfWeekStyle(
                                weekdayStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: const Color(0xffBABABA),
                                ),
                                weekendStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: const Color(0xffBABABA),
                                ),
                              ),
                              headerStyle: HeaderStyle(
                                titleTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xff343434),
                                ),
                                leftChevronIcon: Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 20.sp,
                                  color: Colors.black,
                                ),
                                formatButtonTextStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xff343434),
                                ),
                                rightChevronIcon: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20.sp,
                                  color: Colors.black,
                                ),
                                formatButtonVisible: false,
                                titleCentered: true,
                              ),

                              calendarBuilders: CalendarBuilders(
                                selectedBuilder: (context, date, events) =>
                                    Container(
                                  margin: EdgeInsets.all(10.r),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    date.day.toString(),
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                todayBuilder: (context, date, events) =>
                                    Container(
                                  margin: EdgeInsets.all(10.r),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    date.day.toString(),
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              currentDay: currentdate,
                              //   : _controller,
                            ),
                          ),
                          Text(
                            "Project",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff999999),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 4.h,
                              horizontal: 4.w,
                            ),
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: const Color(0xff999999),
                                  width: 0.5,
                                )),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Task",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff999999),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 4.h,
                              horizontal: 4.w,
                            ),
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: const Color(0xff999999),
                                  width: 0.5,
                                )),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Task Description",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff999999),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            maxLines: 3,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 12.w),
                              fillColor: Colors.white,
                              hintText: "Add Description..",
                              hintStyle: GoogleFonts.poppins(
                                color: const Color(0xff999999),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff999999),
                                  width: 0.5,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff999999),
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff999999),
                                  width: 0.5,
                                ),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff999999),
                                  width: 0.5,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff999999),
                                  width: 0.5,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff999999),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Select hours",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff999999),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            padding: EdgeInsets.all(8.r) +
                                EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(36.r),
                                border: Border.all(
                                  color: const Color(0xff999999),
                                  width: 0.5,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (selectedhours > 0) {
                                      setState(() {
                                        selectedhours--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedhours == 0
                                          ? const Color(0xffE2E2E2)
                                          : Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                  selectedhours.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (selectedhours < 100) {
                                      setState(() {
                                        selectedhours++;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedhours == 100
                                          ? Color(0xffE2E2E2)
                                          : Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Task Points",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff999999),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            padding: EdgeInsets.all(8.r) +
                                EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(36.r),
                                border: Border.all(
                                  color: const Color(0xff999999),
                                  width: 0.5,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (taskpoints > 0) {
                                      setState(() {
                                        taskpoints--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: taskpoints == 0
                                          ? Color(0xffE2E2E2)
                                          : Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                  taskpoints.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (taskpoints < 100) {
                                      setState(() {
                                        taskpoints++;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: taskpoints == 100
                                          ? Color(0xffE2E2E2)
                                          : Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: Text(
                                  "Create",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
          });
      // showBottomSheet(
      //     context: context,
      //     builder: (context) {
      //       return
      //     });
    } else {
      setState(
        () {
          _selectedIndex = index;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return Scaffold(
      key: scaffoldState,
      resizeToAvoidBottomInset: false,
      body: _pages[_selectedIndex].widget,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(
                0.25,
              ),
              blurRadius: 10,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: ClipRRect(
          child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xffC1C1C1),
            selectedItemColor: _pages[_selectedIndex].color,
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xffC1C1C1),
            ),
            items: _pages.mapIndexed(
              (index, page) {
                if (index == 2) {
                  return BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                    label: "",
                  );
                }
                return BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _selectedIndex == index
                        ? page.activeIcon
                        : page.inactiveIcon,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                    color: _selectedIndex == index
                        ? Colors.black
                        : const Color(0xffC1C1C1),
                    height: 25.h,
                    width: 25.w,
                  ),
                  label: page.label,
                );
              },
            ).toList(),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

extension FicListExtension<T> on List<T> {
  /// The [map] function gets both the original [item] and its [index].
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}
