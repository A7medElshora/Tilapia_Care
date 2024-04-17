import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tilapia_diseases/Screens/SignUp_Screen.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OverflowBar(
                      overflowSpacing: 10,
                      children: [
                        Text(
                          "Delete Account?",
                          style: GoogleFonts.aBeeZee(
                              color: AppColor.TitleColor,
                              fontSize: 34,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "It's advisable for you to request your data to\n be sent to your email.",
                          style: GoogleFonts.aBeeZee(
                              color: AppColor.TgreyColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: AppColor.PrimaryColor,
                              tristate: true,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              },
                            ),
                            Text(
                              'Yes, send my data to my email',
                              style: GoogleFonts.aBeeZee(
                                  color: AppColor.TgreyColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 22),
                        //send code button
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
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return signUp();
                              }));
                            },
                            child: Text(
                              'CONFIRM DELETION',
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
            ),
          ],
        ),
      ),
    );
  }
}
