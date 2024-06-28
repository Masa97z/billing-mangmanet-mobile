
import 'dart:convert';

import 'package:eebbiill/Screen/PayPyVisa.dart';
import 'package:eebbiill/constanats.dart';
import 'package:eebbiill/model/LoginProvader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


getUser() async {
  final urlUser = "${defaultUrl}/api/Amunt";

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
class PaymentScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  var data;
  @override
  void initState() {
    super.initState();
    _fetchUserCount();
  }
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
      }    }).toList();

    return Scaffold(
      appBar: AppBar(title:const Text(
        '      الدفع',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontFamily: 'Karma',
          fontWeight: FontWeight.w600,
        ),
      ),
        backgroundColor: bgColor,
      ),
      body: Stack(

        children: [

          Positioned(
            left: 56,
            top: 128,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)
              ,color: Colors.white),
              width: 296,
              height: 216,
              child: Stack(
                children: [
                  Positioned(
                    right: 208,
                    top: 24,
                    child: SizedBox(
                      width: 260,
                      child: Text(
                        '${user[0]['deps']}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 20,
                          fontFamily: 'Karma',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 12,
                    top: 24,
                    child: SizedBox(
                      width: 260,
                      child: Text(
                        'الديون',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 20,
                          fontFamily: 'Karma',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),Positioned(
                    right: 208,
                    top: 64,
                    child: SizedBox(
                      width: 260,
                      child: Text(
                        '${user[0]['currentAmount']}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 20,
                          fontFamily: 'Karma',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 208,
                    top: 148,
                    child: SizedBox(
                      width: 260,
                      child: Text(
                        '${user[0]['totalAmount']}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 20,
                          fontFamily: 'Karma',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 64,
                    child: SizedBox(
                      width: 248,
                      child: Text(
                        'المبلغ الحالي :',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 20,
                          fontFamily: 'Karma',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 145,
                    child: SizedBox(
                      width: 248,
                      child: Text(
                        'المجموع: ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 22,
                          fontFamily: 'Karma',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.88,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 57,
            top: 511,
            child: InkWell(

              child: Container(
                width: 292,
                height: 52,
                decoration: BoxDecoration(
                   color: btnColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    'الدفع بواسطة زين كاش',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Karma',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: 0.80,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 57,
            top: 433,
            child: InkWell(

              child: Container(
                width: 292,
                height: 52,
                decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    'الدفع بواسطة فيزا',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Karma',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: 0.80,
                    ),
                  ),
                ),
              ),
              onTap: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PayByVisa()));
                });
              },
            ),
          ),

        ],
      ),
    );
  }
}