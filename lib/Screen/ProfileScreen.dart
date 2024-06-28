import 'dart:convert';

import 'package:eebbiill/CustomDwaer.dart';
import 'package:eebbiill/Screen/CustomTextFiled.dart';
import 'package:eebbiill/User.dart';
import 'package:eebbiill/constanats.dart';
import 'package:eebbiill/model/LoginProvader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart'as http ;
final urlUser = "${defaultUrl}/api/User";

Future<User?> updateUser(
    String name,
    String email,
    //String password,
    int phone,

    ) async {

try{
  var res = await http.put(
    Uri.parse(urlUser),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      "name": name,
      "email": email,
      //"password": password,
      "phone": phone,

    }),
  );

  if (res.statusCode >= 200 && res.statusCode < 300) {

    String data = res.body;
    print(data);
    return json.decode(data);

  } else {
    print("Error: ${res.statusCode}");
    return null;
  }
} catch (error) {
  throw Exception('Failed to get user data: $error');
}

}


getUser() async {

  try {
    final response = await http.get(Uri.parse(urlUser));
    print(response);
    if (response.statusCode <= 220) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception(
          'Failed to get user data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to get user data: $error');
  }
}
class profileScreen extends ConsumerStatefulWidget {
  const profileScreen({super.key});

  @override
  ConsumerState<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends ConsumerState<profileScreen> {
List data = [];
String acountType = "";
final _accountController = TextEditingController();
final _phoneController = TextEditingController();
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _cityController = TextEditingController();
final _regonController = TextEditingController();
final _homeController = TextEditingController();
final _accountTypeController = TextEditingController();
bool isLoading = true;
_fetchUserCount() async {
  try {
    final uData = await getUser() as List;
    setState(() {
      data = uData;
      isLoading = false; // Data fetching is complete, set loading state to false
    });
  } catch (error) {
    // Handle errors
    setState(() {
      isLoading = false; // Set loading state to false even in case of error
    });
    print('Error fetching user data: $error');
  }
}
  _updateUser(){
    var phone ;
    var email;
    var name;
    setState(() {
      email = _emailController.text;
     phone= int.tryParse(_phoneController.text);
     name = _nameController.text;
      updateUser(name,email,phone);
    });
  }
  @override
  void initState() {

    super.initState();
    _fetchUserCount();
  }

@override
Widget build(BuildContext context) {
  if (isLoading) {
    // Show loading indicator if data is being fetched
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  final userId = ref.watch(LoginProvider);
  final user = data.where((element) {
    if (element["costumerId"] == userId) {
      return true;
    } else {
      return false;
    }
  }).toList();

print(user);
    if (user[0]['typeAccount'] == "1"){acountType = 'منزلي';}
    else if (user[0]['typeAccount'] == "2"){acountType = 'حكومي';}
    else if    (user[0]['typeAccount'] == "3"){acountType = 'صناعس';}
    else if    (user[0]['typeAccount'] == "4"){acountType = 'تجاري';}
    else {acountType = "none";}
    final w = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("الملف الشخصي",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),),
        backgroundColor: bgColor,

      ),
      drawer:const CustomDrower(),
      body:
      Container(margin:const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(children: [
            CustomTextFiled(hintText: "${user[0]['costumerId']}", icons: Icons.numbers,enable: false , controller:_accountController, ),
             SizedBox(height: defaultPadding),
            CustomTextFiled(hintText: "${user[0]['phone']}", icons: Icons.phone ,enable: true,controller: _phoneController),
            SizedBox(height: defaultPadding),
            CustomTextFiled(hintText: "${user[0]['name']}", icons: Icons.person,enable: true , controller: _nameController),
            SizedBox(height: defaultPadding),

            CustomTextFiled(hintText: "${user[0]['email']}", icons: Icons.alternate_email,enable: true , controller: _emailController),
            SizedBox(height: defaultPadding),

            CustomTextFiled(hintText: "${user[0]['address']['city']}", icons: Icons.radar_sharp , enable: false,controller: _cityController),
            SizedBox(height: defaultPadding),

            CustomTextFiled(hintText: "${user[0]['address']['region']}", icons: Icons.location_on,enable: false,controller: _regonController),
            SizedBox(height: defaultPadding),

            CustomTextFiled(hintText: "${user[0]['address']['homeNumber']}", icons: Icons.home , enable: false,controller:_homeController ),
            SizedBox(height: defaultPadding),

            CustomTextFiled(hintText: "$acountType", icons: Icons.account_box ,enable: false,controller: _accountTypeController),
            SizedBox(height: defaultPadding),
            GestureDetector(
              onTap:_updateUser,
              child: Container(
                width: w-96,
                height: 52,
                decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text('تحديث ',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  )),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}


