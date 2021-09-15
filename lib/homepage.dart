//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'uidesign.dart';


// void main() {
//   runApp(const PlantoHomepage());
// }


class PlantoHomepage extends StatelessWidget {
  final GoogleSignInAccount user;
  const PlantoHomepage({
    Key? key,
    required this.user,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant-O',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  MyHomePage(user:user),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final GoogleSignInAccount user;
  MyHomePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
          children:[
            ElevatedButton(
                onPressed: (){

                },
                child: const ListTile(
                  leading:Icon(
                    Icons.info,

                  ),
                  title: Text("About"),
                ),
            ),
            ElevatedButton(
              onPressed: (){

              },
              child: const ListTile(
                leading:Icon(
                  Icons.settings,

                ),
                title: Text("Settings"),
              ),
            ),

            ElevatedButton(
              onPressed: (){

              },
              child: const ListTile(
                leading:Icon(
                  Icons.update,

                ),
                title: Text("Check for updates"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text(
          "Plant-O",
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined,size: 40.0),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => ProfileUI2(user: user,),
              ));
            },
          ),
        ],
      ),

        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/Forest 05.jpg"),
                  fit: BoxFit.cover,
                ),
               ),
        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      'assets/planto_logo.jpeg',
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Column(
                    children:  [
                      Text(
                        user.displayName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        '$Location',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: const Divider(
                  color: Colors.grey,
                  height: 70,
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  style:  ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.green)
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => const EventCreation(),
                    ),
                    );
                  },
                  child: Container(
                    color: Colors.green,

                    child: const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Create Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  style:  ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.green)
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => const JoinEvent(),
                    ));
                  },
                  child: Container(
                    color: Colors.green,

                    child: const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Join Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  style:  ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.green)
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => const CurrentEvent(),
                    ));
                  },
                  child: Container(
                    color: Colors.green,

                    child: const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.event,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Current Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  style:  ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.green)
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => const PastEvent(),
                    ));
                  },
                  child: Container(
                    color: Colors.green,

                    child: const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.event_note,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Past Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}





class EventCreation extends StatefulWidget {
  const EventCreation({Key? key}) : super(key: key);

  @override
  _EventCreationState createState() => _EventCreationState();
}

class _EventCreationState extends State<EventCreation> {


    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Event creation '),
          backgroundColor: Colors.green[700],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:const GoogleMap(
            initialCameraPosition: CameraPosition(
              target:LatLng(22.5448131,88.3403691),
              zoom:15,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ),
      ),
    );
  }
}

class JoinEvent extends StatefulWidget {
  const JoinEvent({Key? key}) : super(key: key);

  @override
  _JoinEventState createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Join event'),
          backgroundColor: Colors.green[700],
        ),
        body:const GoogleMap(
          initialCameraPosition: CameraPosition(
            target:LatLng(22.5448131,88.3403691),
            zoom:15,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }
}

class CurrentEvent extends StatefulWidget {
  const CurrentEvent({Key? key}) : super(key: key);

  @override
  _CurrentEventState createState() => _CurrentEventState();
}

class _CurrentEventState extends State<CurrentEvent> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
          children: [
      Expanded(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

      Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: const Text(
        'Sharma ji ki colony',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
        Text(
        'your city, India',
        style: TextStyle(
        color: Colors.grey[500],
    ),
    ),
    ],
    ),
    ),

    Icon(
    Icons.account_circle,
    color: Colors.red[500],

    ),
    const Text('41'),
    ],
    ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
    );

    Widget textSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
    "Let's Plant for a better tomorrow" ,
    softWrap: true,
    ),
    );

    return MaterialApp(
    title: 'Current Events',
    home: Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text("Current Events"),
      backgroundColor: Colors.green,
    ),
    body: ListView(
    children: [
    Image.network('https://460354.smushcdn.com/2386983/wp-content/uploads/2019/11/Tree-planting-29-11.jpg?lossy=0&strip=1&webp=1',
    width: 600,
    height: 240,
    fit: BoxFit.cover,
    ),
    titleSection,
    buttonSection,
    textSection,
    ],
    ),
    ),
    );
  }








  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class PastEvent extends StatefulWidget {
  const PastEvent({Key? key}) : super(key: key);

  @override
  _PastEventState createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Past events'),
          backgroundColor: Colors.green[700],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:  [
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                  color: Colors.yellow,
                elevation: 5,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  overflow: TextOverflow.fade ,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
                const Text(
                  "Event - name\nDate:DD-MM-YYYY",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Card(
                    color: Colors.yellow,
                    elevation: 5,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      overflow: TextOverflow.fade ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1.5,
                  ),
                ),
             ],
            ),
          ),
        )
      ),
    );
  }
}
