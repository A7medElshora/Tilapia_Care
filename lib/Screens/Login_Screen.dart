import 'package:flutter/material.dart';
import 'package:tilapia_diseases/Screens/SignUp_Screen.dart';
import 'package:tilapia_diseases/Screens/HomePage_Screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:tilapia_diseases/Screens/forgot_password.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tilapia_diseases/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// please enter your ....
  final _formKey = GlobalKey<FormState>();

  //isObscureText
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Google
  final Uri _url1 = Uri.parse(
      'https://myaccount.google.com/?utm_source=sign_in_no_continue&pli=1');
  //Facebook
  final Uri _url = Uri.parse('https://www.facebook.com/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
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
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: AppColor.PrimaryColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Sign in to continue'),
                SizedBox(
                  height: 5,
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
                      if (value!.length < 6) {
                        return 'Email must be above 6 character';
                      }
                      if (value.isEmpty) {
                        return 'Please enter your Password';
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
                //Sign In
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 57,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // signIn();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return HomePage();
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Welcome"),
                            backgroundColor: AppColor.PrimaryColor,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Login',
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
                //Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Divider(
                        height: 25,
                        thickness: 2,
                        color: Colors.black26,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Divider(
                        height: 25,
                        thickness: 2,
                        color: Colors.black26,
                        indent: 10,
                        endIndent: 10,
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 10,
                ),
                //Login with Google
                SignInButton(
                  Buttons.Google,
                  text: "Login with Google",
                  onPressed: _launchUrl1,
                ),
                SizedBox(
                  height: 10,
                ),
                //Login with Facebook
                SignInButton(
                  Buttons.Facebook,
                  text: "Login with Facebook",
                  onPressed: _launchUrl,
                ),
                SizedBox(
                  height: 10,
                ),
                //Forget Password
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ForgotPassword();
                    }));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.PrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                //Don't have a account
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff9098B1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return signUp();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.PrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void signIn() async{
  //   try{
  //     final response = await Dio().post("https://api.escuelajs.co/api/v1/auth/login" ,data: {
  //       "email": emailController.text,
  //       "password": passwordController.text,
  //     });
  //     print("data is : ${response.data['access_token']}");
  //
  //     final accessToken = response.data['access_token'];
  //
  //     final prefs = await SharedPreferences.getInstance();
  //
  //     await prefs.setString('access_token', accessToken);
  //
  //     final access = await prefs.get('access_token');
  //     print("my access token is : $access");
  //
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
  //       return HomePage();
  //     }));
  //   }
  //   on DioError catch(e){
  //     print("This is an Error : ${e.response}");
  //     if(e.response!.statusCode==401){
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("You should enter Valid email and password") ,
  //         backgroundColor: Colors.red,
  //       ));
  //     }
  //   }
  //
  //
  // }
  //Google
  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw Exception('Could not launch $_url1');
    }
  }

  //Facebook
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
