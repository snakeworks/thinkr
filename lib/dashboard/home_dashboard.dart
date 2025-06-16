import 'package:flutter/material.dart';
import 'package:thinkr/cards/article_card.dart';
import 'package:thinkr/models/article_model.dart';
import 'package:thinkr/utils/api.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  late Future<List<ArticleModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = API.fetchArticles();
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