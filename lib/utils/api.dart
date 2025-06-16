import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thinkr/models/article_model.dart';
import 'package:thinkr/utils/auth.dart';

class API {
  static final String _articlesApiUrl =
    "https://684e879bf0c9c9848d2860c1.mockapi.io/api/v1/articles";

  static Future<List<ArticleModel>> fetchArticles() async {
    final response = await http.get(Uri.parse(_articlesApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => ArticleModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  static Future<List<ArticleModel>> fetchFavorites() async {
    final response = await http.get(Uri.parse(_articlesApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final favoriteIds = Auth.currentUser!.favoritesIds;
      return jsonList
          .where((json) => favoriteIds!.contains(json['id']))
          .map((json) => ArticleModel.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load favorite articles');
    }
  }

  static Future<void> toggleFavorite(ArticleModel data) async {
    if (!data.isFavorited) {
      Auth.currentUser!.favoritesIds!.add(data.id);
    } else {
      Auth.currentUser!.favoritesIds!.remove(data.id);
    }
    final url = Uri.parse('${Auth.usersApiUrl}/${Auth.currentUser!.id}');
    await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'favoritesIds': Auth.currentUser!.favoritesIds}),
    );
  }
}