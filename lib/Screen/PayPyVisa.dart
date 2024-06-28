import 'dart:convert';

import 'package:eebbiill/constanats.dart';
import 'package:eebbiill/model/LoginProvader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

List userData = [];

getUser() async {
  final urlUser = "${defaultUrl}/api/Amunt";

  final response = await http.get(Uri.parse(urlUser));
  print(response);
  if (response.statusCode <= 220) {
    final data = jsonDecode(response.body) as List<dynamic>;
    return data;
  } else {
    throw Exception(
        'Failed to get user data. Status code: ${response.statusCode}');
  }
}

Future<dynamic> updateUser({
  required int amount,
  required String cid,

}) async {
  try {

    var response = await http.put(
      Uri.parse("$defaultUrl/api/Amunt/new/$cid"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({

        "costumerId": cid,
        "totalAmount": amount,
      }),
    );

    print(response.body);
print(response.statusCode);
    var responseData = json.decode(response.body);
    return responseData;
  } catch (e) {
    print("Error updating user: $e");
  }
}

class PayByVisa extends ConsumerStatefulWidget {
  const PayByVisa({super.key});

  @override
  ConsumerState<PayByVisa> createState() => _PayByVisaState();
}

class _PayByVisaState extends ConsumerState<PayByVisa> {
  @override
  void initState() {
    _fetchUserCount();
    super.initState();
  }

  List data = [];

  _fetchUserCount() async {
    final uData = await getUser() as List;
    setState(() {
      data = uData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(LoginProvider).toString();
    userData = data.where((element) {
      if (element["costumerId"] == userId) {
        return true;
      } else {
        return false;
      }
    }).toList();
    print(userData);
    final money = TextEditingController();
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 96),
              TextField(
                controller: money,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: ' المبلغ المراد دفعه (الحد الأقصى: ${data[0]['totalAmount'] ?? 'جاري التحميل'} )',
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'رقم الحساب',
                ),
                validator: (value) {
                  value = data[0]["totalAmount"].toString();
                  if (value.isEmpty) {
                    return 'الرجاء إدخال رقم الحساب';
                  }
                  final enteredNumber = int.tryParse(value);
                  if (enteredNumber == null) {
                    return 'الرجاء إدخال رقم صحيح';
                  }
                  // Replace 1000 with your maximum number
                  if (enteredNumber > data[0]['totalAmount']) {
                    return 'الرجاء إدخال رقم أقل من أو يساوي ${data[0]['totalAmount']}';
                  }
                  return null; // Return null if input is valid
                },
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: w,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 128,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'yy/mm',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Positioned(
                        right: 216,
                        child: Container(
                          width: 164,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'cvc',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              // Login Button

    InkWell(
    onTap: () {
    bool isSecsessful = false;
    setState(() {
    int endAmount =  (data[0]["totalAmount"] == 0 &&money.text.isEmpty?0: int.parse(money.text) );
    if (endAmount.bitLength >0) {
    isSecsessful = true;
    }
    updateUser(amount: endAmount, cid: userId);
    if(isSecsessful){
    _showStatusSnackbar(context ,isSecsessful);
    delayedPop(context);
    }else{
    _showStatusSnackbar(context ,isSecsessful);

    }
    });
    },
    child: Container(
    width: w,
    height: 52,
    decoration: BoxDecoration(
    color: btnColor, // Change color to green
    borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
    child: Text(
    'دفع',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w200,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
      )
    );
  }

  }
  void delayedPop(BuildContext context) async {
    // Wait for 2 seconds
    await Future.delayed(Duration(seconds: 1));

    // Perform pop operation after delay
    Navigator.of(context).pop();
  }
  // Function to show success snackbar
  void _showStatusSnackbar(BuildContext context, bool isSuccess) {
    final snackBar = SnackBar(
      content: Text(isSuccess ? 'تم الدفع بنجاح' : 'فشل الدفع'),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

