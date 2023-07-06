import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class SingleWeapon extends StatefulWidget {
  const SingleWeapon({Key? key, required this.data}) : super(key: key);
  final List<String> data ;

  @override
  State<SingleWeapon> createState() => _SingleWeaponState();
}

class _SingleWeaponState extends State<SingleWeapon> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff15202B),
      appBar : AppBar(
        title: Text("${widget.data[1]}" ?? "",  style: TextStyle(
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

      body: SafeArea(
        child:  ListView(
          children: [
            SizedBox(height: 60,),
            Container(
              padding: EdgeInsets.all(10),
                child: Image.network("${widget.data[0] ?? ''}" ??'', )),
            SizedBox(height: 10,),
            Center(
              child: Text("${widget.data[2]}" ,  style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ), ),
            ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.only(left: 20),

                child: Text("Fire Rate : ${widget.data[3] ?? ''}" ?? "",style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "inter"), )),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: StepProgressIndicator(
                totalSteps: 16,
                currentStep: double.parse(widget.data[3]).toInt(),
                size: 12,
                padding: 0,
                selectedColor: Colors.black,
                unselectedColor: Colors.black,
                roundedEdges: Radius.circular(5),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white, Colors.white],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.black],
                ),
              ),
            ),

            SizedBox(height: 60,),
            Container(
                padding: EdgeInsets.only(left: 20),

                child: Text("First Bullet Accuracy : ${widget.data[4] ?? ''} " ?? '',style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "inter"), )),
      Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 2),
        child: StepProgressIndicator(
          totalSteps: 5,
          currentStep: double.parse(widget.data[4]).toInt(),
          size: 12,
          padding: 0,
          selectedColor: Colors.black,
          unselectedColor: Colors.black,
          roundedEdges: Radius.circular(5),
          selectedGradientColor: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.white],
          ),
          unselectedGradientColor: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black],
          ),
        ),
      ),
            //
            SizedBox(height: 60,),
            Container(
                padding: EdgeInsets.only(left: 20),

                child: Text("Magazine Size : ${widget.data[5] ?? ''} " ?? "",style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "inter"), )),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: StepProgressIndicator(
                totalSteps: 100,
                currentStep: double.parse(widget.data[5]).toInt(),
                size: 12,
                padding: 0,
                selectedColor: Colors.black,
                unselectedColor: Colors.black,
                roundedEdges: Radius.circular(5),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white, Colors.white],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.black],
                ),
              ),
            ),

            SizedBox(height: 60,)

          ],
        ),
      ),
    );
  }
}
