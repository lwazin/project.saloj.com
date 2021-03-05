import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_salo/misc/classes.dart';
import 'package:web_salo/misc/services/Provider.dart';
import 'package:web_salo/misc/widgets/StudentCard.dart';

class WrapperPage extends StatefulWidget {
  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  bool menuOpen = true;
  bool detailOpen = false;
  String menuItem = "lecturer";
  bool readyDelete = false;

  void startTimer() {
    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        readyDelete = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fs.FirebaseFirestore firestore = fs.FirebaseFirestore.instance;
    var settings = Provider.of<Settings>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: (menuOpen) ? 300 : 100,
                              ),
                              height: 300,
                              width: 450,
                              // color: Colors.black54,
                              child: (menuItem == "student+")
                                  ? AddStudent(firestore)
                                  : StreamBuilder(
                                      stream: (menuItem == "degree")
                                          ? firestore
                                              .collection("degrees")
                                              .snapshots()
                                          : (menuItem == "student")
                                              ? firestore
                                                  .collection("students")
                                                  .snapshots()
                                              : firestore
                                                  .collection("lecturers")
                                                  .snapshots(),
                                      builder: (context, snapshot) {
                                        dynamic snappy = snapshot.data;
                                        return ListView.builder(
                                          itemCount: snappy.docs.length,
                                          itemBuilder: (context, index) {
                                            if (menuItem == "student") {
                                              return StudentCard(
                                                snappy: snappy,
                                                index: index,
                                              );
                                            } else if (menuItem == "degree") {
                                              return DegreeCard(
                                                snappy: snappy,
                                                index: index,
                                              );
                                            } else if (menuItem == "lecturer") {
                                              return LecturerCard(
                                                snappy: snappy,
                                                index: index,
                                              );
                                            } else {
                                              return Container();
                                            }
                                          },
                                        );
                                      },
                                    ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: (menuOpen) ? 100 : 200,
                              ),
                              height: 300,
                              width: (menuOpen) ? 130 : 56,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.all(8.0),
                                            //   child: MouseRegion(
                                            //     cursor:
                                            //         SystemMouseCursors.click,
                                            //     child: GestureDetector(
                                            //       onTap: () {
                                            //         setState(() {
                                            //           menuItem = "course";
                                            //         });
                                            //         settings.newIndex(-2);
                                            //       },
                                            //       child: Row(
                                            //         children: [
                                            //           Icon(
                                            //             Icons.bookmark,
                                            //             color: (menuItem ==
                                            //                     "course")
                                            //                 ? Colors.deepOrange
                                            //                 : Colors.white,
                                            //           ),
                                            //           AnimatedContainer(
                                            //             duration: Duration(
                                            //                 milliseconds:
                                            //                     (menuOpen)
                                            //                         ? 300
                                            //                         : 100),
                                            //             width:
                                            //                 (menuOpen) ? 12 : 0,
                                            //           ),
                                            //           AnimatedContainer(
                                            //             duration: Duration(
                                            //                 milliseconds:
                                            //                     (menuOpen)
                                            //                         ? 200
                                            //                         : 0),
                                            //             width:
                                            //                 (menuOpen) ? 60 : 0,
                                            //             height:
                                            //                 (menuOpen) ? 15 : 0,
                                            //             child: Text(
                                            //               "Course",
                                            //               style: GoogleFonts.montserrat(
                                            //                   color: (menuItem ==
                                            //                           "course")
                                            //                       ? Colors
                                            //                           .deepOrange
                                            //                       : Colors
                                            //                           .white,
                                            //                   fontSize:
                                            //                       (menuOpen)
                                            //                           ? 13
                                            //                           : 0,
                                            //                   fontWeight:
                                            //                       FontWeight
                                            //                           .w500),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      menuItem = "degree";
                                                    });
                                                    settings.newIndex(-2);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .thermostat_outlined,
                                                        color: (menuItem ==
                                                                "degree")
                                                            ? Colors.deepOrange
                                                            : Colors.white,
                                                      ),
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds:
                                                                (menuOpen)
                                                                    ? 100
                                                                    : 100),
                                                        width:
                                                            (menuOpen) ? 12 : 0,
                                                      ),
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds:
                                                                (menuOpen)
                                                                    ? 200
                                                                    : 0),
                                                        width:
                                                            (menuOpen) ? 60 : 0,
                                                        height:
                                                            (menuOpen) ? 15 : 0,
                                                        child: Text(
                                                          "Degree",
                                                          style: GoogleFonts.montserrat(
                                                              color: (menuItem ==
                                                                      "degree")
                                                                  ? Colors
                                                                      .deepOrange
                                                                  : Colors
                                                                      .white,
                                                              fontSize:
                                                                  (menuOpen)
                                                                      ? 13
                                                                      : 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      menuItem = "student";
                                                    });
                                                    settings.newIndex(-2);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.school,
                                                        color: (menuItem ==
                                                                "student")
                                                            ? Colors.deepOrange
                                                            : Colors.white,
                                                      ),
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds:
                                                                (menuOpen)
                                                                    ? 400
                                                                    : 100),
                                                        width:
                                                            (menuOpen) ? 12 : 0,
                                                      ),
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds:
                                                                (menuOpen)
                                                                    ? 200
                                                                    : 0),
                                                        width:
                                                            (menuOpen) ? 60 : 0,
                                                        height:
                                                            (menuOpen) ? 15 : 0,
                                                        child: Text(
                                                          "Student",
                                                          style: GoogleFonts.montserrat(
                                                              color: (menuItem ==
                                                                      "student")
                                                                  ? Colors
                                                                      .deepOrange
                                                                  : Colors
                                                                      .white,
                                                              fontSize:
                                                                  (menuOpen)
                                                                      ? 13
                                                                      : 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      menuItem = "lecturer";
                                                    });
                                                    settings.newIndex(-2);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.person,
                                                        color: (menuItem ==
                                                                "lecturer")
                                                            ? Colors.deepOrange
                                                            : Colors.white,
                                                      ),
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds:
                                                                (menuOpen)
                                                                    ? 200
                                                                    : 100),
                                                        width:
                                                            (menuOpen) ? 12 : 0,
                                                      ),
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds:
                                                                (menuOpen)
                                                                    ? 200
                                                                    : 0),
                                                        width:
                                                            (menuOpen) ? 60 : 0,
                                                        height:
                                                            (menuOpen) ? 15 : 0,
                                                        child: Text(
                                                          "Lecturer",
                                                          style: GoogleFonts.montserrat(
                                                              color: (menuItem ==
                                                                      "lecturer")
                                                                  ? Colors
                                                                      .deepOrange
                                                                  : Colors
                                                                      .white,
                                                              fontSize:
                                                                  (menuOpen)
                                                                      ? 13
                                                                      : 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(
                                          milliseconds: (menuOpen) ? 100 : 200,
                                        ),
                                        width: (menuOpen) ? 130 : 56,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        menuItem = "student+";
                                                        menuOpen = true;
                                                      });

                                                      settings.newIndex(-2);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.add_box_rounded,
                                                          color: Colors.lime,
                                                          size: 17,
                                                        ),
                                                        AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  (menuOpen)
                                                                      ? 400
                                                                      : 100),
                                                          width: (menuOpen)
                                                              ? 12
                                                              : 0,
                                                        ),
                                                        AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  (menuOpen)
                                                                      ? 200
                                                                      : 0),
                                                          width: (menuOpen)
                                                              ? 60
                                                              : 0,
                                                          height: (menuOpen)
                                                              ? 15
                                                              : 0,
                                                          child: Text(
                                                            "Student+",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors
                                                                        .lime,
                                                                    fontSize:
                                                                        (menuOpen)
                                                                            ? 12
                                                                            : 0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    (menuItem == "student+")
                                                        ? 8.0
                                                        : 0.0),
                                                child: MouseRegion(
                                                  cursor: (settings.month > 0 &&
                                                          settings.month < 13 &&
                                                          settings.day > 0 &&
                                                          settings.month < 31 &&
                                                          settings.year >
                                                              1900 &&
                                                          settings.degree
                                                              .isNotEmpty &&
                                                          settings.email
                                                              .contains("@") &&
                                                          settings.email
                                                              .contains(".") &&
                                                          settings.last
                                                              .isNotEmpty &&
                                                          settings
                                                              .first.isNotEmpty)
                                                      ? SystemMouseCursors.click
                                                      : SystemMouseCursors
                                                          .basic,
                                                  child: GestureDetector(
                                                    onTap: (settings.month >
                                                                0 &&
                                                            settings.month <
                                                                13 &&
                                                            settings.day > 0 &&
                                                            settings.month <
                                                                31 &&
                                                            settings.year >
                                                                1900 &&
                                                            settings.degree
                                                                .isNotEmpty &&
                                                            settings.email
                                                                .contains(
                                                                    "@") &&
                                                            settings.email
                                                                .contains(
                                                                    ".") &&
                                                            settings.last
                                                                .isNotEmpty &&
                                                            settings.first
                                                                .isNotEmpty)
                                                        ? () {
                                                            firestore
                                                                .collection(
                                                                    "students")
                                                                .doc()
                                                                .set({
                                                              "dob": DateTime(
                                                                  settings.year,
                                                                  settings
                                                                      .month,
                                                                  settings.day),
                                                              "email": settings
                                                                  .email,
                                                              "forenames": [
                                                                settings.first
                                                              ],
                                                              "lastname":
                                                                  settings.last,
                                                              "degree": settings
                                                                  .degree,
                                                            });

                                                            settings
                                                                .clearStudent();
                                                            setState(() {
                                                              menuOpen = false;
                                                            });

                                                            setState(() {
                                                              menuItem =
                                                                  "student";
                                                            });
                                                          }
                                                        : () {},
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      child: AnimatedOpacity(
                                                        opacity: (settings.month >
                                                                    0 &&
                                                                settings.month <
                                                                    13 &&
                                                                settings.day >
                                                                    0 &&
                                                                settings.month <
                                                                    31 &&
                                                                settings.year >
                                                                    1900 &&
                                                                settings.degree
                                                                    .isNotEmpty &&
                                                                settings.email
                                                                    .contains(
                                                                        "@") &&
                                                                settings.email
                                                                    .contains(
                                                                        ".") &&
                                                                settings.last
                                                                    .isNotEmpty &&
                                                                settings.first
                                                                    .isNotEmpty)
                                                            ? 1.0
                                                            : 0.4,
                                                        duration: Duration(
                                                            milliseconds: 400),
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  400),
                                                          height: (menuItem ==
                                                                  "student+")
                                                              ? 30
                                                              : 0,
                                                          width: 90,
                                                          color: (settings.month > 0 &&
                                                                  settings.month <
                                                                      13 &&
                                                                  settings.day >
                                                                      0 &&
                                                                  settings.month <
                                                                      31 &&
                                                                  settings.year >
                                                                      1900 &&
                                                                  settings
                                                                      .degree
                                                                      .isNotEmpty &&
                                                                  settings.email
                                                                      .contains(
                                                                          "@") &&
                                                                  settings.email
                                                                      .contains(
                                                                          ".") &&
                                                                  settings.last
                                                                      .isNotEmpty &&
                                                                  settings.first
                                                                      .isNotEmpty)
                                                              ? Colors.lime
                                                              : Colors
                                                                  .lime[200],
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.check,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            menuOpen =
                                                                !menuOpen;
                                                          });
                                                          if (menuItem ==
                                                              "student+") {
                                                            setState(() {
                                                              menuItem =
                                                                  "lecturer";
                                                            });
                                                            settings
                                                                .clearStudent();
                                                          }
                                                        },
                                                        child: Icon(
                                                          (menuOpen)
                                                              ? Icons.lock_open
                                                              : Icons
                                                                  .lock_outline_rounded,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                  ),
                  child: Container(
                    height: 300,
                    width: 500,
                    color: Colors.black,
                    child: Stack(
                      children: [
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: (settings.index > -2) ? 0.2 : 1.0,
                          child: Image.network(
                            (menuItem == "student")
                                ? "https://images.pexels.com/photos/3808057/pexels-photo-3808057.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                                : (menuItem == "degree")
                                    ? "https://images.pexels.com/photos/207691/pexels-photo-207691.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                                    : (menuItem == "lecturer")
                                        ? "https://images.pexels.com/photos/34084/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                                        : (menuItem == "course")
                                            ? "https://images.pexels.com/photos/3764163/pexels-photo-3764163.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                                            : "https://images.pexels.com/photos/6146935/pexels-photo-6146935.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                            fit: BoxFit.cover,
                            width: 500,
                            height: 300,
                          ),
                        ),
                        (settings.display == "degree")
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AnimatedOpacity(
                                  opacity: (settings.index > -1) ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 400),
                                  child: Container(
                                    width: 500,
                                    height: 300,
                                    // color: Colors.red,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (settings.index > -1)
                                                  ? settings.dataMap['name']
                                                  : "",
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (settings.index > -1)
                                                  ? "HEAD:"
                                                  : "",
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  int index2 = 0;
                                                  settings
                                                      .newDisplay("lecturer");
                                                  var snapshot = await firestore
                                                      .collection("lecturers")
                                                      .get();
                                                  // firestore
                                                  //     .collection("lecturers")
                                                  //     .doc()
                                                  //     .set({
                                                  //   "degree":
                                                  //       "Electrical Engineering",
                                                  //   "dob":
                                                  //       DateTime(1989, 1, 12),
                                                  //   "email":
                                                  //       "candiceo@campusstaff.com",
                                                  //   "forenames": ["Candice"],
                                                  //   "lastname": "Owen",
                                                  // });
                                                  for (var item
                                                      in snapshot.docs) {
                                                    if ("${item.data()['forenames'][0]} ${item.data()['lastname']}" ==
                                                        settings.dataMap[
                                                            'lecturer']) {
                                                      // print("Hello World");
                                                      settings.newIndex(index2);
                                                      settings.newDisplay(
                                                          "lecturer");
                                                      settings.newDataMap(
                                                          item.data());
                                                      return setState(() {
                                                        menuItem = "lecturer";
                                                      });
                                                    } else {
                                                      index2 = index2 + 1;
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  (settings.index > -1)
                                                      ? settings
                                                          .dataMap['lecturer']
                                                      : "",
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        Colors.deepOrange[200],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: Container(
                                          color: Colors.white,
                                          width: 100,
                                          height: 1,
                                        )),
                                        SizedBox(
                                          height: 9,
                                        ),
                                        Container(
                                          width: 400,
                                          height: 100,
                                          child: ListView.builder(
                                            itemCount: settings
                                                .dataMap["courses"]
                                                .toString()
                                                .split(",")
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: 400,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Center(
                                                    child: Text(
                                                      "${settings.dataMap["courses"][index]}",
                                                      style: GoogleFonts.montserrat(
                                                          color: (!(index / 2)
                                                                  .toString()
                                                                  .contains(
                                                                      ".5"))
                                                              ? Colors.deepOrange[
                                                                  200]
                                                              : Colors.deepOrange[
                                                                  50],
                                                          fontSize: 11,
                                                          fontWeight: (!(index /
                                                                      2)
                                                                  .toString()
                                                                  .contains(
                                                                      ".5"))
                                                              ? FontWeight.w300
                                                              : FontWeight
                                                                  .w400),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : (settings.display == "student")
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AnimatedOpacity(
                                      opacity:
                                          (settings.index > -1) ? 1.0 : 0.0,
                                      duration: Duration(milliseconds: 400),
                                      child: Container(
                                        width: 500,
                                        height: 300,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (settings.index > -1)
                                                      ? settings.dataMap[
                                                          'forenames'][0]
                                                      : "",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  (settings.index > -1)
                                                      ? settings
                                                          .dataMap['lastname']
                                                      : "",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          if (!readyDelete) {
                                                            setState(() {
                                                              readyDelete =
                                                                  true;
                                                            });
                                                            startTimer();
                                                          } else {
                                                            var doc = firestore
                                                                .collection(
                                                                    "students")
                                                                .where("email",
                                                                    isEqualTo: settings
                                                                            .dataMap[
                                                                        'email'])
                                                                .get();

                                                            doc.then((value) {
                                                              value.docs.forEach(
                                                                  (element) {
                                                                element
                                                                    .reference
                                                                    .delete();
                                                              });
                                                            });
                                                            setState(() {
                                                              readyDelete =
                                                                  false;
                                                            });

                                                            settings
                                                                .newIndex(-2);
                                                          }
                                                        },
                                                        child: (settings.index >
                                                                -1)
                                                            ? Icon(
                                                                Icons
                                                                    .cancel_rounded,
                                                                color: (readyDelete)
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                                size: 14,
                                                              )
                                                            : Container(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              (settings.index > -1)
                                                  ? settings.dataMap['email']
                                                  : "",
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (settings.index > -1)
                                                      ? "Degree:"
                                                      : "",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      int index2 = 0;
                                                      settings
                                                          .newDisplay("degree");
                                                      var snapshot =
                                                          await firestore
                                                              .collection(
                                                                  "degrees")
                                                              .get();
                                                      for (var item
                                                          in snapshot.docs) {
                                                        if (item.data()[
                                                                'name'] ==
                                                            settings.dataMap[
                                                                'degree']) {
                                                          settings
                                                              .newIndex(index2);
                                                          settings.newDisplay(
                                                              "degree");
                                                          settings.newDataMap(
                                                              item.data());
                                                          return setState(() {
                                                            menuItem = "degree";
                                                          });
                                                        } else {
                                                          index2 = index2 + 1;
                                                        }
                                                      }
                                                    },
                                                    child: Text(
                                                      (settings.index > -1)
                                                          ? settings
                                                              .dataMap['degree']
                                                          : "",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: Colors
                                                                      .deepOrange[
                                                                  200],
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : (settings.display == "lecturer")
                                    ? Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: AnimatedOpacity(
                                          opacity:
                                              (settings.index > -1) ? 1.0 : 0.0,
                                          duration: Duration(milliseconds: 400),
                                          child: Container(
                                            width: 500,
                                            height: 300,
                                            // color: Colors.red,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      (settings.index > -1)
                                                          ? settings.dataMap[
                                                              'forenames'][0]
                                                          : "",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      (settings.index > -1)
                                                          ? settings.dataMap[
                                                              'lastname']
                                                          : "",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  (settings.index > -1)
                                                      ? settings
                                                          .dataMap['email']
                                                      : "",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      (settings.index > -1)
                                                          ? "HEAD of:"
                                                          : "",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          int index2 = 0;
                                                          settings.newDisplay(
                                                              "degree");
                                                          var snapshot =
                                                              await firestore
                                                                  .collection(
                                                                      "degrees")
                                                                  .get();
                                                          for (var item
                                                              in snapshot
                                                                  .docs) {
                                                            if (item.data()[
                                                                    'name'] ==
                                                                settings.dataMap[
                                                                    'degree']) {
                                                              settings.newIndex(
                                                                  index2);
                                                              settings
                                                                  .newDisplay(
                                                                      "degree");
                                                              settings.newDataMap(
                                                                  item.data());
                                                              return setState(
                                                                  () {
                                                                menuItem =
                                                                    "degree";
                                                              });
                                                            } else {
                                                              index2 =
                                                                  index2 + 1;
                                                            }
                                                          }
                                                        },
                                                        child: Text(
                                                          (settings.index > -1)
                                                              ? settings
                                                                      .dataMap[
                                                                  'degree']
                                                              : "",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  color: Colors
                                                                          .deepOrange[
                                                                      200],
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AnimatedContainer(
                  duration: Duration(
                    milliseconds: 200,
                  ),
                  height: (detailOpen) ? 400 : 0,
                  width: 800,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
