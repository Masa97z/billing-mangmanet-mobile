import 'dart:convert';

import 'package:eebbiill/Screen/SignupScreen.dart';
import 'package:eebbiill/TsbScreen.dart';
import 'package:eebbiill/constanats.dart';
import 'package:eebbiill/model/LoginProvader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getUser() async {
  try {
    var res = await http.get(Uri.parse("${defaultUrl}/api/User"));
    final data = json.decode(res.body) as List;
    return data;
  } catch (e) {
    print('Error fetching user data: $e');
    throw e; // Rethrow the error to handle it in the UI or log it
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var dd;

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                  image: AssetImage("assets/image/login.png"),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'الرمز السري',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                SizedBox(height: 32.0),
                // Login Button
                InkWell(
                  onTap: () async {
                    final List d = await getUser();
                    setState(() {
                      dd = d;
                      final name = _usernameController.text;
                      final pass = _passwordController.text;

                      if (dd != null) {
                        dd.forEach((element) {
                          if (element['costumerId'] == name &&
                              element['password'] == pass) {
                            print(element);

                           ref.read(LoginProvider.notifier)
                                .updateStringData(element['costumerId']);

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => TabScreen(),
                              ),
                            );
                          }
                        });
                      }
                    });
                  },
                  child: Container(
                    width: w - 96,
                    height: 52,
                    decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text('تسجيل الدخول',
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
                    Text('ليس لديك حساب ! ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignupScreen()));
                      },
                      child: Text('تسجيل',style: TextStyle(color: btnColor),),
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