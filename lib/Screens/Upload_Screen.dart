import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:tilapia_diseases/themes/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  final imagepicker = ImagePicker();

  selectImageFromGallery() async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {}
  }

  selectImageFromCamera() async {
    var getImage = await imagepicker.getImage(source: ImageSource.camera);
    if (getImage != null) {
      setState(() {
        _image = File(getImage.path);
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assests/model_unquant.tflite", labels: "assests/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.WhiteColor,
      appBar: AppBar(
        title: Text(
          " Upload Image",
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: AppColor.PrimaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //image
            Container(
              height: 250,
              width: 400,
              margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Color(0xffD9D9D9),
              ),
              child: (imageSelect)
                  ? Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.file(
                        _image,
                        height: 250,
                        width: 400,
                      ),
                    )
                  : Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Opacity(
                          opacity: 0.8,
                          child: Center(
                            child: DottedBorder(
                              // color: AppColor.borderColor,
                              dashPattern: [7, 3, 2, 3],
                              child: Container(
                                  height: 209,
                                  width: 343,
                                  child: Image.asset("images/Group 4482.png")),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            //result
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: (imageSelect)
                  ? _results.map((result) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              primary: AppColor.orangeColor,
                            ),
                            child: Text(
                              "${result['label']}",
                              style: GoogleFonts.aBeeZee(
                                  color: AppColor.WhiteColor,
                                  // color: AppColor.orangeColor,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
            //Button 1
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.PrimaryColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.image_rounded,
                        color: AppColor.PrimaryColor,
                      ),
                      Text(
                        "Upload from Gallery",
                        style: TextStyle(color: AppColor.PrimaryColor),
                      ),
                    ],
                  ),
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
                  style: GoogleFonts.aBeeZee(
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
            //Button 2
            GestureDetector(
              onTap: pickCamera,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.PrimaryColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: AppColor.PrimaryColor,
                      ),
                      Text(
                        "Upload from Camera",
                        style: TextStyle(color: AppColor.PrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

  Future pickCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
