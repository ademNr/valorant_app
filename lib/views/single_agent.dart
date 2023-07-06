import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';


class SingleAgent extends StatefulWidget {
  const SingleAgent({Key? key, required this.data}) : super(key: key);
  final List<String> data ;

  @override
  State<SingleAgent> createState() => _SingleAgentState();
}

class _SingleAgentState extends State<SingleAgent> {

  final player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    final duration =   player.setUrl(           // Load a URL
        '${widget.data[4]}');                 // Schemes: (https: | file: | asset: )
     player.play();                                  // Play without waiting for completion

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff15202B),
      appBar : AppBar(
        title: Text("${widget.data[2]}",  style: TextStyle(
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
                Icons.arrow_back, color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),

     body : ListView(
       children: [
         Stack(
           children: [
             Image.network("${widget.data[0]}", ),
             Image.network("${widget.data[1]}", ),

           ],
         ),
         Center(
           child: Text("${widget.data[2]}",  style: TextStyle(
             fontSize: 40,
             color: Colors.white,
             fontStyle: FontStyle.italic,
             fontWeight: FontWeight.bold,
           ), ),
         ),
         Center(
           child: Container(
             padding: EdgeInsets.all(25),
               child: Text("${widget.data[3]}", style: TextStyle(color: Colors.white, fontFamily: "inter", fontWeight: FontWeight.w400, fontSize: 17 ),
               )),
         ),

       ],
     )



    );
  }
}
