import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tilapia_diseases/Screens/SignUp_Screen.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class screenOne extends StatelessWidget {
  const screenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              'images/onOne.json',
              height: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.fitHeight,
            ),
            // SizedBox(height: 32),
            Text(
              'Welcome To Your Application',
              style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColor.PrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Discover the ultimate resource for understanding and combating Tilapia diseases,empowering aquaculture enthusiasts with knowledge and solutions for healthier fish.",
                style: GoogleFonts.aBeeZee(
                  color: AppColor.TitleColor,
                  fontSize: 19,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(height: 49),
            CircleAvatar(
              backgroundColor: AppColor.PrimaryColor,
              radius: 35,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screenTwo(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: AppColor.WhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//second
class screenTwo extends StatelessWidget {
  const screenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              'images/122867-catch-the-fish.json',
              height: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.fitHeight,
            ),
            Text(
              'Tilapia History In Egypt',
              style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColor.PrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "One of the oldest examples of tilapia farming is a bas-relief found in a 4,000 year old Egyptian tomb depicting tilapias held in ponds. The Nile tilapia was called ỉn.t by the Ancient Egyptians the fish was of such great importance to them that it was given its own hieroglyph. ",
                style: GoogleFonts.aBeeZee(
                  color: AppColor.TitleColor,
                  fontSize: 19,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(height: 49),
            CircleAvatar(
              backgroundColor: AppColor.PrimaryColor,
              radius: 35,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screenThree(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: AppColor.WhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Third
class screenThree extends StatelessWidget {
  const screenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              'images/Upload.json',
              height: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.fitHeight,
            ),
            Text(
              'How to use the app',
              style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColor.PrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "The app allows users to upload images of fish, either from the gallery or by capturing a photo using the camera. It then analyzes the image and provides instant feedback, indicating whether the fish in the image is diseased or healthy.",
                style: GoogleFonts.aBeeZee(
                  color: AppColor.TitleColor,
                  fontSize: 19,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColor.PrimaryColor,
              radius: 35,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return signUp();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: AppColor.WhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
