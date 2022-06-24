import 'package:flutter/material.dart';
import 'package:petzarus/screens/welcome_screen.dart';
import 'package:petzarus/services/auth_service.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/loading.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/dropdown.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';

class CreateProfileScreen extends StatefulWidget {
  final String fullname;
  final String email;
  final String password;
  const CreateProfileScreen({Key? key, required this.fullname, required this.email, required this.password})
      : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String username = '';
  String language = 'English';
  bool all = false;
  bool busy = false;
  Map<String, bool> interests = {
    'Pet health': false,
    'Pet lifestyle': false,
    'Pet grooming': false,
    'Pet nutrition': false,
    'Pet breeding': false,
    'Pet training': false,
    'Pet behaviour': false,
    'Pet adoption': false,
    'Pet shows': false,
    'Pet vaccination': false,
    'Pet psychology': false,
    'Pet food recipes': false,
    'Pet photography': false,
    'Pet videography': false,
    'Pet care products': false,
    'Pet services': false,
  };
  Map<String, bool> pets = {
    'Cat': false,
    'Dogs': false,
    'Bird': false,
    'Rabbit': false,
    'Fish': false,
    'Others': false,
    'Planing on getting one': false,
  };
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create your Profile',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ClipOval(
                    child: Image.asset(
                      DemoData.thisUser['photoUrl'],
                      width: 180.0,
                      height: 180.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Username',
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
                      hintText: 'christopher',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixText: '@',
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
                      username = value;
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
                    'Do you have any pets?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      for (String pet in pets.keys)
                        FilterChip(
                          label: Text(
                            pet,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          backgroundColor: const Color(0xff131621),
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.grey),
                          ),
                          selected: pets[pet]!,
                          selectedColor: const Color(0xff131621),
                          checkmarkColor: Theme.of(context).primaryColor,
                          onSelected: (selected) {
                            setState(() {
                              pets[pet] = !pets[pet]!;
                            });
                          },
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Dropdown(
                    label: 'Your preferred language?',
                    options: const ['English', 'Português', 'भारतीय'],
                    initialOption: language,
                    labelColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        language = value;
                      });
                    },
                    convertToString: (value) => value,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    'What are your interests?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      for (String interest in interests.keys)
                        FilterChip(
                          label: Text(
                            interest,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          backgroundColor: const Color(0xff131621),
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.grey),
                          ),
                          selected: interests[interest]! || all,
                          selectedColor: const Color(0xff131621),
                          checkmarkColor: Theme.of(context).primaryColor,
                          onSelected: (selected) {
                            setState(() {
                              interests[interest] = !interests[interest]!;
                            });
                          },
                        ),
                      FilterChip(
                        label: const Text(
                          'All',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        backgroundColor: const Color(0xff131621),
                        shape: const StadiumBorder(
                          side: BorderSide(color: Colors.grey),
                        ),
                        selected: all,
                        selectedColor: const Color(0xff131621),
                        checkmarkColor: Theme.of(context).primaryColor,
                        onSelected: (selected) {
                          setState(() {
                            all = !all;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: RoundedButton(
                    borderRadius: 16.0,
                    padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 20.0),
                    color: Theme.of(context).primaryColor,
                    text: busy
                        ? loading(context, size: 19.0, color: Colors.white)
                        : const Text(
                            'Join now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                    onTap: busy
                        ? null
                        : () async {
                            setState(() {
                              busy = true;
                            });
                            if (formKey.currentState!.validate()) {
                              await AuthService.createUser(
                                username,
                                widget.password,
                                widget.fullname,
                                widget.email,
                                language,
                                pets.keys.where((k) => pets[k] ?? false).toList(),
                                interests.keys.where((k) => interests[k] ?? false).toList(),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen(),
                                ),
                                (Route<dynamic> route) => route.isFirst,
                              );
                              snackBar(context, 'Account created. Sign in to join us!');
                            } else {
                              snackBar(context, 'Something\'s not right, check all fields');
                            }
                            setState(() {
                              busy = false;
                            });
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
