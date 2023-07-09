import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({super.key});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  File? gallery;
  Future pickGallery() async{
    try{
      final gallery = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(gallery == null)return;
      final imageTemporary = File(gallery.path);
      setState(()=>this.gallery = imageTemporary);
    }on PlatformException catch(e){
      print('Failed to pick image: $e');
    }

  }

  File? camera;
  Future pickCamera() async{
    await ImagePicker().pickImage(source: ImageSource.camera);

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.person,color: Colors.blueAccent,size: 45,),
                  Text("User Name"),
                  Text("User Mail")
                ],
              ),
            ),
          ),
          ListTile(
            onTap: (){

            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.dashboard),
            title: Text("My Dashboard"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.gamepad),
            title: Text("My Contest"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.wallet),
            title: Text("My Wallet"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.transfer_within_a_station),
            title: Text("My Transaction"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.details),
            title: Text("Account Details"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.earbuds),
            title: Text("Refer and Earn"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.play_arrow),
            title: Text("How to Play"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.policy),
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.quick_contacts_dialer),
            title: Text("Term and Conditions"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          ListTile(
            onTap: (){
            },
            minVerticalPadding:17,
            dense: true,
            visualDensity: VisualDensity(vertical: -2),
            leading: Icon(Icons.support),
            title: Text("Help & Support"),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
          SizedBox(
            height: Get.height*0.015,
          ),
          GestureDetector(
            onTap: (){
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height*0.055,
              width: MediaQuery.sizeOf(context).width*0.5,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Logout")
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}