import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onetwo/helper/imageused.dart';
import 'package:onetwo/widgets/button.dart';
import 'package:onetwo/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/snackbar.dart';

class signuppage extends StatefulWidget {
   signuppage({super.key});
  static String iid = "signup" ;

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  String? email ;

  String? password ;

  bool play = false ;

  GlobalKey<FormState> tof = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: play ,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: tof,
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
                      Text("Sign up",style:TextStyle(color:Colors.white,fontSize: 20),),
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
                  words: "Sign up",
                  ontap: () async{
                    play = true ;
                    setState(() {
                      
                    });
                    FirebaseAuth auth = FirebaseAuth.instance ;
                    if (tof.currentState!.validate()) {
                       try {
                         UserCredential userr = await usermethod(auth);
                            snack(context, "Succeeed");
                       }on FirebaseAuthException catch (e) {
                         if (e.code == 'email-already-in-use') {
                            snack(context, "Used E-mail");
                         }
                         else if (e.code == 'weak-password') {
                            snack(context, "weak");
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
                        Navigator.of(context).pop();
                      },
                      child:Text(" Sign in",style:TextStyle(color:Color(0xffC7EDE6),fontSize:18,fontWeight:FontWeight.bold),),
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
    return auth.createUserWithEmailAndPassword(
                email: email!, 
                password: password!
                );
  }
}