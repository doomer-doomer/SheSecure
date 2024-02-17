import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int _selectedIndex = 0;

  tapped(int index){
    setState(() {
      _selectedIndex = index;
    });

    if(index==0){
      Navigator.pushNamed(context, "/home");
    }

    if(index==1){
      Navigator.pushNamed(context, '/map');
    }
    if (index==2){
      Navigator.pushNamed(context, '/phone');
    }

    if(index==3){
      Navigator.pushNamed(context, '/showpost');
    }

  }

  void sendSOS() async{
    final response = await http.get(
        Uri.parse('https://shesecurebackend.onrender.com/sos'));
       
      if(response.statusCode == 200){
          Fluttertoast.showToast(
                      msg: "SOS sent successfully!",
                      toastLength: Toast.LENGTH_LONG, // Duration for which the toast is visible (Toast.LENGTH_SHORT or Toast.LENGTH_LONG)
                      gravity: ToastGravity.TOP_LEFT, // Position of the toast message on the screen (ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM)
                      backgroundColor: Colors.white, // Background color of the toast message
                      textColor: Colors.black, // Text color of the toast message
                      fontSize: 16.0, // Font size of the toast message
                    );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          
         Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/homemain.png"),
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                
                ),
              ),
             
              Positioned(
                bottom: 50,
                
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                  padding: EdgeInsets.all(18),
                  child: Column(
                    
                    children: [
                      Text("Unleash the power within.",style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent
                                    ),),
                                    SizedBox(height: 10,),
                      Text("Get personalised assistance from our Machine Learning Algorithms."),
                      SizedBox(height: 40,)
                    ],
                  ),
                ),
              ),
              
              
              
              
              

        
            ],
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
                child: IconButton(
                  icon: Icon(Icons.sos, color: Colors.red,),
                  onPressed: (){
                    

                  },
                ),
              )
            
          )
        ],
        
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
              Navigator.pushNamed(context, '/phone');
          },child: Icon(Icons.add,color: Colors.orangeAccent,),
        ),
        
      
       bottomNavigationBar: 
       
       Container( // Wrap BottomNavigationBar with Container
        color: Colors.orangeAccent,
       
        
        child: BottomNavigationBar(
      
          backgroundColor: Colors.orangeAccent, // Set the background color of the navigation bar
        selectedItemColor: Colors.white, // Set the selected item color
        unselectedItemColor: Colors.white54, // Set the unselected item color
        selectedLabelStyle: TextStyle(color: Colors.yellow),
          items: [
            BottomNavigationBarItem(
              
              
              label: "Home",
              icon: Icon(Icons.home),
              backgroundColor: Colors.orangeAccent
              
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add, ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: tapped,
        ),
    ));
     
  }
}
