import 'package:flutter/material.dart';

void main() {
  runApp(Signin());
}

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 1.2, // Adjust height to fit image and card
                  color: Color(0xFFFE724F),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 400, // Set desired height
                            width: 600, // Set desired width
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
                                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                                  children: <Widget>[
                                    SizedBox(height: 20), // Add spacing
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30), // Add spacing between text fields
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 40), // Add spacing before button
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFE724C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/food_man.jpg', // Replace with your image path
                            height: 600, // Set desired height
                            width: 600, // Set desired width
                            fit: BoxFit.cover, // Ensure the image fits perfectly
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var controlPoint = Offset(size.width / 4, size.height);
    var endPoint = Offset(size.width / 2, size.height - 30);
    path.lineTo(0, size.height - 50); // Start from the left bottom corner
    // Create a simple curve from left to middle
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    // Create a mirror curve from middle to right
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0); // Go to the top right corner
    path.close(); // Close the path to the starting point
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}