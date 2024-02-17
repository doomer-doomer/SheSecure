
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


//import 'package:latlng/latlng.dart';
//import 'package:geocoding/geocoding.dart';
//import 'package:geolocator/geolocator.dart' as Geolocator;


class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
   MapboxMap? mapboxMap;
   
  String source="Thakur College of Engineering and Technology";
String destination = "Destination";

  var scr = (19.210183, 72.865567);
  var dest = (19.0742509,72.8995141);
 
CameraOptions _cameraOptions = CameraOptions(
    center: Point(coordinates: Position(19.210183, 72.865567)).toJson(),
    zoom: 5.0,
  );
  
  @override
  void initState()  {
    _requestLocationPermissions();
    
    super.initState();
   
  }



  @override
  void dispose() {
    super.dispose();
  }

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    
  }

  void _requestLocationPermissions() async {
  // Check if location permission is already granted
  var test = await Permission.location.request();
  var status = await Permission.location.status;

  
  if (status != status.isGranted) {

    // Request location permission if not granted
    status = await Permission.location.request();
    if (status == status.isGranted) {
     
      // Location permission granted, perform actions as needed
      
      print('Location permission granted');
    } else {
      // Location permission denied
      
   
      print('Location permission denied');
      // Show a dialog or snackbar to inform the user and provide guidance
      
    }
  } else {
    // Location permission already granted
    print('Location permission already granted');
    
    
  }
}
      
  
 


  

  Widget _show() {
    return TextButton(
      child: Text('show location'),
      onPressed: () {
        setState(() {
          mapboxMap?.location.updateSettings(LocationComponentSettings(enabled: true));
        });
         mapboxMap?.location.updateSettings(LocationComponentSettings(enabled: true));
        
      
      },
    );
  }

  Widget _showPulsing() {
    return TextButton(
      child: Text('show pulsing'),
      onPressed: () {
        mapboxMap?.location
            .updateSettings(LocationComponentSettings(pulsingEnabled: true));
      },
    );
  }

  Widget _setCamera() {
    return TextButton(
      child: Text('setCamera'),
      onPressed: () {
        mapboxMap?.setCamera(CameraOptions(
            center: Point(
                coordinates: Position(
              0.381457,
              6.687337,
            )).toJson(),
            padding: MbxEdgeInsets(top: 1, left: 2, bottom: 3, right: 4),
            anchor: ScreenCoordinate(x: 1, y: 1),
            zoom: 3,
            bearing: 20,
            pitch: 30,
            ),
            );
      },
    );
  }



  Widget _showAccuracy() {
    return TextButton(
      child: Text('show accuracy'),
      onPressed: () {
        setState(() {
       mapboxMap?.flyTo(
    CameraOptions(
        center: Point(coordinates: Position(-80.1263, 25.7845)).toJson(),
        zoom: 5,
        bearing: 180,
        pitch: 30),
    MapAnimationOptions(duration: 4000, startDelay: 0));
    });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
final MapWidget mapWidget = MapWidget(
  key: ValueKey("mapWidget"), 
  onMapCreated: _onMapCreated, 
  
  resourceOptions: ResourceOptions(accessToken: "pk.eyJ1Ijoic3VtZWV0bWF1cnlhIiwiYSI6ImNsc29mYnBrZDBkanQya3A5dW5naTFqbXUifQ.Iy3I-01e3GrkVdSYdCLF2w"),
  cameraOptions: CameraOptions(
      center: Point(coordinates: Position(72.8746185, 19.2061932)).toJson(),
      zoom: 14.0,
      
      ),
  );
    
    return Scaffold(
      body: Stack(
        children: [

          Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
            SizedBox(
                width: double.infinity,
                height: 847,
                child: mapWidget
                
                
          ),
        
          
            
          
        ],
        
            ),
            
            
            
            Positioned(
            top: 40,
            left: 20,
            width: 350,
            child: Container(
              width: 350,
              padding: EdgeInsets.all(
                5
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  IconButton(
                    
                    icon: Icon(Icons.home,color: Colors.blueAccent,),
                    
                    onPressed: () {
                      showSearch(context: context, delegate: CustomSearchDelegate(
                        setSource: (String source) {
                          // Set the source
                          setState(() {
                            this.source = "Thakur College of Engineering and Technology";
                          });
                        },
                        setDestination: (String destination) {
                          // Set the destination
                          setState(() {
                            this.destination = destination;
                          });
                        },
                      ));
                    },

                  ),
                  Expanded(child: Text(source, style: TextStyle(fontSize: 16,color: Colors.black38),overflow: TextOverflow.ellipsis,))
                 
                ],
              ),
            ),
        ),

        Positioned(
            top: 110,
            left: 20,
            width: 350,
            child: Container(
              width: 350,
              
              padding: EdgeInsets.all(
                5
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  IconButton(
                    
                    icon: Icon(Icons.pin_drop,color: Colors.blueAccent,),
                    
                    onPressed: () {
                      showSearch(context: context, delegate: CustomSearchDelegate(
                        setSource: (String source) {
                          // Set the source
                          setState(() {
                            this.source = "Thakur College of Engineering and Technology";
                          });
                        },
                        setDestination: (String destination) {
                          // Set the destination
                          setState(() {
                            this.destination = destination;
                          });
                        },
                      ));
                    },

                  ),
                  Expanded(child: Text(destination, style: TextStyle(fontSize: 16,color: Colors.black38),overflow: TextOverflow.ellipsis,))
                 
                ],
              ),
            ),
        ),
        
        Positioned(
            bottom: 30,
            right: 20,
            child: Container(
              padding: EdgeInsets.only(
                right: 10
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_next,color: Colors.blueAccent,),
                    onPressed: () {
                      
                      _showAccuracy();
                    },
                    
                  ),
                  Text("Locate Now",style: TextStyle(color: Colors.blueAccent),)
                 
                ],
              ),
            ),
            
        ),
        
        
 
      
        ],
        
        
      ),
      
      
        
    );
  }
}
class CustomSearchDelegate extends SearchDelegate<String> {

