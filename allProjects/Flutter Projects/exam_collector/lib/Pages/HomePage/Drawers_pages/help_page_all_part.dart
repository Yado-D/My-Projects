import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
        title: const Center(
            child: Text(
          'FAQs',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaqItem(
                question: 'How do I create an account?',
                answer: 'To create an account, go to the "Sign Up" page...',
              ),
              FaqItem(
                question: 'Is my personal information secure?',
                answer: 'Yes, we take the security of your data seriously...',
              ),
              FaqItem(
                question: 'What payment methods are accepted?',
                answer: 'We currently accept Visa, MasterCard, and PayPal...',
              ),
              // Add more FAQ items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color:
                Color.fromARGB(255, 214, 90, 236), // Customize the text color
          ),
        ),
        tilePadding: const EdgeInsets.all(16.0), // Adjust tile padding as needed
        collapsedTextColor: Colors.blue, // Customize collapsed text color
        iconColor: Colors.blue, // Customize the icon color
        backgroundColor: Colors.grey[200],
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.blue, // Customize the text color
              ),
            ),
          ),
        ], // Customize background color
      ),
    );
  }
}

class TutorialsSection extends StatelessWidget {
  const TutorialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorials'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'How to Use Feature X:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1. Open the app and navigate to the Home screen.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '2. Tap on the "Feature X" icon.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '3. Follow the on-screen instructions to complete the process.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              // Your Tutorials content here

              const SizedBox(height: 16),

              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'Troubleshooting Guide:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'If you encounter any issues with Feature X, follow these steps:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '1. Close and reopen the app.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '2. Check your internet connection.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '3. Contact support if the problem persists.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),

              const SizedBox(height: 16),

              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'Troubleshooting Guide:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'If you encounter any issues with Feature X, follow these steps:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '1. Close and reopen the app.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '2. Check your internet connection.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '3. Contact support if the problem persists.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TroubleshootingSection extends StatelessWidget {
  const TroubleshootingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
        title: const Text('Troubleshooting Tips'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your troubleshooting tips content here
              Center(
                child: Card(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 300,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const Column(
                          children: [
                            Text(
                              'Common Issues and Solutions:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1. App Not Loading:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   - Ensure you have a stable internet connection.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '   - Close and reopen the app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '2. Error Messages:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   - Note down the error message and contact support.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '   - Check the app\'s FAQ section for possible solutions.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Card(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 300,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const Column(
                          children: [
                            Text(
                              'Contact Support:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'If you are unable to resolve the issue, please contact our support team:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: support@example.com',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Phone: +1 (123) 456-7890',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSupportSection extends StatelessWidget {
  const ContactSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
        title: const Center(child: Text('Contact Support')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'Contact Us:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'If you have any questions, concerns, or need assistance, feel free to reach out to our support team:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Email: support@example.com',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Phone: +1 (123) 456-7890',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              const SizedBox(height: 16),
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'Support Hours:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Monday - Friday: 9:00 AM to 6:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Saturday: 10:00 AM to 4:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Sunday: Closed',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserManualSection extends StatelessWidget {
  const UserManualSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
        title: const Center(child: Text('User Manual')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your User Manual content here
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'User Manual:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Welcome to our app! Here is a user manual to help you get started:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              // Add more content as needed
            ],
          ),
        ),
      ),
    );
  }
}

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
        title: const Center(
          child: Text(
            'Help',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: const Text(
                  'FAQs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 214, 90, 236),
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FaqSection())),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: const Text(
                  'Tutorials',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 214, 90, 236),
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorialsSection())),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: const Text(
                  'Trobleshooting Tips',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 214, 90, 236),
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TroubleshootingSection())),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: const Text(
                  'Contact Support',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 214, 90, 236),
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactSupportSection())),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: const Text(
                  'User Manual',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 214, 90, 236),
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserManualSection())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
