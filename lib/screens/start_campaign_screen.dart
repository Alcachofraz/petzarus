import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/campaign_screen.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/animated_dialog.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class StartCampaignScreen extends StatefulWidget {
  const StartCampaignScreen({Key? key}) : super(key: key);

  @override
  State<StartCampaignScreen> createState() => _StartCampaignScreenState();
}

class _StartCampaignScreenState extends State<StartCampaignScreen> {
  int current_state = 0;
  String address = '';
  String postCode = '';
  List<String> milestones = [];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final states = [
      Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                'Find Volunteers, Raise Funds for Animal Welfare, Build a Community',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Tile(
                color: Colors.grey[700],
                radiusAll: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tips on getting good answers quickly:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          '•  Make sure your question has not been asked already;',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Text(
                        '•  Keep your goal short and to the point;',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          '•  Double-check grammar and spelling.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Center(
                child: Text(
                  'Let\'s Begin your Campaign!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 16.0),
              child: Center(
                child: Text(
                  '•  We will guide you every step of the way!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      DemoData.thisUser['photoUrl'],
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '@${DemoData.thisUser['username']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Sesame Street',
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
                  address = value;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: '1234-1234',
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
                  postCode = value;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: RoundedButton(
                color: Theme.of(context).primaryColor,
                borderRadius: 16.0,
                text: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      current_state++;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                'Tell us about your Campaign',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Tile(
                color: Colors.grey[700],
                radiusAll: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '•  This info will help in describing your initiative to your community.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          '•  Well Defined goals and milestones often end up meeting their Fundraising Goal or even beyond.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      DemoData.thisUser['photoUrl'],
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '@${DemoData.thisUser['username']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: 'Campaign Goal',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Veterinary Mission for refugee animals in NY Shelters',
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
                  address = value;
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
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: Text(
                'Milestones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      backgroundColor: const Color(0xff131621),
                      shape: const StadiumBorder(side: BorderSide(color: Colors.green)),
                      label: Text(
                        'Add'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                      deleteIcon: const Icon(Icons.add_rounded, color: Colors.green, size: 20),
                      onDeleted: () {
                        String milestone = '';
                        final formKey2 = GlobalKey<FormState>();
                        showDialog(
                          context: context,
                          builder: (context) => AnimatedDialog(
                            title: 'Add milestone',
                            child: Form(
                              key: formKey2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.group_rounded, color: Colors.grey),
                                        iconColor: Theme.of(context).primaryColor,
                                        labelText: 'Milestone goal',
                                        labelStyle: const TextStyle(color: Colors.grey),
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
                                      onChanged: (value) => milestone = value,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Invalid.';
                                        } else if (value.length < 3) {
                                          return 'Must be at least 3 characters long.';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  RoundedButton(
                                    text: const Text(
                                      'Add',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    onTap: () {
                                      if (formKey2.currentState!.validate()) {
                                        setState(() {
                                          milestones.add(milestone);
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  for (String milestone in milestones)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Chip(
                        backgroundColor: const Color(0xff131621),
                        shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
                        label: Text(
                          milestone,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        deleteIcon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: Colors.grey,
                        ),
                        onDeleted: () {
                          showDialog(
                            context: context,
                            builder: (context) => AnimatedDialog(
                              title: 'Remove option',
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: Text(
                                      'Remove milestone $milestone?',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  RoundedButton(
                                    text: const Text(
                                      'Remove',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    color: Colors.red,
                                    onTap: () {
                                      setState(() {
                                        milestones.remove(milestone);
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: 'Fundraising Goal',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: '20000',
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
                  prefixText: '\$',
                ),
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  address = value;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: RoundedButton(
                color: Theme.of(context).primaryColor,
                borderRadius: 16.0,
                text: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      current_state++;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                'Additional Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Tile(
                color: Colors.grey[700],
                radiusAll: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '•  Adding Media is an engaging way to connect with your potential Donors , Volunteers and helps spreading a message of strong community.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      DemoData.thisUser['photoUrl'],
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '@${DemoData.thisUser['username']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.grey),
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Campaign Description',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Describe the campaign in detail.',
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
                  address = value;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.grey),
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Looking for Volunteers?',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Tell your Volunteers about your needs. their Tasks, Roles and Responsibilities',
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
                  address = value;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: RoundedButton(
                matchParent: false,
                strokeOnly: true,
                color: Theme.of(context).primaryColor,
                text: Text(
                  'Add a video link',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onTap: () {
                  snackBar(context, 'Not yet implemented');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: RoundedButton(
                  matchParent: false,
                  strokeOnly: true,
                  color: Theme.of(context).primaryColor,
                  text: Text(
                    'Upload media',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    snackBar(context, 'Not yet implemented');
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: RoundedButton(
                color: Theme.of(context).primaryColor,
                borderRadius: 16.0,
                text: const Text(
                  'Publish',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CampaignScreen(
                          campaign: DemoData.campaign,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ];

    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Post Campaign', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
        /*leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),*/
      ),
      body: SingleChildScrollView(child: states[current_state]),
      onBack: () {
        if (current_state == 0) {
          return true;
        } else {
          setState(() {
            current_state--;
          });
          return false;
        }
      },
    );
  }
}
