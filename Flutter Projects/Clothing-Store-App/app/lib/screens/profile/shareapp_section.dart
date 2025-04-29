import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareAppSection extends StatelessWidget {
  void shareViaMessaging() {
    
  }

  void shareOnSocialMedia() {
  
  }

  void shareViaEmail() {
    
  }

  void copyLinkToClipboard() {

    Clipboard.setData(ClipboardData(text: 'Your App Download Link'));

  }

  void inviteFriends() {
    
  }

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
                  Text('Share App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                ],
              ),
              SizedBox(height: 150,),
              buildShareCard(
                icon: Icons.message,
                label: 'Share via Messaging',
                onPressed: shareViaMessaging,
              ),
              buildShareCard(
                icon: Icons.share,
                label: 'Share on Social Media',
                onPressed: shareOnSocialMedia,
              ),
              buildShareCard(
                icon: Icons.email,
                label: 'Share via Email',
                onPressed: shareViaEmail,
              ),
              buildShareCard(
                icon: Icons.content_copy,
                label: 'Copy Link to Clipboard',
                onPressed: copyLinkToClipboard,
              ),
              buildShareCard(
                icon: Icons.person_add, 
                label: 'Invite Friends',
                onPressed: inviteFriends,
              ),
              buildShareCard(
                icon: Icons.qr_code,
                label: 'Show QR Code',
                onPressed: () {
                  // Handle showing QR code
                  // You can navigate to a screen with the QR code
                },
              ),
              // ... other share options
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShareCard({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onPressed,
                  child: Card(
                    
                             child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  
                              
                              
                                        
                                        
                                       
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: 350,
                      height: 60,
                      child: Row(
                        children: [
                          Icon(icon),
                          SizedBox(width: 10),
                          Text(
                            label,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0),),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 0, 0, 0),),
                        ],
                      ),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
