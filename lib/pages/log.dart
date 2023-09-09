import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onetwo/helper/imageused.dart';
import 'package:onetwo/pages/chat.dart';
import 'package:onetwo/widgets/button.dart';
import 'package:onetwo/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'signup.dart' ;
import '../helper/snackbar.dart';

class loggg extends StatefulWidget {
   loggg({super.key});
  static String id = "loggg" ;

  @override
  State<loggg> createState() => _logggState();
}

class _logggState extends State<loggg> {
  String? email ;

  String? password ;

  bool play = false ;

  GlobalKey<FormState> toof = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: play ,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: toof,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Image.asset(imageuse),
                SizedBox(height: 20,),
                Text("Scholar Chat",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:26),),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left:8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("log in",style:TextStyle(color:Colors.white,fontSize: 20),),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                textfieeld(
                  text:"Email" ,
                  onChangeddd:(data) {
                    email = data ;       
                  },
                  ),
                SizedBox(height: 15,),
                textfieeld(
                  text:"Password",
                  onChangeddd:(data) {
                    password = data ;
                  },
                  ),
                SizedBox(height: 15,),
                buttons(
                  words: "Sign in",
                  ontap: () async{
                    play = true ;
                    setState(() {
                      
                    });
                    FirebaseAuth auth = FirebaseAuth.instance ;
                    if (toof.currentState!.validate()) {
                       try {
                         UserCredential userr = await usermethod(auth);
                          Navigator.of(context).pushNamed(chatpage.idddd,arguments: email) ;
                       }on FirebaseAuthException catch (e) {
                         if (e.code == 'user-not-found') {
 
                          snack(context, "No user found for that email.");
                         }
                         else if (e.code == 'wrong-password') {
                          snack(context, "Wrong password provided for that user.");
                         }
                       }
                       play = false ;
                       setState(() {
                      
                        });
                     }
                   
                      
                  },
                  ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Donnot have an account ",style:TextStyle(fontSize:18),),
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).pushNamed(signuppage.iid) ;
                      },
                      child:Text(" sign up",style:TextStyle(color:Color(0xffC7EDE6),fontSize:18,fontWeight:FontWeight.bold),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  Future<UserCredential> usermethod(FirebaseAuth auth) {
    return auth.signInWithEmailAndPassword(
                email: email!, 
                password: password!
                );
  }
}