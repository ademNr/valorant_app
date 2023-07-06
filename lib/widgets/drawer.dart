

import 'package:flutter/material.dart';
import 'package:leagueapp/views/home_page.dart';

import '../views/agents_page.dart';
import '../views/weapons_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: 230,
              child: Image.asset("lib/assets/valo.jpg", fit: BoxFit.fill,), ),
          SizedBox(height: 30,),
          TextButton(
            onPressed: () async{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: Row(

              children: [
                SizedBox(width: 35,),
                Icon(Icons.home_filled),
                SizedBox(width: 30),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgentsPage()),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: Row(

              children: [
                SizedBox(width: 35,),
                Image.asset("lib/assets/knighticon.png", color: Colors.white, scale: 2,), // Replace icon_name with the desired icon
                SizedBox(width: 30),
                Text(
                  'Agents',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),


          TextButton(
            onPressed: () async{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeaponsPage()),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(width: 35,),
                Image.asset("lib/assets/weaponicon.png", color: Colors.white, scale: 2  ,), // Replace icon_name with the desired icon
                SizedBox(width: 30),
                Text(
                  'Weapons',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),


        ]);
  }
}
