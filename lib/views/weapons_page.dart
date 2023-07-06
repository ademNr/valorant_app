import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leagueapp/controllers/champions_controller.dart';
import 'package:leagueapp/controllers/weapons_controller.dart';
import 'package:leagueapp/views/single_agent.dart';
import 'package:leagueapp/views/single_weapon_page.dart';
import 'package:leagueapp/widgets/drawer.dart';

import 'agents_page.dart';


class WeaponsPage extends StatefulWidget {
  WeaponsPage({Key? key}) : super(key: key);

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {

  WeaponsController weaponsController = Get.put(WeaponsController());
  @override
  void initState() {
    super.initState();
    weaponsController.fetchWeapons(); // Fetch the weapons data
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15202B),
      appBar: AppBar(
        title: Text("Weapons",  style: TextStyle(
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
      //-----------------------------------------------------------------------------------------------------
      body: SafeArea(
        child: Center(
          child: Obx(() {
            if (weaponsController.isLoaded.value) {
              return CircularProgressIndicator(color: Colors.white);
            } else {
              if (weaponsController.weapons != null &&
                  weaponsController.weapons!.data != null) {
                return ListView.builder(
                  itemCount: weaponsController.weapons!.data!.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      color:  Color(0xff15202B).withOpacity(0.9),
                      elevation: 0,
                      margin:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(

                        leading: Container(
                          height: 70,
                          width: 70,
                          child: Image.network(
                              "${weaponsController.weapons!
                                  .data![index].displayIcon}",scale: 1,
                            ),

                        ),
                        title: Text(weaponsController.weapons!
                            .data![index].displayName
                            .toString(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "inter"),),
                        subtitle: Text(weaponsController.weapons!
                            .data![index].category.toString().split("::").last, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontFamily: "inter"),
                        ),
                        onTap: () {
                          // Handle tile tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SingleWeapon( data :  [
                              weaponsController.weapons!
                                  .data![index].displayIcon.toString(),// image
                              //portrait
                              weaponsController.weapons!
                                  .data![index].displayName.toString(), // name
                              weaponsController.weapons!
                                  .data![index].category.toString().split("::").last,// description
                                weaponsController.weapons!
                                    .data![index].weaponStats!.fireRate.toString(), //firerate
                              weaponsController.weapons!
                                  .data![index].weaponStats!.firstBulletAccuracy.toString(),// first bullet accuracy
                              weaponsController.weapons!
                                  .data![index].weaponStats!.magazineSize.toString(),// magazine size



                            ]  ), ),
                          );
                        },
                      ),
                    );
                  },
                );
              } else {
                return Text('No data available'); // Placeholder for no data
              }
            }
          }),
        ),
      ),
    );
  }
}