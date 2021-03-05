import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_salo/misc/services/Provider.dart';

// // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // StudentCard // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // //

class StudentCard extends StatefulWidget {
  dynamic snappy;
  int index;

  StudentCard({this.snappy, this.index});
  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (settings.index == widget.index) {
                settings.newIndex(-2);
                settings.newDataMap({});
              } else {
                settings.newIndex(-2);
                settings.newDisplay("student");
                settings.newIndex(widget.index);
                settings.newDataMap({
                  "degree": widget.snappy.docs[widget.index]["degree"],
                  "dob": widget.snappy.docs[widget.index]["dob"],
                  "email": widget.snappy.docs[widget.index]["email"],
                  "forenames": widget.snappy.docs[widget.index]["forenames"],
                  "lastname": widget.snappy.docs[widget.index]["lastname"],
                });
              }
              print(settings.dataMap.toString());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                bottomRight: Radius.circular(2),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: Container(
                width: 300,
                height: 50,
                color: (settings.index == widget.index)
                    ? Colors.deepOrange
                    : Colors.deepOrange[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.snappy.docs[widget.index]["lastname"]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.snappy.docs[widget.index]["forenames"][0]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.snappy.docs[widget.index]["degree"]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.snappy.docs[widget.index]["email"]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.snappy.docs[widget.index]["dob"]
                            .toDate()
                            .toString()
                            .split(" ")[0],
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // DegreeCard // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // //

class DegreeCard extends StatefulWidget {
  dynamic snappy;
  int index;

  DegreeCard({this.snappy, this.index});
  @override
  _DegreeCardState createState() => _DegreeCardState();
}

class _DegreeCardState extends State<DegreeCard> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (settings.index == widget.index) {
                settings.newIndex(-2);
                settings.newDataMap({});
              } else {
                settings.newIndex(-2);
                settings.newDisplay("degree");
                settings.newIndex(widget.index);
                settings.newDataMap({
                  "courses": widget.snappy.docs[widget.index]["courses"],
                  "duration": widget.snappy.docs[widget.index]["durationyears"],
                  "lecturer": widget.snappy.docs[widget.index]["lecturer"],
                  "name": widget.snappy.docs[widget.index]["name"],
                });
              }
              print(settings.dataMap.toString());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                bottomRight: Radius.circular(2),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 300,
                height: 50,
                color: (settings.index == widget.index)
                    ? Colors.deepOrange
                    : Colors.deepOrange[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.snappy.docs[widget.index]["name"].toString(),
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.snappy.docs[widget.index]["lecturer"]
                              .toString(),
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // LecturerCard // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // //

class LecturerCard extends StatefulWidget {
  dynamic snappy;
  int index;

  LecturerCard({this.snappy, this.index});
  @override
  _LecturerCardState createState() => _LecturerCardState();
}

class _LecturerCardState extends State<LecturerCard> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (settings.index == widget.index) {
                settings.newIndex(-2);
                settings.newDataMap({});
              } else {
                settings.newIndex(-2);
                settings.newDisplay("lecturer");
                settings.newIndex(widget.index);
                settings.newDataMap({
                  "degree": widget.snappy.docs[widget.index]["degree"],
                  "dob": widget.snappy.docs[widget.index]["dob"],
                  "email": widget.snappy.docs[widget.index]["email"],
                  "forenames": widget.snappy.docs[widget.index]["forenames"],
                  "lastname": widget.snappy.docs[widget.index]["lastname"],
                });
              }
              print(settings.dataMap.toString());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                bottomRight: Radius.circular(2),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: Container(
                width: 300,
                height: 50,
                color: (settings.index == widget.index)
                    ? Colors.deepOrange
                    : Colors.deepOrange[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.snappy.docs[widget.index]["lastname"]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.snappy.docs[widget.index]["forenames"][0]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.snappy.docs[widget.index]["degree"]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.snappy.docs[widget.index]["email"]
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.snappy.docs[widget.index]["dob"]
                            .toDate()
                            .toString()
                            .split(" ")[0],
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // AddStudent // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // //

class AddStudent extends StatefulWidget {
  fs.FirebaseFirestore firestore;
  AddStudent(this.firestore);
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);

    return Center(
        child: Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 107,
                width: 600,
                child: StreamBuilder(
                  stream: widget.firestore.collection("degrees").snapshots(),
                  builder: (context, snapshot) {
                    var snappy = snapshot.data;
                    return GridView.builder(
                      itemCount: snappy.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  settings
                                      .newDegree(snappy.docs[index]["name"]);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  // width: 100,
                                  // height: 50,
                                  color: (settings.degree ==
                                          snappy.docs[index]["name"])
                                      ? Colors.deepOrange
                                      : Colors.deepOrange[200],
                                  child: Center(
                                    child: Text(
                                      snappy.docs[index]["name"],
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 215,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: TextFormField(
                        onChanged: (value) {
                          settings.newFirst(value);

                          return null;
                        },
                        autocorrect: true,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'First names..'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: 215,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: TextFormField(
                        onChanged: (value) {
                          settings.newLast(value);

                          return null;
                        },
                        autocorrect: true,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'Last name..'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 438,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    onChanged: (value) {
                      settings.newEmail(value);
                      return null;
                    },
                    autocorrect: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.black26,
                        filled: true,
                        hintText: 'Email..'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: TextFormField(
                        onChanged: (value) {
                          settings.newMonth(int.parse(value));

                          return null;
                        },
                        autocorrect: true,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'MM'),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: TextFormField(
                        onChanged: (value) {
                          settings.newDay(int.parse(value));

                          return null;
                        },
                        autocorrect: true,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'DD'),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: TextFormField(
                        onChanged: (value) {
                          settings.newYear(int.parse(value));

                          return null;
                        },
                        autocorrect: true,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.black26,
                          filled: true,
                          hintText: 'YYYY',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
