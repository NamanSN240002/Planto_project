import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
class ProfileUI2 extends StatelessWidget {

  final GoogleSignInAccount user;
  const ProfileUI2({
    Key? key,
    required this.user,
  }) : super(key: key);

  String? check(){
  if(user.photoUrl == null){
    return 'https://www.seekpng.com/png/full/41-410093_circled-user-icon-user-profile-icon-png.png';
  }
  else {
    return user.photoUrl;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/ef/52/fe/ef52fed43d3478bd59f83cb19adcc547.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(check()!),
                    radius: 60.0,
                  ),
                ),


                const SizedBox(
                  height: 30,
                ),
                Card(
                  color: Colors.white70,

                  child: Text(
                    'Name: '+user.displayName!,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color:Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400
                  ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Card(
                  color: Colors.white70,
                  child: Text(
                    "Uttar Pradesh, India"
                    ,style: TextStyle(
                      fontSize: 18.0,
                      color:Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300
                  ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  child: Text(
                    "Email: "+ user.email,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color:Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300
                  ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                    color: Colors.greenAccent,
                    elevation: 2.0,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        child: Text("My Events",style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),))
                ),
                const SizedBox(
                  height: 15,
                ),
                const Card(
                  color: Colors.white70,
                  child: Text(
                    "Student at IIITG"
                    ,style: TextStyle(
                      fontSize: 18.0,
                      color:Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Card(
                  color: Colors.greenAccent,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text("Badges",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600
                                ),),
                              SizedBox(
                                height: 7,
                              ),
                              Text("5",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300
                                ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                          Column(
                            children: const [
                              Text("Events",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600
                                ),),
                              SizedBox(
                                height: 7,
                              ),
                              Text("2",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300
                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: (){

                      },
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.pink,Colors.redAccent]
                          ),
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                          alignment: Alignment.center,
                          child: const Text(
                            "Edit info.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async{
                        await GoogleSignInApi.logout();
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) => const MyApp(),
                        ));
                      },
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.pink,Colors.redAccent]
                          ),
                          borderRadius: BorderRadius.circular(80.0),

                        ),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                          alignment: Alignment.center,
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}