import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // Import your app theme file

class NextPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 35.v),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                        vertical: 33.v,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0B8816),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10), // Add spacing between text and list
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.v), // Add a gap below the container
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E2E2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 20, // Adjust font size as needed
                            color: Colors.black, // Default text color
                          ),
                          children: [
                            TextSpan(
                              text: "About\n", // Add a line break here
                              style: TextStyle(
                                fontSize: 28, // Custom font size for heading
                                color: Color(0xFF0B8816), // Green color for heading
                                decoration: TextDecoration.underline, // Underline for heading
                                fontWeight: FontWeight.bold, // Make the text bold
                              ),
                            ),
                            // Use an empty TextSpan with specified height to create a gap

                            TextSpan(
                              text: "Lingua Touch ",
                              style: TextStyle(
                              ),
                            ),
                            TextSpan(
                              text: "allows you to quickly read handwritten or printed paper Braille text using a smartphone",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10), // Add spacing between text and list
                      Text(
                        "1. Take a photo\n"
                            "2. Get the recognition results as:\n"
                            "• recognized text in braille characters,\n"
                            "• text in ordinary (flat-printed) letters,\n"
                            "• images with the signed meaning of each braille character.\n"
                            "3. read",
                        style: TextStyle(
                          fontSize: 17, // Adjust font size as needed
                          color: Colors.black, // Changed text color to black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add another container as a child of the existing container
              SizedBox(height: 40.v), // Add a gap below the container
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E2E2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "For whom it is intended", // Add the heading text
                        style: TextStyle(
                          fontSize: 20, // Adjust font size as needed
                          color: Color(0xFF0B8816), // Green color for heading
                          fontWeight: FontWeight.bold, // Make the heading bold
                        ),
                      ),
                      SizedBox(height: 10), // Add spacing below the heading
                      Text(
                        "• teachers working with blind students,\n"
                            "• parents and relatives of blind people,\n"
                            "• any people who communicate with the blind and who need to read the text in Braille.",
                        style: TextStyle(
                          fontSize: 16, // Adjust font size as needed
                          color: Colors.black, // Default text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ], // This is where the missing bracket is added
          ),
        ),
      ),
    );
  }
}
