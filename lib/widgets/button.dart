import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  buttons({required this.words, this.ontap});
  String words; 
  VoidCallback? ontap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: ontap,
            child:Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(13),
                color:Colors.white
                ),
              height:40 ,
              width:double.infinity,
              child:Text(words,style:TextStyle(fontSize: 16),),
            ),
          );
  }
}