import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // Import your app theme file

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700, // Use appTheme here
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 35.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              Row( // Wrap Container with Row
                mainAxisSize: MainAxisSize.max, // Ensure Row takes full width
                children: [
                  Expanded( // Use Expanded to stretch Container
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                        vertical: 33.v,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0B8816), // Set color to #0b8816
                        borderRadius: BorderRadius.circular(10), // Add border radius
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
                          // Add your container content here
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.v), // Add a gap below the container
              Text(
                "How to take a photo in a proper way", // New line of text
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Adjust the font weight as needed
                  color: Colors.black, // Adjust the color as needed
                ),
              ),

              SizedBox(height: 20.v), // Add a gap below the container
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0), // Add left and right padding
                child: Text(
                  "To get a satisfactory result, you need to follow a few simple rules:", // Moved outside the container
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size as needed
                    color: Colors.black87, // Adjust the color as needed
                  ),
                ),
              ),

              SizedBox(height: 20.v), // Add a gap below the "How to take a photo in a proper way" text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0), // Add left and right padding
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E2E2), // Set color to #e2e2e2
                    borderRadius: BorderRadius.circular(10), // Add border radius
                  ),
                  padding: EdgeInsets.all(16.0), // Add padding for spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1. The light should fall from the (upper) side of the sheet farthest from you and give a contrasting image of points with light and shadow.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "2. The sheet should be photographed from above.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "3. Resolution of atleast 1000 points vertically and horizontally (photos from most smartphones and cameras are suitable).",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.v), // Add a gap below the text
              Row(
                children: [
                  SizedBox(width: 20.h), // Add initial spacing
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/photo1.jpg',
                          fit: BoxFit.cover, // Adjust the fit as needed
                          height: 200, // Set the image height as needed
                        ),
                        Text(
                          "Right",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.h), // Add spacing between images
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/photo2.jpg',
                          fit: BoxFit.cover, // Adjust the fit as needed
                          height: 200, // Set the image height as needed
                        ),
                        Text(
                          "Wrong",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.h), // Add spacing between images
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/photo3.jpg',
                          fit: BoxFit.cover, // Adjust the fit as needed
                          height: 200, // Set the image height as needed
                        ),
                        Text(
                          "Wrong",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.h), // Add final spacing
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
