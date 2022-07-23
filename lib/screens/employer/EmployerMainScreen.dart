import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hirehub/screens/employer/home/Applicants/ApplicantTable.dart';
import 'package:hirehub/screens/employer/home/HomeScreen.dart';
import 'package:hirehub/screens/employer/message/MessageScreen.dart';
import 'package:hirehub/screens/employer/settings/SettingScreen.dart';
import 'package:hirehub/theme/Theme.dart';

class EmployerMainPage extends StatefulWidget {
  const EmployerMainPage({Key? key}) : super(key: key);

  @override
  State<EmployerMainPage> createState() => _EmployerMainPageState();
}

class _EmployerMainPageState extends State<EmployerMainPage> {
  int _selectedIndex = 0;

  List<Widget> applicantScreens = [
    HomeScreen(),
    const ApplicantsOverview(),
    const MessageScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: applicantScreens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          tabBackgroundColor: Colors.grey.shade500,
          gap: 8,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              backgroundColor: primaryClr.withOpacity(0.7),
            ),
            GButton(
              icon: Icons.search,
              text: "Explore",
              backgroundColor: yellowClr.withOpacity(0.7),
            ),
            GButton(
              icon: Icons.message,
              text: "Messages",
              backgroundColor: pinkClr.withOpacity(0.7),
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
              backgroundColor: Colors.green.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}