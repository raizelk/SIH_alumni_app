import 'package:alumni_app_2/wrapper/main_wrapper.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget>[
                    // Fullscreen image
                    Positioned.fill(
                        child: Image.asset(
                            "assets2/download.jpeg",
                            fit: BoxFit.cover,
                        ),
                    ),
                    // Content overlaid on the image
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                //Image.asset("assets2/Wallpaper.jpeg", height: 50),
                                Row(
                                    children: <Widget>[
                                        const Text(
                                            " ALMA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 55,
                                                fontWeight: FontWeight.w800,
                                            ),
                                        ),
                                        Text(
                                            "LINK",
                                            style: TextStyle(
                                                color: Colors.blue[400],
                                                fontSize: 55,
                                                fontWeight: FontWeight.w800,
                                            ),
                                        ),
                                    ],
                                ),
                                const SizedBox(height: 14),
                                const Text(
                                    "There's a lot happening around you. Our mission is to provide a network of great alumni to you.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                    ),
                                ),
                                const SizedBox(height: 14),
                                GestureDetector(
                                    onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MainWrapper(),
                                            ),
                                        );
                                    },
                                    child: Container(
                                        child: const Row(
                                            children: <Widget>[
                                                Text(
                                                    "Get Started",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                    ),
                                                ),
                                                SizedBox(width: 5),
                                                Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.white,
                                                ),
                                            ],
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
}