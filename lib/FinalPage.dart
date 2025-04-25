import 'package:flutter/material.dart';
import 'package:navium/ChoicePage.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFF5B55D4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            right: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9F2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Trip done Successfully",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5B55D4),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF5B55D4),
                    child: Icon(Icons.check, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "You have arrived to your destination",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ChoicePage(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5B55D4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Choose another destination",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
