import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/screens/profile/contact_section.dart';
class AboutUSSection extends StatelessWidget {
  const AboutUSSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Row(
                children: [
                    IconButton(
  onPressed: () {
    Navigator.pop(context);
  },
  icon: Icon(Icons.arrow_back),
  color: Colors.black,
  iconSize: 30,
), SizedBox(width: 100),
                  Text('About Us', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                 children: [
                   Card(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            width: 300,
                            height: 300,
                            child:  Column(
                              children: [
                                SizedBox(height: 15),
                                Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        CircleAvatar(
                          radius: 50,
                        
                        ),
                      ]),
                      SizedBox(height: 15),
                      Text('Talk to us',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18,
                      ),
                      ),

                      SizedBox(height: 5,),
                      Text('We\'ll help you find the right products\n               and pricing for you,')
                              ],
                            ),
                          ),
                        ),
                 ],
               ),

               SizedBox(height: 20),
              
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(250, 40),
    ),
    child: Row(
      children: [
        Icon(Icons.phone),
        SizedBox(width: 7),
        Text('Contact Us'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
),



            ]
          )
        )
        )
    );

    
  }
}

  