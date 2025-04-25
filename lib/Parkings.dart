import 'package:flutter/material.dart';
import 'package:navium/FinalPage.dart';

class Parkings extends StatelessWidget {
  final List<Map<String, dynamic>> parkings = [
    {'name': 'Public Parking', 'spots': 5, 'distance': '500 m'},
    {'name': 'Hotel Parking', 'spots': 2, 'distance': '700 m'},
    {'name': 'Hotel melissa Parking', 'spots': 4, 'distance': '700 m'},
    {'name': 'Placed’armes Parking', 'spots': 11, 'distance': '900 m'},
    {'name': 'Public Parking', 'spots': 8, 'distance': '950 m'},
    {'name': 'Private Parking', 'spots': 9, 'distance': '1.1 km'},
    {'name': 'Hotel Parking', 'spots': 4, 'distance': '1.3 km'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xFFDCE0FF),
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                width: double.infinity,
                child: RichText(
                  text: TextSpan(
                    text: 'Going to\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Raleway",
                    ),
                    children: [
                      TextSpan(
                        text: 'La gare d’oran',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 22,
                          color: Color(0xFF2A44D9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/parkingmap.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    FinalPage(),
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
                      child: Text(
                        'The disponible parkings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: parkings.length,
                      itemBuilder: (context, index) {
                        final parking = parkings[index];
                        return ListTile(
                          leading: Icon(
                            Icons.local_parking,
                            color: Color(0xFF2A44D9),
                          ),
                          title: Text(
                            parking['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          subtitle: Text(
                            '${parking['spots'].toString().padLeft(2, '0')} empty spots',
                          ),
                          trailing: Text(
                            parking['distance'],
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        );
                      },
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
