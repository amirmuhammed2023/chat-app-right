import 'package:flutter/material.dart';

class textfieeld extends StatelessWidget {
    textfieeld({required this.text,  this.onChangeddd});
    String text ;
    Function(String)? onChangeddd ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
           validator: (value) {
             if (value!.isEmpty) {
              return "required field" ;
             }
           },
           onChanged: onChangeddd ,
            decoration:InputDecoration(
              hintText: text,
              hintStyle: TextStyle(color:Colors.white,fontSize:17),
              enabledBorder: OutlineInputBorder(
                borderRadius:BorderRadius.horizontal(left:Radius.circular(10),right:Radius.circular(10)),
                borderSide:BorderSide(color:Colors.white,width:1.4)
              )
            ) ,
          );
  }
}