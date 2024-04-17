import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tilapia_diseases/models/Carousel_Slider.dart';
import 'package:tilapia_diseases/themes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  // final controller = CarouselController();
  List<SliderMode> listOfSlider = [
    SliderMode(image: "images/DSC_2610-removebg-preview.png"),
    SliderMode(image: "images/DSC_2536-removebg-preview.png"),
    SliderMode(image: "images/pngegg (12).png"),
    SliderMode(image: "images/DSC_2542-removebg-preview.png"),
    SliderMode(image: "images/DSC_2815-removebg-preview.png"),
  ];

  //treatment
  final Uri _url = Uri.parse(
      'https://www.globalseafood.org/advocate/how-feed-and-water-additives-are-used-on-egypts-nile-tilapia-farms/');
  //Tilapia diseases
  final Uri _url2 = Uri.parse(
      'https://www.globalseafood.org/advocate/disease-management-tilapia/');
  //info
  final Uri _url3 =
      Uri.parse('https://www.aquaticcommunity.com/tilapia/history.php');

  //other diseases
  final Uri _url4 = Uri.parse(
      'https://onlinelibrary.wiley.com/doi/full/10.1111/raq.12743#:~:text=We%20should%20keep%20this%20in,francisellosis%2C%20columnaris%20disease%20and%20vibriosis.');

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Info",
          style: GoogleFonts.aBeeZee(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.PrimaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                child: CarouselSlider.builder(
                  carouselController: CarouselController(),
                  itemCount: listOfSlider.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        listOfSlider[itemIndex].image,
                      ),
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    height: 220,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    enableInfiniteScroll: true,
                  ),
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: listOfSlider.length,
                effect: const WormEffect(
                  activeDotColor: AppColor.PrimaryColor,
                  dotHeight: 5,
                  dotColor: AppColor.borderColor,
                  paintStyle: PaintingStyle.fill,
                  type: WormType.thin,
                ),
              ),
            ]),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Information",
                  style: GoogleFonts.aBeeZee(
                      color: AppColor.PrimaryColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _launchUrl3,
                  child: Text(
                    "More Info",
                    style: GoogleFonts.aBeeZee(
                        color: AppColor.orangeColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Tilapia diseases
            Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.PrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Image.asset(
                    "images/DSC_2536-removebg-preview.png",
                    width: 190,
                    height: 170,
                  )),
                  TextButton(
                    onPressed: _launchUrl2,
                    child: Text(
                      "Tilapia\ndiseases ",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.PrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),
            //Tilapia diseases treatment
            Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.PrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Image.asset(
                    "images/DSC_2815-removebg-preview.png",
                    width: 190,
                    height: 170,
                  )),
                  TextButton(
                      onPressed: _launchUrl,
                      child: Text(
                        "Tilapia\ndiseases\ntreatment",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.PrimaryColor,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            //other diseases
            Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.PrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Image.asset(
                    "images/other.png",
                    width: 190,
                    height: 170,
                  )),
                  TextButton(
                      onPressed: _launchUrl4,
                      child: Text(
                        "Other\ndiseases",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.PrimaryColor,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      )),
    );
  }

  //treatment
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

//Tilapia diseases
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw Exception('Could not launch $_url2');
    }
  }

  //More info
  Future<void> _launchUrl3() async {
    if (!await launchUrl(_url3)) {
      throw Exception('Could not launch $_url3');
    }
  }

  //other diseases
  Future<void> _launchUrl4() async {
    if (!await launchUrl(_url4)) {
      throw Exception('Could not launch $_url4');
    }
  }
}
