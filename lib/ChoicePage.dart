import 'package:flutter/material.dart';
import 'package:navium/DestinationPage.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChoicePage> {
  String selectedRole = '';

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox()),
                  const Text(
                    "Choose your role",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B4BFA),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roleOption(
                        title: "Bus Passenger",
                        imagePath: "assets/images/passenger.jpg",
                        isSelected: selectedRole == "passenger",
                        onTap: () => selectRole("passenger"),
                      ),
                      const SizedBox(width: 20),
                      roleOption(
                        title: "Driver",
                        imagePath: "assets/images/driver.jpg",
                        isSelected: selectedRole == "driver",
                        onTap: () => selectRole("driver"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        selectedRole.isEmpty
                            ? null
                            : () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => DestinationPage(role: selectedRole),
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
                      backgroundColor: const Color(0xFF4B4BFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget roleOption({
    required String title,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDFDFFF) : Colors.white,
          border: Border.all(color: const Color(0xFF4B4BFA), width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 100),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4B4BFA),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
