import 'package:flutter/material.dart';
import 'package:thinkr/cards/article_card.dart';
import 'package:thinkr/models/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  static final String _articlesApiUrl =
    "https://684e879bf0c9c9848d2860c1.mockapi.io/api/v1/articles";

  late Future<List<ArticleModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = fetchArticles();
  }


  Future<List<ArticleModel>> fetchArticles() async {
    final response = await http.get(Uri.parse(_articlesApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => ArticleModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder<List<ArticleModel>>(
        future: _articlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error loading articles'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles found'));
          }
          final articles = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(articles[index]);
            },
          );
        },
      ),
    );
  }
}