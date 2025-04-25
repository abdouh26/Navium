import 'package:flutter/material.dart';
import 'package:navium/FinalPage.dart';

class Lines extends StatelessWidget {
  final List<Map<String, dynamic>> lines = [
    {'code': 'A03', 'time': 3},
    {'code': 'B12', 'time': 5},
    {'code': 'C01', 'time': 10},
    {'code': 'A02', 'time': 12},
    {'code': 'B03', 'time': 17},
    {'code': 'C10', 'time': 21},
    {'code': 'A07', 'time': 25},
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
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                        text: 'Melissa Hotel',
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
                  'assets/images/map.jpg',
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
                        'The disponible lines',
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
                      itemCount: lines.length,
                      itemBuilder: (context, index) {
                        final line = lines[index];
                        return ListTile(
                          leading: Icon(
                            Icons.directions_bus,
                            color: Color(0xFF2A44D9),
                          ),
                          title: Text(
                            line['code'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          subtitle: Text(
                            'Arrives to your station in ${line['time']} minutes',
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
