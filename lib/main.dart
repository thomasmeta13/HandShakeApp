import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handshake App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(
        userPhoto: 'images/user_photo.jpeg',
        userName: 'Thomas Meta',
        userBio: 'Software engineer with 10+ years of experience. Skilled in web and mobile development, and a great team player.',
        userRating: 4.5,
        userReviewCount: 150,
        userSkills: ['Flutter', 'Dart', 'React Native', 'JavaScript'],
        userActivities: [
          {'title': 'Debugging student code', 'timestamp': '2 hours ago'},
          {'title': 'Helping with app design', 'timestamp': 'Yesterday'},
        ],
        userReviews: [
          {
            'reviewerPhoto': 'images/reviewer_1.jpeg',
            'reviewerName': 'Alice',
            'rating': 4,
            'reviewText': 'John did a great job with our project. Highly recommended!'
          },
          {
            'reviewerPhoto': 'images/reviewer_2.jpeg',
            'reviewerName': 'Bob',
            'rating': 5,
            'reviewText': 'Amazing work on our mobile app. John is very professional and responsive.'
          },
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String userPhoto;
  final String userName;
  final String userBio;
  final double userRating;
  final int userReviewCount;
  final List<String> userSkills;
  final List<Map<String, String>> userActivities;
  final List<Map<String, dynamic>> userReviews;

  ProfilePage({
    required this.userPhoto,
    required this.userName,
    required this.userBio,
    required this.userRating,
    required this.userReviewCount,
    required this.userSkills,
    required this.userActivities,
    required this.userReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User photo and name
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userPhoto),
                    radius: 50,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      RatingBarIndicator(
                        rating: userRating,
                        itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20,
                        unratedColor: Colors.amber.withAlpha(50                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '$userReviewCount reviews',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // User bio
              Text(
                'Bio:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                userBio,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // User skills
              Text(
                'Skills:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: userSkills
                    .map(
                      (skill) => Chip(
                        label: Text(skill),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 16),
              // User activities
              Text(
                'Recent Activities:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: userActivities.map((activity) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          activity['title']!,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          activity['timestamp']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              // User reviews
              Text(
                'Reviews:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: userReviews.map((review) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(review['reviewerPhoto']),
                          radius: 25,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review['reviewerName'],
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              RatingBarIndicator(
                                rating: review['rating'].toDouble(),
                                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                itemCount: 5,
                                itemSize: 20,
                                unratedColor: Colors.amber.withAlpha(50),
                              ),
                              SizedBox(height: 4),
                              Text(
                                review['reviewText'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

