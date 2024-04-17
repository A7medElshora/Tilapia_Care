import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tilapia_diseases/Screens/Delete_Account.dart';
import 'package:tilapia_diseases/Screens/create_password.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool iconBool = false;
IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.orange,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _SettingScreenState extends State<SettingScreen> {
  bool _isNotificationEnabled = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: iconBool ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColor.PrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme',
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: GoogleFonts.aBeeZee(),
                ),
                activeColor: AppColor.PrimaryColor,
                value: _isNotificationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    iconBool = !iconBool;
                    _isNotificationEnabled = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Privacy',
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              ListTile(
                title: Text(
                  'Change Password',
                  style: GoogleFonts.aBeeZee(),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Navigate to change password page
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CreateNewPassword();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'Delete Account',
                  style: GoogleFonts.aBeeZee(),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return DeleteAccount();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
