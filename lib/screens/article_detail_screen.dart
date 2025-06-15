import 'package:flutter/material.dart';
import 'package:thinkr/models/article_model.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen(this.data, {super.key});

  final ArticleModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.bannerUrl != null && data.bannerUrl!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    data.bannerUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),
              Text(data.title!, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              if (data.createdAt != null)
                Text(
                  data.createdAt!.toLocal().toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              const SizedBox(height: 16),
              Text(data.content!, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
