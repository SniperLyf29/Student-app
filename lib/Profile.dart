import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _dobController = TextEditingController();

addData() {
  Map<String, dynamic> data = {
    "name": _nameController.text,
    "email": _emailController.text,
    "phone_number": _phoneController.text,
    "DOB": _dobController.text
  };
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  collectionReference.add(data);
}

updateData() async {
  Map<String, dynamic> data = {
    "name": _nameController.text,
    "email": _emailController.text,
    "phone_number": _phoneController.text,
    "DOB": _dobController.text
  };
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs[0].reference.update(data);
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("PROFILE PAGE"), backgroundColor: Colors.grey),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 0, bottom: 0),
            child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NAME',
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              controller: _emailController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'EMAIL_ID',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
                controller: _dobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'DATE-OF-BIRTH',
                  hintText: 'Enter in DD/MM/YYYY format',
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: MaterialButton(
                  elevation: 5.0,
                  onPressed: () {
                    setState(() {
                      addData();
                    });
                  },
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.black,
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: MaterialButton(
                  elevation: 5.0,
                  onPressed: () {
                    setState(() {
                      updateData();
                    });
                  },
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.black,
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ])));
  }
}
