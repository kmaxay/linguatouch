import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'NextPage1.dart';
import 'NextPage.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Iphone1415ProMaxOneScreen extends StatefulWidget {
  const Iphone1415ProMaxOneScreen({Key? key}) : super(key: key);

  @override
  _Iphone1415ProMaxOneScreenState createState() =>
      _Iphone1415ProMaxOneScreenState();
}

class _Iphone1415ProMaxOneScreenState
    extends State<Iphone1415ProMaxOneScreen> {
  late File image;
  final TextEditingController responseTextBox = TextEditingController();
  late Map<String, dynamic> responseData = {};

  @override
  void initState() {
    super.initState();
    fetchAlbum(); // Fetch data when the widget is initialized
  }

  fetchAlbum() async {
    final response = await http.get(Uri.parse('http://localhost:8000/'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      setState(() {
        responseData = jsonDecode(response.body) as Map<String, dynamic>;
      });
    } else {
      // Handle error if the server returns an error status code
      print('Failed to load album: ${response.statusCode}');
    }
  }

  Future<void> getImage(bool isCamera) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        // Send the image file to the FastAPI server
        uploadPhoto(image);
      });
    }
  }

  Future<void> uploadPhoto(File photoFile) async {
    // FastAPI server endpoint
    var url = Uri.parse('http://127.0.0.1:8000/upload/');

    var request = http.MultipartRequest('POST', url);
    request.files
        .add(await http.MultipartFile.fromPath('file', photoFile.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Photo uploaded successfully');
      var output = await http.Response.fromStream(response);

      print(output.body);
      responseTextBox.text =  output.body.replaceAll(r'\n', '\n');
    } else {
      print('Failed to upload photo. Status code: ${response.statusCode}');
    }

   /* final FlutterTts flutterTts = FlutterTts();

    final TextEditingController textEditingController = TextEditingController();*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 35),
            child: Column(
              children: [
                _buildColumnQuestionMark(context),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  padding: EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 33,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 340,
                        child: Text(
                          "Upload a photo of the text in Braille:\nimage (jpg,png,etc.)",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NextPage()),
                              );
                            },
                            child: Icon(Icons.help, size: 30),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NextPage()),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How to take a photo ?",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0b8816),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xFF0b8816),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => getImage(true),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(Icons.camera_alt, size: 69),
                                Container(width: 130, height: 130),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => getImage(false), // Call getImage for file picker
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(Icons.folder, size: 69),
                                Container(width: 130, height: 130),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Define what should happen when the image is clicked
                              // For example, you can navigate to another screen or perform some action
                            },
                            child: Image.asset(
                              'assets/images/spk.png', // Replace 'your_image.png' with your image path
                              width: 50, // Adjust width as needed
                              height: 50, // Adjust height as needed
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TAKE A PHOTO",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "UPLOAD FILE",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "YOUR FUNCTION",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: responseTextBox,
                        minLines: 1,
                        maxLines: 10,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Result will appear here',
                        ),
                        onChanged: (value) {
                          // Respond to the user input here
                          // For example, you can update a variable with the input value
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnQuestionMark(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 23),
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage1()),
              );
            },
            child: Icon(Icons.help_outline, size: 23),
          ),
        ],
      ),
    );
  }
}
