import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:tilapia_diseases/Screens/Info_Screen.dart';
import 'package:tilapia_diseases/Screens/profile_screen.dart';
import 'package:tilapia_diseases/Screens/setting_screen.dart';
import 'package:tilapia_diseases/Screens/Upload_Screen.dart';
import 'package:tilapia_diseases/themes/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> listOfScreens = [
    Upload(),
    Info(),
    ProfileScreen(),
    SettingScreen(),
  ];

  bool isInternetConnected = false;

  @override
  void initState() {
    super.initState();
    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        setState(() {
          isInternetConnected = false;
        });
      } else {
        setState(() {
          isInternetConnected = true;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    if (isInternetConnected == false) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("images/e2ZB9LZ3P5.json"),
              Text(
                "No internet connection",
                style: GoogleFonts.aBeeZee(
                  color: AppColor.PrimaryColor,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        height: 45,
        color: AppColor.PrimaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOutCubicEmphasized,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(
            Icons.upload,
            size: 30,
            color: AppColor.WhiteColor,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: AppColor.WhiteColor,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: AppColor.WhiteColor,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: AppColor.WhiteColor,
          ),
        ],
      ),
      body: listOfScreens[currentIndex],
    );
  }
}
