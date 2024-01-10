import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TechScreen(),
    );
  }
}

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TechScreenState createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
  List<NewsItem> newsUpdates = [
    NewsItem(
      title: "Understanding Type 1 Diabetes",
      details: "Type 1 diabetes, often referred to as juvenile diabetes, is a chronic condition in which the pancreas produces little or no insulin. This lack of insulin causes blood sugar levels to rise, leading to various complications if not managed properly.",
    ),
    NewsItem(
      title: "Managing Type 1 Diabetes",
      details: "Management of Type 1 diabetes involves a combination of insulin therapy, regular blood sugar monitoring, and lifestyle modifications. While there's no cure, advancements in technology and medicine have made it easier to manage the condition.",
    ),
    NewsItem(
      title: "Medications and Solutions",
      details: "The primary treatment for Type 1 diabetes is insulin therapy. There are various types of insulin, including rapid-acting, short-acting, intermediate-acting, and long-acting. Additionally, continuous glucose monitoring systems and insulin pumps are also available to help individuals manage their condition more effectively.",
    ),
    NewsItem(
      title: "Diet Plans for Type 1 Diabetes",
      details: "Diet plays a crucial role in managing Type 1 diabetes. A balanced diet rich in whole grains, lean proteins, fruits, and vegetables is recommended. Monitoring carbohydrate intake and spacing meals evenly throughout the day can help regulate blood sugar levels.",
    ),
  ];
  Set<String> savedNews = {};
  Map<String, bool> isExpanded = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Tech Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _navigateToSavedNews(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: newsUpdates.length,
        itemBuilder: (context, index) => Card(
          elevation: 3.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            title: Text(newsUpdates[index].title),
            subtitle: isExpanded[newsUpdates[index].title] != true
                ? Text(
                    "${newsUpdates[index].details.split(" ").take(30).join(" ")} ...",
                  ) // Adjusted to take 30 words
                : null,
            trailing: IconButton(
              icon: savedNews.contains(newsUpdates[index].title)
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_border),
              onPressed: () {
                _toggleSavedStatus(newsUpdates[index].title);
              },
            ),
            onTap: () {
              _showNewsDetails(context, newsUpdates[index]);
            },
          ),
        ),
      ),
    );
  }

  void _toggleSavedStatus(String title) {
    setState(() {
      if (savedNews.contains(title)) {
        savedNews.remove(title);
      } else {
        savedNews.add(title);
      }
    });
  }

  void _showNewsDetails(BuildContext context, NewsItem news) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(news.title),
        content: SingleChildScrollView(
          child: Text(news.details),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              _shareNews(news);
            },
            child: const Text('Share'),
          ),
        ],
      ),
    );
  }

  void _shareNews(NewsItem news) {
    if (kDebugMode) {
      print("Sharing news: ${news.title}");
    }
  }

  void _navigateToSavedNews(BuildContext context) {
    if (kDebugMode) {
      print("Navigating to saved news...");
    }
  }
}

class NewsItem {
  final String title;
  final String details;

  NewsItem({required this.title, required this.details});
}
