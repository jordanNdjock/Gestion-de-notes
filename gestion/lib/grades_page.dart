import 'package:flutter/material.dart';

class Course {
  final String name;
  final double grade;
  final double credit;

  Course({required this.name, required this.grade, required this.credit});
}

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  List<Course> courses = [
    Course(name: 'ict202', grade: 45.0, credit: 5),
    Course(name: 'ict208', grade: 55.0, credit: 5),
    Course(name: 'ict210', grade: 50.0, credit: 6),
  ];

  double calculateWeightedAverage() {
    double sum = 0;
    double totalCredit = 0;
    for (Course course in courses) {
      sum += course.grade * course.credit;
      totalCredit += course.credit;
    }
    return sum / totalCredit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes notes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.book),
                    title: Text(courses[index].name),
                    subtitle:
                        Text('Credit: ${courses[index].credit}', style: const TextStyle(color: Colors.grey)),
                    trailing:
                        Text(courses[index].grade.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child:
                Text('Ma MGP: ${(calculateWeightedAverage()/100).toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}

/* voici le code lorsqu'on inclue firebase tu adapte ça en fonction de tes tables dans firebase
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String name;
  final double grade;
  final double credit;

  Course({required this.name, required this.grade, required this.credit});
}

class GradesPage extends StatefulWidget {
  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  void getCourses() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('courses').get();
    setState(() {
      courses = snapshot.docs.map((doc) => Course(name: doc['name'], grade: doc['grade'], credit: doc['credit'])).toList();
    });
  }

  double calculateWeightedAverage() {
    double sum = 0;
    double totalCredit = 0;
    for (Course course in courses) {
      sum += course.grade * course.credit;
      totalCredit += course.credit;
    }
    return sum / totalCredit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grades'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text(courses[index].name),
                    subtitle:
                        Text('Credit: ${courses[index].credit}', style: TextStyle(color: Colors.grey)),
                    trailing:
                        Text(courses[index].grade.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child:
                Text('Weighted Average (MGP/100): ${(calculateWeightedAverage()/100).toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}
*/ 