import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tilapia_diseases/themes/colors.dart';
import 'package:get/get.dart';
import 'package:tilapia_diseases/controllers.dart';

class ProfileScreen extends StatelessWidget {
  var anything = Get.put(UserController());
  ProfileScreen({Key? key}) : super(key: key);
  final double coverHeight = 200;
  final double profileHeight = 100;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 0.8;
    return Scaffold(
        backgroundColor: AppColor.WhiteColor,
        appBar: AppBar(
          title: Text(
            "Account",
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.PrimaryColor,
        ),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              buildCoverImage(),
              SizedBox(
                height: 100,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 70),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: AppColor.WhiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Icon(Icons.person, size: 25, color: Color(0xff22C7B8)),
                        SizedBox(width: 16.0),
                        Text("${anything.name.toString()}",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    //Email
                    Row(
                      children: [
                        Icon(Icons.email, size: 25, color: Color(0xff22C7B8)),
                        SizedBox(width: 16.0),
                        Text('${anything.email.toString()}',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    //phone
                    Row(
                      children: [
                        Icon(Icons.phone, size: 25, color: Color(0xff22C7B8)),
                        SizedBox(width: 16.0),
                        Text('${anything.phone.toString()}',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    //Gender
                    Row(
                      children: [
                        Icon(Icons.male_outlined,
                            size: 25, color: Color(0xff22C7B8)),
                        SizedBox(width: 16.0),
                        Text('Male',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),

                    //calender
                    Row(
                      children: [
                        Icon(Icons.date_range_sharp,
                            size: 25, color: Color(0xff22C7B8)),
                        SizedBox(width: 16.0),
                        Text('25/6/2023',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),

                    //Location
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 25, color: Color(0xff22C7B8)),
                        SizedBox(width: 16.0),
                        Text('shebin El-kom',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: top,
                child: buildProfileImage(),
              ),
            ],
          ),
        ));
  }

  Widget buildCoverImage() => Container(
        color: AppColor.WhiteColor,
      );

  Widget buildProfileImage() => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.PrimaryColor, width: 2),
        ),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("images/Mask Group 2.png"),
        ),
      );
}