  final Function(String) setSource;
  final Function(String) setDestination;

    CustomSearchDelegate({required this.setSource, required this.setDestination});

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the app bar (e.g., clear query button)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar (e.g., back button)
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context,"");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results based on the search query
    return Center(
      child: Text('Search Results for: $query'),
    );
  }

  @override
Widget buildSuggestions(BuildContext context) {
  // Suggestions based on the search query
  return FutureBuilder(
    future: searchPlace(query),
    builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        final List<Map<String, dynamic>> suggestions = snapshot.data!;
        final List<String> suggestionNames = suggestions.map((suggestion) => suggestion['name'] as String).toList();
        return ListView.builder(
          itemCount: suggestionNames.length,
          itemBuilder: (BuildContext context, int index) {
            final String suggestion = suggestionNames[index];
            return ListTile(
              leading: Icon(Icons.location_city),
              title: Text(suggestion),
              onTap: () {
                setSource(suggestion);
                  setDestination(suggestion);
                close(context, suggestion);
              },
            );
          },
        );
      }
    },
  );
}

  Future<List<Map<String, dynamic>>> searchPlace(String query) async {
    final String apiKey = 'pk.eyJ1Ijoic3VtZWV0bWF1cnlhIiwiYSI6ImNsc29mYnBrZDBkanQya3A5dW5naTFqbXUifQ.Iy3I-01e3GrkVdSYdCLF2w';
    final String apiUrl = 'https://api.mapbox.com/search/searchbox/v1/suggest?limit=5&session_token=5a487399-9c66-4a07-8177-d43496324ab9&country=IN&access_token=pk.eyJ1Ijoic3VtZWV0bWF1cnlhIiwiYSI6ImNsc29mYnBrZDBkanQya3A5dW5naTFqbXUifQ.Iy3I-01e3GrkVdSYdCLF2w&q=$query?language=en';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> suggestions = data['suggestions'];
      final List<Map<String, dynamic>> parsedSuggestions = suggestions.cast<Map<String, dynamic>>();
      return parsedSuggestions;
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  
}






