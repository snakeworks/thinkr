import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:thinkr/helper_widgets/th_button.dart';
import 'package:thinkr/models/article_model.dart';
import 'package:thinkr/utils/auth.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen(this.data, {super.key});

  final ArticleModel data;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  bool _isTogglingFavorites = false;

  void _toggleFavorites() async {
    setState(() {
      _isTogglingFavorites = true;
    });

    if (!_isFavorited()) {
      Auth.currentUser!.favoritesIds!.add(widget.data.id);
    } else {
      Auth.currentUser!.favoritesIds!.remove(widget.data.id);
    }

    final url = Uri.parse('${Auth.usersApiUrl}/${Auth.currentUser!.id}');
    await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'favoritesIds': Auth.currentUser!.favoritesIds}),
    );

    setState(() {
      _isTogglingFavorites = false;
    });
  }

  bool _isFavorited() {
    return Auth.currentUser!.favoritesIds!.contains(widget.data.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.title!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.data.bannerUrl != null &&
                  widget.data.bannerUrl!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.data.bannerUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),
              ThButton(
                text:
                    !_isFavorited()
                        ? "Add To Favorites"
                        : "Remove From Favorites",
                iconData: Icons.favorite,
                isLoading: _isTogglingFavorites,
                onPressed: _toggleFavorites,
              ),
              const SizedBox(height: 16),
              Text(
                widget.data.title!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              if (widget.data.createdAt != null)
                Text(
                  widget.data.createdAt!.toLocal().toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              const SizedBox(height: 16),
              Text(
                widget.data.content!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
