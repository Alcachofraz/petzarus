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
    'username': 'martha',
    'fullname': 'Martha Jackson',
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

  static Map<String, dynamic> user3 = {
    'username': 'loch',
    'fullname': 'Loch White',
    'photoUrl': 'assets/images/profile4.png',
    'email': 'loch@email.com',
    'pets': ['birds'],
    'interests': ['Pet breeding', 'Pet nutrition'],
    'followers': 29,
    'following': 172,
    'engagementRate': 4.8,
    'questionsPosted': 7,
    'markedHelpful': 2,
    'answersPosted': 3,
    'topRatedAnswers': 3,
    'upvotesReceived': 2,
    'images': [
      'assets/images/bird1.jpg',
      'assets/images/bird2.jpg',
    ],
    'videos': [
      'Gk4huQCCUoI',
    ],
  };

  static Map<String, dynamic> user4 = {
    'username': 'stevie',
    'fullname': 'Stevie Nicks',
    'photoUrl': 'assets/images/profile5.png',
    'email': 'stevie@email.com',
    'pets': ['dogs'],
    'interests': ['Pet breeding', 'Pet nutrition'],
    'followers': 29,
    'following': 172,
    'engagementRate': 4.8,
    'questionsPosted': 7,
    'markedHelpful': 2,
    'answersPosted': 3,
    'topRatedAnswers': 3,
    'upvotesReceived': 2,
    'images': [
      'assets/images/dog1.jpg',
      'assets/images/dog2.jpg',
    ],
    'videos': [
      'Gk4huQCCUoI',
    ],
  };

  static Map<String, dynamic> user5 = {
    'username': 'animalkingdom',
    'fullname': 'Animal Kingdom',
    'photoUrl': 'assets/images/profile6.png',
    'email': 'animalkingdom@email.com',
    'pets': ['dogs'],
    'interests': ['Pet breeding', 'Pet nutrition'],
    'followers': 29,
    'following': 172,
    'engagementRate': 4.8,
    'questionsPosted': 7,
    'markedHelpful': 2,
    'answersPosted': 3,
    'topRatedAnswers': 3,
    'upvotesReceived': 2,
    'images': [
      'assets/images/dog1.jpg',
      'assets/images/dog2.jpg',
    ],
    'videos': [
      'Gk4huQCCUoI',
    ],
  };

  static List<Map<String, dynamic>> posts = [
    {
      'user': user1,
      'date': 'Today 09:24 pm',
      'title': 'My adopted dog misses its previous owner. What should I do?',
      'description':
          'I adopted a dog that missed his previous owner. She must have been a lovely person for him but now I just want it to be happy again. Does anyone have any suggestions?',
      'image': 'assets/images/dog5.png',
      'likes': 4341,
      'comments': 137,
    },
    {
      'user': user2,
      'date': 'Yesterday 12:16 am',
      'title': 'How safe is the Blue Buffalo cat food?',
      'description':
          'My cat seems very happy with the food he\'s been given. However, I wonder how safe it is. Has anyone had any experience with this line of products?',
      'image': 'assets/images/cat4.png',
      'likes': 124,
      'comments': 23,
    }
  ];

  static List<Map<String, dynamic>> stories = [
    {
      'user': user2,
      'date': '1 day ago',
      'readTimeMinutes': 5,
      'title': 'How Max Helped Me Manage My Anxiety and Depression.',
      'description':
          'I first began experiencing anxiety and depression at the age of 14 after being bullied at school for years. While at first it would come and go, anxiety and depression eventually became a constant presence in my life. It was like a perpetual cough that eventually starts to get better. I\'ll never be able to thank it enough.',
      'image': 'assets/images/story1.png',
      'likes': 4287,
      'comments': 234,
    },
    {
      'user': user3,
      'date': '2 days ago',
      'readTimeMinutes': 8,
      'title': 'My Pet Bird, Cinnamon',
      'description':
          'I have a pet bird called Cinnamon. She is a girl. She is cinnamon coloured. She is a sweet loving bird. Her feathers feel like silk. Cinnamon doesn’t like being patted on her back. She likes being massaged around her neck and her throat and her cheeks but if you pat her on her back, you just made a new friend.',
      'image': 'assets/images/story2.png',
      'likes': 1041,
      'comments': 121,
    }
  ];

  static List<Map<String, dynamic>> videos = [
    {
      'user': user4,
      'date': '7 hours ago',
      'views': '336.9k',
      'title': 'Cutest Video of my Dog Toto ❤️❤️❤️',
      'video': 'jP8iCuXeM3g',
    },
    {
      'user': user5,
      'date': '1 day ago',
      'views': '7.2M',
      'title': 'Funny and Cute Baby Bunny Rabbit Videos ❤️❤️',
      'video': 'hDJkFLnmFHU',
    },
    {
      'user': user1,
      'date': '4 day ago',
      'views': '1.1M',
      'title': 'Funny Parrots Compilation',
      'video': 'dW2utwg9oOg',
    }
  ];
}
