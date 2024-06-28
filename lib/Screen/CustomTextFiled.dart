import 'package:flutter/material.dart';
class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.hintText, required this.icons, required this.enable, required this.controller  });
final String hintText;
final IconData icons;
final bool enable;
final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fillColor: Colors.white,
        filled: true,
        enabled: enable,

        hintText: hintText,
        prefixIcon: Icon(icons),
      ),
    );
  }
}
