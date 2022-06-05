import 'package:flutter/material.dart';
import 'package:petzarus/screens/create_profile_screen.dart';
import 'package:petzarus/screens/signin_screen.dart';
import 'package:petzarus/screens/welcome_screen.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String fullname = '';
  String email = '';
  String password = '';
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Create an',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const Text(
                  'Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Create an account and get unlimited access to our app features!',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Full name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: 'Christopher Henry',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {
                      fullname = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Invalid name.';
                      } else if (value.length < 3) {
                        return 'Must be at least 3 characters long.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Email address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: 'yourname@email.com',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textCapitalization: TextCapitalization.none,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Invalid email.';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)) {
                        return 'Invalid email.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        color: Colors.grey,
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      hintText: 'petsareawesome1234',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textCapitalization: TextCapitalization.none,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Invalid password.';
                      } else if (value.length < 3) {
                        return 'Must be at least 3 characters long.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 32.0),
                  child: RoundedButton(
                    borderRadius: 16.0,
                    padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 20.0),
                    color: Theme.of(context).primaryColor,
                    text: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateProfileScreen(
                              fullname: fullname,
                              email: email,
                              password: password,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Or via social media',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: RoundedButton(
                            borderRadius: 16.0,
                            padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                            gradient: const [Color(0xFF00C6FB), Color(0xFF005BEA)],
                            leading: const Icon(Icons.facebook, color: Colors.white),
                            onTap: () => snackBar(context, 'Sign in with Facebook is not implemented'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: RoundedButton(
                            borderRadius: 16.0,
                            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            strokeOnly: true,
                            color: const Color(0xFF7BB32E),
                            leading: const Icon(Icons.wechat, color: Color(0xFF7BB32E)),
                            onTap: () => snackBar(context, 'Sign in with WeChat is not implemented'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RoundedButton(
                            borderRadius: 16.0,
                            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            strokeOnly: true,
                            color: Colors.white,
                            leading: Image.asset(
                              'assets/images/google_logo.png',
                              width: 24.0,
                              height: 24.0,
                            ),
                            onTap: () => snackBar(context, 'Sign in with Google is not implemented'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
                  child: Row(
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.center,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ),
                            (Route<dynamic> route) => route.isFirst,
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
