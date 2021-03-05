// // // // // // // // // CLASSES // // // // // // // // //
class Degree {
  String name = "Unknown";
  int durationYears = 3;
  List<int> courses = [];
  int lecturer;

  Degree({
    this.courses,
    this.durationYears,
    this.lecturer,
    this.name,
  });
}

class Student {
  String forenames = "";
  String lastname = "";
  String email = "";
  String firstname = "";
  String fullname = "";
  String dob = "";
  Degree degree;

  Student({
    this.degree,
    this.dob,
    this.email,
    this.firstname,
    this.forenames,
    this.fullname,
    this.lastname,
  });
}

class Lecturer {
  String foreNames = "";
  String lastNames = "";
  String email = "";
  String firstName = "";
  String fullName = "";
  String dob = "";
  List<Degree> degree = [];
  int id;

  Lecturer({
    this.degree,
    this.dob,
    this.email,
    this.firstName,
    this.foreNames,
    this.fullName,
    this.lastNames,
    this.id,
  });
}

class Course {
  String name = "";
  int durationMonths = 3;
  Lecturer lecturer;
  Degree degree;
  int id;

  Course({
    this.degree,
    this.durationMonths,
    this.lecturer,
    this.name,
    this.id,
  });
}

List<Map> degrees = [
  {
    "id": 1,
    "courses": [],
    "durationYears": 3,
    "lecturer": 1,
    "name": "Computer Sciences",
  },
  {
    "id": 2,
    "courses": [],
    "durationYears": 3,
    "lecturer": 2,
    "name": "Electrical Engineering",
  },
  {
    "id": 3,
    "courses": [],
    "durationYears": 7,
    "lecturer": 3,
    "name": "Medicine",
  },
];

List<Map> lecturers = [
  {
    "id": 1,
    "degree": 1,
    "dob": "12-01-1994",
    "email": "samcolt@campusstaff.com",
    "firstName": "Sam",
    "foreNames": "Sam",
    "fullName": "Sam Colt",
    "lastNames": "Colt",
  },
  {
    "id": 2,
    "degree": 2,
    "dob": "27-11-1983",
    "email": "damiensaul@campusstaff.com",
    "firstName": "Damien",
    "foreNames": "Damien",
    "fullName": "Damien Saul",
    "lastNames": "Saul",
  },
  {
    "id": 3,
    "degree": 3,
    "dob": "18-04-1990",
    "email": "benxi@campusstaff.com",
    "firstName": "Ben",
    "foreNames": "Ben",
    "fullName": "Ben Xi",
    "lastNames": "Xi",
  },
];

List<Map> courses = [
  {
    "id": 1,
    "degree": 1,
    "durationMonths": 6,
    "lecturer": 1,
    "name": "Programming",
  },
  {
    "id": 2,
    "degree": 1,
    "durationMonths": 3,
    "lecturer": 3,
    "name": "Mathematics",
  },
  {
    "id": 3,
    "degree": 1,
    "durationMonths": 6,
    "lecturer": 2,
    "name": "",
  },
];
