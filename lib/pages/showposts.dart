import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csc_picker/csc_picker.dart';

class showposts extends StatefulWidget {
  const showposts({Key? key});

  @override
  State<showposts> createState() => _showpostsState();
}

class _showpostsState extends State<showposts> {
  List<Map<String, dynamic>> _posts = [];
  late String _selectedCountry;
  late String _selectedState;
  late String _selectedCity;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://shesecurebackend.onrender.com/complaints'));

      if (response.statusCode == 200) {
        setState(() {
          _posts = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading posts: $error');
    }
  }

  Future<void> _filterPosts(Param , value) async {
    try {
      final response = await http.get(Uri.parse('https://shesecurebackend.onrender.com/post/filterCom?param=${Param}&value=${value}'));

      if (response.statusCode == 200) {
        setState(() {
          _posts = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading posts: $error');
    }
  }


  Future<void> _sendReport(String postId) async {
    // Implement your report logic here
    print('Sending report for post ID: $postId');

    try {
      final response = await http.patch(
        Uri.parse('https://shesecurebackend.onrender.com/post/update/$postId'),
        body: jsonEncode({'id': postId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Post reported successfully');
        // Add any further actions you want to take after reporting a post
      } else {
        print('Failed to report post: ${response.statusCode}');
        // Handle the error or display a message to the user
      }
    } catch (error) {
      print('Error sending report: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Column(
        children: [
         CSCPicker(
  layout: Layout.vertical,
  flagState: CountryFlag.ENABLE,
  onCountryChanged: (country) {
    setState(() {
      _selectedCountry = country ?? '';
      _filterPosts('country' , _selectedCountry);

    });
  },
  onStateChanged: (state) {
    setState(() {
      _selectedState = state ?? '';
      _filterPosts('state' , _selectedState);
    });
  },
  onCityChanged: (city) {
    setState(() {
      _selectedCity = city ?? '';
      _filterPosts('city' , _selectedCity);
    });
  },
  countrySearchPlaceholder: "Country",
  stateSearchPlaceholder: "State",
  citySearchPlaceholder: "City",
  countryDropdownLabel: "Select Country",
  stateDropdownLabel: "Select State", // Make sure this is enabled
  cityDropdownLabel: "Select City", // Make sure this is enabled
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
),         Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(post['text']),
                        subtitle: Text(
                          '${post['location']}, ${post['city']}, ${post['state']}, ${post['country']}',
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text('Report'),
                              value: 'report',
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'report') {
                              print('Selected post ID: ${post['_id']}'); // Check the post ID before sending the report
                              if (post['_id'] != null) {
                                final id = post['_id']['\$oid']; // Extracting the ObjectId as a String
                                print('Selected post ID: $id'); // Check the post ID before sending the report
                                _sendReport(id);
                              } else {
                                print('Post ID is null');
                              }
                            }
                          },
                        ),
                      ),
                      post['photo'].isEmpty
                          ? Image.network(
                              'https://media.istockphoto.com/id/1445672418/vector/young-woman-showing-stop-gesture-against-violence-stop-violence-concept.jpg?s=612x612&w=0&k=20&c=PEqMf9dlKGq2S9PmLrfcXFkL0lj6Aqt95MMX24szGqc=',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              post['photo'],
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: showposts(),
  ));
}
