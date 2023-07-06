import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leagueapp/controllers/champions_controller.dart';
import 'package:leagueapp/views/single_agent.dart';
import 'package:leagueapp/views/weapons_page.dart';
import 'package:leagueapp/widgets/drawer.dart';


class AgentsPage extends StatefulWidget {
  AgentsPage({Key? key}) : super(key: key);

  @override
  State<AgentsPage> createState() => _AgentsPagePageState();
}

class _AgentsPagePageState extends State<AgentsPage> {

  ChampionController championController = Get.put(ChampionController()) ;
  @override
  void initState() {
    super.initState();
    championController.fetchChampions(); // Fetch the champions data
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15202B),
      appBar: AppBar(
        title: Text("Agents",  style: TextStyle(
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
        child:DrawerWidget()
      ),
      //-----------------------------------------------------------------------------------------------------
      body: SafeArea(
        child: Center(
          child: Obx(() {
            if (championController.isLoaded.value) {
              return CircularProgressIndicator(color: Colors.white);
            } else {
              if (championController.champions != null &&
                  championController.champions!.data != null) {
                return ListView.builder(
                  itemCount: championController.champions!.data!.length ?? 0,
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
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "${championController.champions!
                                  .data![index].displayIcon}",
                            ),
                          ),
                        ),
                        title: Text(championController.champions!
                            .data![index].displayName
                            .toString(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "inter"),),
                        subtitle: Text(championController.champions!
                            .data![index].developerName.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontFamily: "inter"),
                          ),
                        onTap: () {
                          // Handle tile tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SingleAgent( data :  [
                              championController.champions!
                                  .data![index].background.toString(),// bg
                              championController.champions!
                                  .data![index].fullPortrait.toString(), //portrait
                              championController.champions!
                                  .data![index].displayName.toString(), // name
                              championController.champions!
                                  .data![index].description.toString(),// description
                              championController.champions!
                                  .data![index].voiceLine!.mediaList![0].wave.toString()
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