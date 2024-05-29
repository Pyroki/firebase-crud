import 'dart:math';

import 'package:firebase_crud/field_layout.dart';

import 'package:firebase_crud/service/databse.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Firebase",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              field(
                topic: 'Name',
                controller: name,
              ),
              const SizedBox(
                height: 25,
              ),
              field(
                topic: 'Age',
                controller: age,
              ),
              const SizedBox(
                height: 25,
              ),
              field(
                topic: 'Location',
                controller: location,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  String id = Random()
                      .nextInt(10000)
                      .toString(); // Generating a random ID
                  Map<String, dynamic> employeeDoc = {
                    'Name': name.text,
                    'Age': age.text,
                    'Location': location.text,
                  };
                  await Database()
                      .employeedetail(
                          employeeDoc, id) // Ensure method name matches
                      .then((value) {
                    Fluttertoast.showToast(
                      msg: "Employee details added successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: const Color.fromARGB(255, 68, 134, 167),
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                },
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
