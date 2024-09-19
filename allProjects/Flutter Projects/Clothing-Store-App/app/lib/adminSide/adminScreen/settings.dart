import 'package:shega_cloth_store_app/adminSide/adminScreen/admin_profile_screens/edit_profile.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';

import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/database/provider.dart';

import '/screens/profile/contact_section.dart';
import '/screens/profile/help_section.dart';
import '/screens/profile/setting_section.dart';
import '/screens/profile/shareapp_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).adminModel;
    String name = userData['adminName'] ?? 'Default Name';
    String email = userData['adminEmail'] ?? 'Default Email';
    String avatarUrl = userData['profileImageUrl'] ??
        'https://images.mubicdn.net/images/cast_member/286407/cache-139299-1463178721/image-w856.jpg?size=256x';

    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: ThemeUI.darker),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                  ]),
                  SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeUI.texto),
                    ),
                  ]),
                  SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: ThemeUI.texto,
                      ),
                    ),
                  ]),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 7),
                            Text('Profile'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingPage(
                                  userData: {
                                    'name': userData['adminName'],
                                    'email': userData["adminEmail"],
                                    'avatarUrl': userData[
                                        'profileImageUrl'], // Replace with the actual URL
                                  },
                                )),
                      );
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 7),
                            Text('Setting'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactSection()),
                      );
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.mail),
                            SizedBox(width: 7),
                            Text('contact'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShareAppSection()),
                      );
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.share),
                            SizedBox(width: 7),
                            Text('Share App'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpSection()),
                      );
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.help),
                            SizedBox(width: 7),
                            Text('Help'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await authMethod().UserSignOut(context);
                  ;
                },
                child: Text('Log Out'),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
