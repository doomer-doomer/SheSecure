import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import the dart:convert library


class signup_page extends StatefulWidget {
  const signup_page({Key? key}) : super(key: key);

  @override
  _signup_pageState createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> signup() async {
    Map<String, dynamic> requestBody = {
  'name': _nameController.text,
  'email': _emailController.text,
  'number': _numberController.text,
  'password': _passwordController.text,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Fill the below details to complete your registration.",style: Theme.of(context).textTheme.titleMedium,),
              TextFormField(
                
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name',prefixIcon: Icon(Icons.person,  color: Colors.blueAccent)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email, color: Colors.blueAccent,)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numberController,
                
                decoration: InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone, color: Colors.blueAccent)),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.password, color: Colors.blueAccent )),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
 if (_formKey.currentState!.validate()) {
                    signup();
                  }
        },
        child: Icon(Icons.verified,  color: Colors.blueAccent),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: signup_page(),
  ));
}
