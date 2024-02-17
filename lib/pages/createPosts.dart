import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class sendpost extends StatefulWidget {
  const sendpost({Key? key}) : super(key: key);

  @override
  State<sendpost> createState() => _sendpostState();
}

class _sendpostState extends State<sendpost> {
  TextEditingController _textEditingControllerText = TextEditingController();
  TextEditingController _textEditingControllerLocation = TextEditingController();
  late String _selectedCountry;
  late String _selectedState;
  late String _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Expanded(child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.jpeg"),
              fit: BoxFit.cover
            )
              
            )
          ),
        
        ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              shadowColor: Colors.black,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _textEditingControllerText,
                      decoration: InputDecoration(
                        labelText: 'Text',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _textEditingControllerLocation,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    CSCPicker(
                      layout: Layout.vertical,
                      flagState: CountryFlag.ENABLE,
                      onCountryChanged: (country) {
                        setState(() {
                          _selectedCountry = country ?? '';
                        });
                      },
                      onStateChanged: (state) {
                        setState(() {
                          _selectedState = state ?? '';
                        });
                      },
                      onCityChanged: (city) {
                        setState(() {
                          _selectedCity = city ?? '';
                        });
                      },
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",
                      countryDropdownLabel: "Select Country",
                      stateDropdownLabel: "Select State",
                      cityDropdownLabel: "Select City",
                      dropdownDialogRadius: 12.0,
                      searchBarRadius: 30.0,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade800, width: 2),
                      ),
                      disabledDropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade600, width: 2),
                      ),
                      selectedItemStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                      ),
                      dropdownHeadingStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      dropdownItemStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitData,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitData() async {
    Map<String, dynamic> requestBody = {
      'text': _textEditingControllerText.text,
      'location': _textEditingControllerLocation.text,
      'country': _selectedCountry,
      'state': _selectedState,
      'city': _selectedCity,
    };
    String requestBodyJson = jsonEncode(requestBody);

    try {
      final response = await http.post(
        Uri.parse('https://shesecurebackend.onrender.com/postcomplaint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBodyJson,
      );

      if (response.statusCode == 201) {
        print('Data sent successfully');
        print(response.body);
        Navigator.popAndPushNamed(context, "/showpost");
        // Show a success message or navigate to another page
      } else {
        print('Failed to send data: ${response.statusCode}');
        print(response.body);
        // Handle error, show error message
      }
    } catch (e) {
      print('Error sending data: $e');
      // Handle error
    }
  }

  @override
  void dispose() {
    _textEditingControllerText.dispose();
    _textEditingControllerLocation.dispose();
    super.dispose();
  }
}