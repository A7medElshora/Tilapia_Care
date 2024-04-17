import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tilapia_diseases/Screens/create_password.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class OTPVerification extends StatelessWidget {
  static const routeName = "/otp-verification";
  const OTPVerification({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OverflowBar(
              overflowSpacing: 10,
              children: [
                Text(
                  "Verification Code",
                  style: GoogleFonts.aBeeZee(
                      color: AppColor.TitleColor,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Please enter the verification code we sent to your phone number",
                  style: GoogleFonts.aBeeZee(
                      color: AppColor.TgreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _textFieldOTP(first: true, last: false, context: context),
                    _textFieldOTP(first: false, last: false, context: context),
                    _textFieldOTP(first: false, last: false, context: context),
                    _textFieldOTP(first: false, last: true, context: context),
                  ],
                ),
                const SizedBox(height: 28),
                //verify Button
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
                        return CreateNewPassword();
                      }));
                    },
                    child: Text(
                      'Done',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldOTP({bool? first, last, required BuildContext context}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColor.TgreyColor),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColor.PrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
