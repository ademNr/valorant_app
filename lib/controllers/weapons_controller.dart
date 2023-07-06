

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:leagueapp/models/weapons_model.dart';


class WeaponsController extends GetxController{

  RxBool isLoaded = false.obs ;
  Weapons? weapons ;


  @override
  void onInit(){
    fetchWeapons();
    super.onInit();
  }
  fetchWeapons() async {
    try{
      isLoaded(true);
      final response = await http.get(Uri.parse('https://valorant-api.com/v1/weapons')
          ,headers: {
            'content-type' : 'application/json',

          }
      );
 

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) ;
        weapons = Weapons.fromJson(jsonData);


      }

    }catch(err){
      print(err);
    }
    finally{

      isLoaded(false);
    }

  }
}