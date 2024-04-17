import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tilapia_diseases/Screens/SignUp_Screen.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class PasswordChanged extends StatefulWidget {
  static const routeName = "/password-changed";
  const PasswordChanged({Key? key}) : super(key: key);

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                repeat: true,
                "images/132855-best-verification-animation.json",
                controller: _controller,
                fit: BoxFit.fill,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            Text(
              "Password Changed!",
              style: GoogleFonts.aBeeZee(
                  color: AppColor.TitleColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Your password has been changed\nsuccessfully.",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                  color: AppColor.TgreyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 57,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: AppColor.PrimaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return signUp();
                  }));
                },
                child: Text(
                  'Back To Sign Up',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
