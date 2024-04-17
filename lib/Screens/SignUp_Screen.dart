import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tilapia_diseases/Screens/Login_Screen.dart';
import 'package:tilapia_diseases/controllers.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  // please enter your ....
  final _formKey = GlobalKey<FormState>();

  //isObscureText
  bool isObscureText = true;
  bool isObscureTextTwo = true;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordagainController = TextEditingController();
  var x = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 998,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    //image
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.transparent,
                      child: CircleAvatar(
                        radius: 51,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("images/color1 (1).png"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Let's Get started
                    Text(
                      "Let's get started",
                      style: TextStyle(
                        color: AppColor.PrimaryColor,
                        fontFamily: "Poppins",
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Create an new account
                    Text('Create a new account'),
                    SizedBox(
                      height: 10,
                    ),
                    //Full Name
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: fullnameController,
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: AppColor.PrimaryColor,
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    //Email
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColor.PrimaryColor,
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          if (value.length < 6) {
                            return 'Your email mast be over 6 letters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    //phone
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: 'phone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: AppColor.PrimaryColor,
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone';
                          }
                          if (value.length < 3) {
                            return 'Invalid PhoneNumber';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    //Password
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: passwordController,
                        obscureText: isObscureText,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColor.PrimaryColor,
                            // color: Color(0xff9098B1),
                          ),
                          suffixIcon: IconButton(
                            color: AppColor.PrimaryColor,
                            onPressed: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            icon: isObscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility), // false
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    //Confirm Password
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: passwordagainController,
                        obscureText: isObscureTextTwo,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColor.PrimaryColor,
                          ),
                          suffixIcon: IconButton(
                            color: AppColor.PrimaryColor,
                            onPressed: () {
                              setState(() {
                                isObscureTextTwo = !isObscureTextTwo;
                              });
                            },
                            icon: isObscureTextTwo
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility), // false
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // RegisterButton
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 57,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (passwordController.text ==
                                passwordagainController.text) {
                              x.sendData(fullnameController.text,
                                  emailController.text, phoneController.text);
                              Register();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("password don't match!!"),
                              ));
                            }
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: AppColor.PrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //have a account?
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "have an account?",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: Color(0xff9098B1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Login();
                              }));
                            },
                            child: Text(
                              "Sign In ",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                decoration: TextDecoration.underline,
                                color: AppColor.PrimaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 110,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Register() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": fullnameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      }));
    } on DioError catch (e) {
      print("This is an error : ${e.response}");
      if (e.response!.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("You should enter Valid email and password"),
        ));
      }
    }
  }
}
