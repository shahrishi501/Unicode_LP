import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth.dart';
import 'package:flutter_application_1/splashscreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailcontroller.text, password: passwordcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book-It"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
      
      
                SizedBox(child: Image.asset("assets/644269.png")),
      
                SizedBox(height: 20,),
                !isLogin
                    ? TextFormField(
                        key: ValueKey('username'),
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          hintText: 'username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter full name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            username = value!;
                          });
                        },
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: ValueKey('email-id'),
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'email-id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter @gmail.com';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  key: ValueKey('password'),
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please enter password of min length 6';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                          }
                          signUpUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreen()),
                          );
                        },
                        child: isLogin ? Text('Login') : Text('Signup'))),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
      
                    },
                    child: isLogin
                        ? Text("Don't have an account? Signup")
                        : Text('Already signed up?Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
