import 'dart:convert';

import 'package:eebbiill/Chart.dart';
import 'package:eebbiill/Cards.dart';
import 'package:eebbiill/constanats.dart';
import 'package:eebbiill/model/LoginProvader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

getUser() async {
  final urlUser = "${defaultUrl}/api/User";

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
getInvove() async {
  final urlUser = "${defaultUrl}/api/unit";

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

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List data =[];
List inv = [];
  bool isLoading = true;

  _fetchInvoce()async{
    try {
      final uinv = await getInvove() as List;
      setState(() {
        inv = uinv;
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
  void initState() {
    super.initState();
    _fetchInvoce();
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
    final unit = inv.where((element) {
      if (element["costumerId"] == userId) {
        print(element['preUnit']);

        return true;
      } else {
        return false;
      }}).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultPadding + 8),
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chart(),
              SizedBox(height: 24),
              const Text(
                "الفواتير",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: unit.length,
                    itemBuilder: (BuildContext context, int index) {
                    return Cards(currentUnit: "${unit[index]["preUnit"]}",cuttentAmunt: "45000",lastUnit: "${unit[index]["postUnit"]}",time: "${unit[index]["postTime"]}");

                    },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
