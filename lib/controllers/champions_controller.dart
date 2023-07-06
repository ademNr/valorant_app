

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/champion_model.dart';

class ChampionController extends GetxController{

  RxBool isLoaded = false.obs ;
  Champions? champions ;


  @override
  void onInit(){
    fetchChampions();
    super.onInit();
  }


  fetchChampions() async {
    try{
      isLoaded(true); 
    final response = await http.get(Uri.parse('https://valorant-api.com/v1/agents')
    ,headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      champions = Champions.fromJson(jsonData);
    } 

    }catch(err){
      print(err);
    }
    finally{
    isLoaded(false); 
    }
    
  }
}