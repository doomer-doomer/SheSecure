import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final storage = new FlutterSecureStorage();
  
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var val1;
  var val2;
  @override
  void initState() {
    
    super.initState();

    
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> login() async {
var value = await storage.read(key: "email");
    var value2 = await storage.read(key: "password");
    Map<String, dynamic> requestBody = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };
    String requestBodyJson = jsonEncode(requestBody);
    try {
      final response = await http.post(
        Uri.parse('https://shesecurebackend.onrender.com/authe/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBodyJson,
      );

      if (response.statusCode == 200) {
        // Login successful
        await storage.write(key: "email", value: _emailController.text);
        await storage.write(key: "password", value: _passwordController.text);
        print('Login successful');
        print(response.body);
        // Navigate to the next screen or perform any other actions
      } else if (response.statusCode == 401) {
        // Invalid credentials
        print('Invalid credentials');
        print(response.body);
        // Show error message to the user
      } else {
        // Other error
        print('Error occurred: ${response.statusCode}');
        print(response.body);
        // Show error message to the user
      }
    } catch (e) {
      print('Error occurred: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFE8E2E4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60,),
                Text("SheSecure",style: Theme.of(context).textTheme.headlineMedium,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/login.jpg',
                    width: 390,
                    height: 260,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
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
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
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
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      //login();
                      Navigator.popAndPushNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please fill all fields'),
                      ));
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                                        
                                      padding: EdgeInsets.symmetric(
                                           horizontal: 80, // Increase horizontal padding
      vertical: 25,   // Increase vertical padding
                                          ),
                                      shadowColor: Color(0xee715d),
                                      backgroundColor: Color(0xFFEC715D),
                                      textStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white
                                      ),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                  ),
                ),
                TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/signup');
                }, child: Text("Dont have an account yet?"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: login_page(),
  ));
}
