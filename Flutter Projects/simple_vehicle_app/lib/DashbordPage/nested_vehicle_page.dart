import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_vehicle_app/Common/commonWidgets.dart';

class nested_vehicle_page extends StatefulWidget {
  String name;
  String location;
  String image;
  String fuelLevel;
  final documentId;
  nested_vehicle_page({super.key,required this.name,required this.location,required this.image,required this.fuelLevel,required this.documentId});

  @override
  State<nested_vehicle_page> createState() => _nested_vehicle_pageState();
}

class _nested_vehicle_pageState extends State<nested_vehicle_page> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, widget.name),
       body: ListView(
         children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                         widget.image
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    // margin: EdgeInsets.only(left: 200),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            isFavorited = !isFavorited;
                          });
                        },
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: isFavorited ? Colors.red:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           ConstrainedBox(
             constraints: BoxConstraints.fromViewConstraints(ViewConstraints(maxHeight: 500,minHeight: 300,minWidth: 300)),
             child: Container(
                 padding: EdgeInsets.only(left: 5,right: 5),
                 margin: EdgeInsets.only(left: 10,right: 10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     gradient: LinearGradient(colors: [Colors.grey.shade500,Colors.amber.shade500,])
                 ),
                 child: Column(
                   children: [
                     reusableVehicleDetailContainer("Name","name",widget.name,),
                     reusableVehicleDetailContainer("Fuel Level","fuelLevel",widget.fuelLevel),
                     reusableVehicleDetailContainer("Last Location","lastLocation",widget.location,),
                   ],
                 )
             ),
           ),

         ],
       ),
    );
  }
  Widget reusableVehicleDetailContainer(String carFeature,String Type,String featureVal,){
    return Container(
      margin: EdgeInsets.only(left: 5,top: 30),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           ReusableText(
             TextString: "$carFeature: ",
             FontSize: 20,
           ),
           Type!="fuelLevel" ?  ReusableText(
             TextString: featureVal ,
             FontSize: 20,
           ): CircularPercentIndicator(
               radius: 50.0,
               lineWidth: 13.0,
               animation: true,
               percent: 0.7,
               center: ReusableText(
                   TextString: featureVal+" %",
                   FontSize: 20,
                 FromTop: 0,
                 FromBottom: 0,
                 FromRight: 0,
               ),
               circularStrokeCap: CircularStrokeCap.round,
               progressColor: Colors.purple,
           ),
           InkWell(
             onTap: (){
               customEditingShowDialog(context,Type,widget.documentId);
             },
             child: AppButton(
                 ButtonColor: Colors.white,
                 ContainerColor: Colors.blue,
                 ButtonText: "Edit",
             ),
           ),
         ],
       ),
    );
  }
}
