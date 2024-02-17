import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import the dart:convert library

class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  late TextEditingController _textController1;
  late FocusNode _textFieldFocusNode1;

  late TextEditingController _textController2;
  late FocusNode _textFieldFocusNode2;

  late TextEditingController _textController3;
  late FocusNode _textFieldFocusNode3;

  late TextEditingController _textController4;
  late FocusNode _textFieldFocusNode4;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _textController1 = TextEditingController();
    _textFieldFocusNode1 = FocusNode();

    _textController2 = TextEditingController();
    _textFieldFocusNode2 = FocusNode();

    _textController3 = TextEditingController();
    _textFieldFocusNode3 = FocusNode();

    _textController4 = TextEditingController();
    _textFieldFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textFieldFocusNode1.dispose();

    _textController2.dispose();
    _textFieldFocusNode2.dispose();

    _textController3.dispose();
    _textFieldFocusNode3.dispose();

    _textController4.dispose();
    _textFieldFocusNode4.dispose();

    super.dispose();
  }

  Future<void> signup() async {
    Map<String, dynamic> requestBody = {
      'name': _textController3.text,
      'email': _textController1.text,
      'number': _textController2.text,
      'password': _textController4.text,
    };
    String requestBodyJson = jsonEncode(requestBody);
    try {
      final response = await http.post(
        Uri.parse('https://shesecurebackend.onrender.com/authe/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBodyJson,
      );

      if (response.statusCode == 201) {
        // Signup successful
        print('Signup successful');
        print(response.body);
        Navigator.pop(context);
        // You can navigate to another page or show a success message
      } else {
        // Signup failed
        print('Signup failed');
        print(response.body);
        // Handle error, show error message
      }
    } catch (e) {
      print('Error occurred: $e');
      // Handle error
    }
  }
@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () => _textFieldFocusNode1.canRequestFocus
        ? FocusScope.of(context).requestFocus(_textFieldFocusNode1)
        : FocusScope.of(context).unfocus(),
    child: Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFE8E2E4),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              // height: 1000,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.network(
                            'https://media.istockphoto.com/id/1295970364/vector/happy-woman-sits-on-the-floor-and-draws-her-arms-to-the-rainbow-smiled-girl-creates-good.jpg?s=612x612&w=0&k=20&c=_OnbBEzbvbVQyx68BVJ69qYN1XzJRGdir5TWj50gsEc=',
                            width: 390,
                            height: 298,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 30, 20, 10),
                                  child: TextFormField(
                                    controller: _textController1,
                                    focusNode: _textFieldFocusNode1,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      // Your validation logic
                                      return null;
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 20, 10),
                                  child: TextFormField(
                                    controller: _textController2,
                                    focusNode: _textFieldFocusNode2,
                                    decoration: InputDecoration(
                                      labelText: 'Number',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      // Your validation logic
                                      return null;
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 20, 10),
                                  child: TextFormField(
                                    controller: _textController3,
                                    focusNode: _textFieldFocusNode3,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      // Your validation logic
                                      return null;
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 20, 10),
                                  child: TextFormField(
                                    controller: _textController4,
                                    focusNode: _textFieldFocusNode4,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      // Your validation logic
                                      return null;
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_textController1.text.isNotEmpty &&
                                          _textController2.text.isNotEmpty &&
                                          _textController3.text.isNotEmpty &&
                                          _textController4.text.isNotEmpty) {
                                        signup();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'Please fill all fields'),
                                        ));
                                      }
                                    },
                                    child: Text('Signup'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 160, vertical: 25),
                                       backgroundColor: Color(0xFFEC715D),
                                      textStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                      ),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}