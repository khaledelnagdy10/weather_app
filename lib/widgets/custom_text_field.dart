import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, required this.onSubmitted, });
  
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      
            onSubmitted: onSubmitted,
            decoration: const InputDecoration(
              hintText: 'enter city',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
            ),
          );
  }
}