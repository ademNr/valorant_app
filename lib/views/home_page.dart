import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leagueapp/views/agents_page.dart';
import 'package:leagueapp/views/weapons_page.dart';

import '../widgets/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15202B),
      appBar: AppBar(
        title: Text("Home",  style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
        ), ),
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xff15202B),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.drag_handle_sharp, color: Colors.white,size: 40,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(


          backgroundColor: Color(0xff15202B),
          child: DrawerWidget()
      ),
      
      body: Stack(
        children: [

          Column(
            children: [
              SizedBox(height: 50,),
              Container(


                  child: Text("Agents",style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "inter"), )),
              GestureDetector(
                onTap: (){
                  Get.to(()=> AgentsPage());
                },
                child: Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(4, 4), /// Adjust the shadow offset as needed
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("lib/assets/valo.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(


                  child: Text("Weapons",style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "inter"), )),
              GestureDetector(
                onTap: (){
                  Get.to(()=> WeaponsPage());
                },
                child: Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(4, 4), // Adjust the shadow offset as needed
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("lib/assets/weapon5.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ],
      )
    );

  }
}
