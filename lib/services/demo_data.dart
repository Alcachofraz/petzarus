import 'package:petzarus/services/auth_service.dart';

class DemoData {
  static Map<String, dynamic> thisUser = {
    'username': AuthService.username,
    'fullname': AuthService.fullname,
    'photoUrl': 'assets/images/profile1.png',
    'email': AuthService.email,
    'pets': AuthService.pets,
    'interests': AuthService.interests,
    'followers': 124,
    'following': 536,
    'engagementRate': 4.6,
    'questionsPosted': 78,
    'markedHelpful': 22,
    'answersPosted': 39,
    'topRatedAnswers': 11,
    'upvotesReceived': 200,
    'images': [
      'assets/images/dog1.jpg',
      'assets/images/cat1.jpg',
      'assets/images/cat2.jpg',
      'assets/images/dog3.jpg',
      'assets/images/dog2.jpg',
    ],
    'videos': [
      'e8QtsyNXvFg',
    ],
  };

  static Map<String, dynamic> user1 = {
    'username': 'tommy',
    'fullname': 'Tommy Emanuel',
    'photoUrl': 'assets/images/profile2.png',
    'email': 'tommy@email.com',
    'pets': ['Cats', 'Birds'],
    'interests': ['Pet vaccination', 'Pet training', 'Pet breeding'],
    'followers': 194,
    'following': 1823,
    'engagementRate': 4.8,
    'questionsPosted': 121,
    'markedHelpful': 71,
    'answersPosted': 512,
    'topRatedAnswers': 213,
    'upvotesReceived': 1325,
    'images': [
      'assets/images/cat1.jpg',
      'assets/images/cat3.jpg',
      'assets/images/cat2.jpg',
    ],
    'videos': [
      'W86cTIoMv2U',
    ],
  };

  static Map<String, dynamic> user2 = {
    'username': 'hannah',
    'fullname': 'Hannah Jackson',
    'photoUrl': 'assets/images/profile3.png',
    'email': 'hannah@email.com',
    'pets': ['Cats'],
    'interests': ['Pet vaccination', 'Pet breeding', 'Pet nutrition', 'Pet food recipes'],
    'followers': 21,
    'following': 171,
    'engagementRate': 3.8,
    'questionsPosted': 2,
    'markedHelpful': 1,
    'answersPosted': 5,
    'topRatedAnswers': 2,
    'upvotesReceived': 4,
    'images': [
      'assets/images/bird1.jpg',
      'assets/images/cat2.jpg',
      'assets/images/bird2.jpg',
    ],
    'videos': [
      'Gk4huQCCUoI',
    ],
  };

  static Map<String, dynamic> post1 = {
    'user': user1,
    'date': 'Today 09:24 pm',
    'title': 'My adopted dog misses its previous owner. What should I do?',
    'description':
        'I adopted a dog that missed his previous owner. She must have been a lovely person for him but now I just want it to be happy again. Does anyone have any suggestions?',
    'image': 'assets/images/dog5.png',
    'likes': 4341,
    'comments': 137,
  };

  static Map<String, dynamic> post2 = {
    'user': user2,
    'date': 'Yesterday 12:16 am',
    'title': 'How safe is the Blue Buffalo cat food?',
    'description':
        'My cat seems very happy with the food he\'s been given. However, I wonder how safe it is. Has anyone had any experience with this line of products?',
    'image': 'assets/images/cat4.png',
    'likes': 124,
    'comments': 23,
  };

  static List<Map<String, dynamic>> posts = [post1, post2];
}