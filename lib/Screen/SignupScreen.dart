import 'dart:convert';

import 'package:eebbiill/Screen/LoginScreen.dart';
import 'package:eebbiill/Screen/homeScreen.dart';
import 'package:eebbiill/TsbScreen.dart';
import 'package:eebbiill/constanats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getUser() async {
  try {
    var res =
        await http.get(Uri.parse("http://192.168.2.103:8888/api/AdminUser"));
    final data = json.decode(res.body) as List;
    return data;
  } catch (e) {
    print('Error fetching user data: $e');
    throw e; // Rethrow the error to handle it in the UI or log it
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var data;

  var dd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
          width: 600,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32.0),
                Image(
                  image: AssetImage("assets/image/signup.png"),
                  height: 232,
                ),
                SizedBox(height: 32.0),

                // Username Text Field
                TextField(
                  controller: _usernameController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'رقم الحساب',
                    prefixIcon: Icon(Icons.person_2_outlined),
                  ),
                ),
                SizedBox(height: defaultPadding),
                // Password Text Field
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'رقم الهاتف',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                SizedBox(height: 32.0),
                // Login Button
                GestureDetector(
                  onTap: () async {
                    final List d = await getUser();
                    setState(() {
                      dd = d;
                      final name = _usernameController.text;
                      final pass = _passwordController.text;
                      bool credentialsFound =
                          false; // Flag to track if credentials are found

                      print('$dd');
                      if (dd != null) {
                        dd.forEach((element) {
                          if (element['email'] == name &&
                              element['password'] == pass) {
                            credentialsFound =
                                true; // Set flag to true if credentials are found
                          } else {
                            print("eeeee");
                          }
                        });
                      }

                      //   if (credentialsFound) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => TabScreen()));
                      //  } else {
                      // Credentials not found, display error message or handle the case accordingly
                      //   }
                    });
                  },
                  child: Container(
                    width: w - 96,
                    height: 52,
                    decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text('تسجيل ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                // Forgot Password Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text(' لديك حساب بالفعل ! ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      },
                      child:const Text('تسجيل الدخول',style: TextStyle(color: btnColor),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
