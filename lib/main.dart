import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}
class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}
class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/planto_logo.jpeg'),
                      radius:70.0,
                    ),
                  ),

                ),

            const SizedBox(height: 20,),
            ElevatedButton.icon(
                style:ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: const Size(double.infinity,50),
                ) ,
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: const Text(
                    'Sign Up with Google',
                     style: TextStyle(
                       fontSize: 18.0,
                       fontWeight: FontWeight.bold,
                     ),
                ),
                onPressed: ()async{
                  final user = await GoogleSignInApi.login();

                  if(user == null){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Sign in Failed')));
                  }else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context)=>PlantoHomepage(user: user),
                    ));
                  }
                },
            ),

             Padding(
              padding: const EdgeInsets.fromLTRB(5.0,5.0,5.0,0.0),
              child: Center(
                child: Container(
                  width: 200,
                  height:200,
                  decoration:  const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/login_page_img.jpeg'),
                      fit: BoxFit.cover,
                    ),

                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  width: 300,
                  height:300,
                  decoration:  const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/login_page_flower.jpeg'),
                      fit: BoxFit.fitWidth,
                    ),

                  ),

                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}



class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout()=> _googleSignIn.disconnect();
}

