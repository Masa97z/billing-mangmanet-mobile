import 'package:eebbiill/constanats.dart';
import 'package:flutter/material.dart';
class CustomDrower extends StatelessWidget {
  const CustomDrower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor:btnColor.withAlpha(99) ,
      child: ListView(children: [

        DrawerHeader(
          decoration: BoxDecoration(

          ),
          child: Text(''),
        ),
        ListTile(

          title: const  Text("الاعدادات",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),),
          onTap: () {

          },
          leading: Icon(Icons.settings,color: Colors.white,),
        ),
        ListTile(
          title: const Text('الاشعارات',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),),
          leading: Icon(Icons.notifications_active,color: Colors.white,),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('تواصل معنا',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),),
          leading: Icon(Icons.help_outlined,color: Colors.white,),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ]),
    );
  }
}