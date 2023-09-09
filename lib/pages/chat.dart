import 'package:flutter/material.dart';
import 'package:onetwo/helper/imageused.dart';
import 'package:onetwo/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/messagemodel.dart';

class chatpage extends StatefulWidget {
   chatpage({super.key});
  static String idddd = "chat" ; 

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
  var em =  ModalRoute.of(context)!.settings.arguments;
   CollectionReference messages = FirebaseFirestore.instance.collection(chatmessages);
   TextEditingController controll = TextEditingController() ;
     final ScrollController _controller = ScrollController();
    return StreamBuilder<QuerySnapshot>(
      
      stream: messages.orderBy("atTime").snapshots(),
      builder: (context , snapshot){
        List<messagemodel> messaagelist = [] ;
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length ; i++) {
             messaagelist.add(messagemodel.fromjson(snapshot.data!.docs[i])) ;
          }
          return Scaffold(
              appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Image.asset(imageuse,
                    height: 60,
                    ),
                    Text("Chat",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Color(0xffC7EDE6),),), 
                    ],
                  ),
              backgroundColor: Color(0xff2B475E) ,
              ),
     body: Column(children: [
       Expanded(child: ListView.builder(
        controller: _controller,
        itemCount: messaagelist.length,
        itemBuilder: (context, index) {
           return messaagelist[index].uniqueid == em ?
                bubble(requiremessage: messaagelist[index],) :
                bubblefriend(requiremessage: messaagelist[index]) ;
       },)),
       Padding( 
         padding: const EdgeInsets.all(16),
         child: TextField(
          controller: controll ,
          onSubmitted:(value) {
             messages.add(
              {
                "message" : value ,
                "atTime"  : DateTime.now(),
                "id"      : em ,
              }
             );
             controll.clear() ;
             _controller.animateTo(
               _controller.position.maxScrollExtent,
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                );
          },
          decoration: InputDecoration(
            hintText: "Send message",
            suffixIcon: Icon(Icons.send,color: Color(0xff2B475E),),
            border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
            )
          ),
         ),
       ),
     ]),
    );  
        }else{
          return Text("loading ... ") ;
        }
      }
      );
  }
}