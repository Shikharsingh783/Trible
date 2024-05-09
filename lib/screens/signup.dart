import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trible/auth/auth.dart';
import 'package:trible/screens/NUS1.dart';
import 'package:trible/screens/signin.dart';
import 'package:trible/themes/theme_provider.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final User? user = FirebaseAuth.instance.currentUser;
    final String? uid = user?.uid;

     // Print the UID of the signed-in user
    print("UID: $uid");


      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User Registered"),
          backgroundColor: Color.fromRGBO(0, 244, 145, 1),
        ),
      );

      

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NUS1()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("An account already exists for that email."),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  Future<void> addUserDetails(String name, String email) async {

      // String userId = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("users").add({
      'name': name,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    bool darkMode = themeProvider.isdarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .52),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: darkMode ? const Color.fromRGBO(102, 221, 152, 1) : Colors.black ,
                    fontSize: 32,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .23),
                child: Text(
                  "Create a new account",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.grey.shade800 ,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            
             
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .74),
                child: Text("Email", style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 22)),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 380,
                child: TextFormField(
                  style: TextStyle(color: darkMode ? Colors.black : Colors.white),
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an email";
                    }
                    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!emailRegExp.hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    errorStyle: TextStyle(color: Colors.yellow),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 224, 145, 1))),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .64),
                child: Text("Password", style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 22)),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 380,
                child: TextFormField(
                  style: TextStyle(color: darkMode ? Colors.black : Colors.white),
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 7) {
                      return "Minimum 8 characters required";
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.yellow),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 224, 145, 1))),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    createUserWithEmailAndPassword();
                  }
                },
                child: Container(
                  height: 69,
                  width: 306,
                  decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1), borderRadius: BorderRadius.circular(5)),
                  child: Align(
                    alignment: Alignment.center,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator(color: Colors.black))
                        : const Text(
                            "Create Account",
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Divider(indent: 25, endIndent: 25, thickness: 2, color: Theme.of(context).colorScheme.secondary),

              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => AuthService().signInWithGoogle(),
                child: Container(
                  height: 69,
                  width: 306,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: darkMode ? Colors.white : Colors.black, width: 2)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Continue with google",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w500,fontSize: 20),)
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signin(ontap: () {  },)));
                },
                child: Text(
                  "Already a user? Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.secondary, decoration: TextDecoration.underline, decorationColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
