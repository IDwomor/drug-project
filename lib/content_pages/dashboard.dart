import 'package:flutter/material.dart';
import 'package:updated_drug_app/content_pages/profile.dart';
import 'package:updated_drug_app/content_pages/qr_code/qr_homepage.dart';

import 'about.dart';
import 'barcode.dart';
import 'help.dart';
import 'history.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var height, width;

  List imageData = [
    "assets/dashboard_images/qrcode.png",
    "assets/dashboard_images/barcode.png",
    "assets/dashboard_images/profile.png",
    "assets/dashboard_images/history.png",
    "assets/dashboard_images/help.png",
    "assets/dashboard_images/about.png"
  ];

  List titles = [
    "QR Code",
    "Bar Code",
    "Profile",
    "History",
    "Help",
    "About"
  ];

  /*List navigatePages = [
    const QrCode(),
    const Barcode(),
    const Profile(),
    const History(),
    const Help(),
    const About()
  ];*/

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QrCode()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Barcode()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const History()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Help()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const About()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff691d2b),
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: height * 0.20,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 15, right: 15),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            height: 40,
                            width: 40,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.person, color: Color(0xffd7d7d7))
                              /*const Image(
                                image: AssetImage("assets/icons/user_icon.png"),
                              ),*/
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dashboard",
                            style: TextStyle(
                                color: Color(0xffd7d7d7),
                                fontSize: 20,
                                fontFamily: 'FiraSans',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffd7d7d7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                //height: height,
                width: width,
                padding: const EdgeInsets.only(bottom: 38),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                  shrinkWrap: true,
                  itemCount: imageData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToPage(context, index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffd7d7d7),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /*IconButton(
                              onPressed: pageNavigation,
                              icon: Image(
                                image: AssetImage(imageData[index]),
                              ),
                            ),*/
                            Image.asset(imageData[index],
                            color: const Color(0xff691d2b),
                            width: 100,
                            ),
                            Text(titles[index],
                            style: const TextStyle(
                                color: Color(0xff691d2b),
                                fontSize: 20,
                                fontFamily: 'FiraSans',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
