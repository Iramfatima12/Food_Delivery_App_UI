import 'package:flutter/material.dart';
import 'Signin.dart';
void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFE724F),
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: DipShapeClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'The best ',
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'food',
                                style: TextStyle(
                                  color: Color(0xFFFE724C),
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "delivery service",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset('assets/images/img.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // This centers the Column itself.
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Define what happens when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust padding for internal spacing
                        minimumSize: Size(60, 60), // Specify minimum size of the button
                      ),
                      child: SizedBox(
                        width: 200, // Specify the exact width of the button
                        height: 30, // Specify the exact height of the button
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding
                          children: [
                            Text('SignUP', style: TextStyle(fontSize: 20,color: Color(0xFFFE724C))), // Your button text
                            Spacer(), // This will push the image to the end of the button
                            Image.asset('assets/images/arrow.png', width: 24, height: 24), // Your image/icon
                            // If you prefer an icon, replace the above line with:
                            // Icon(Icons.your_icon, size: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Spacing between buttons
                    ElevatedButton(
                      onPressed: () {

                        // navigate to sign in page
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Signin()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust padding for internal spacing
                        minimumSize: Size(60, 60), // Specify minimum size of the button
                      ),
                      child: SizedBox(
                        width: 200, // Specify the exact width of the button
                        height: 30, // Specify the exact height of the button
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding
                          children: [
                            Text('Sign in', style: TextStyle(fontSize: 20,color: Color(0xFFFE724C))), // Your button text
                            Spacer(), // This will push the image to the end of the button
                            Image.asset('assets/images/arrow.png', width: 24, height: 24), // Your image/icon
                            // If you prefer an icon, replace the above line with:
                            // Icon(Icons.your_icon, size: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class DipShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.width); // Start from the bottom left corner

    // Define the dip in the middle
    var controlPoint = Offset(size.width / 8, size.height - 0); // Control point for curve
    var endPoint = Offset(size.width, size.height); // End point for curve
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0); // Move to the top right corner
    path.close(); // Close the path to form a shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}