import 'package:flutter/material.dart';
import 'package:onetwo/models/messagemodel.dart';

class bubble extends StatelessWidget{
  bubble({required this.requiremessage}) ;
  final messagemodel requiremessage ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
      margin: EdgeInsets.symmetric(horizontal:16,vertical:8),
      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 20),
      child: Text(requiremessage.text,style:TextStyle(color:Colors.white),),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.only(bottomRight:Radius.circular(19),topLeft:Radius.circular(19),topRight:Radius.circular(19)),
        color: Color(0xff2B475E),
      ),        
          ),
    );
 }
}




class bubblefriend extends StatelessWidget{
  bubblefriend({required this.requiremessage}) ;
  final messagemodel requiremessage ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
      margin: EdgeInsets.symmetric(horizontal:16,vertical:8),
      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 20),
      child: Text(requiremessage.text,style:TextStyle(color:Colors.white),),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.only(bottomLeft:Radius.circular(19),topLeft:Radius.circular(19),topRight:Radius.circular(19)),
        color: Colors.teal,
      ),        
          ),
    );
 }
}