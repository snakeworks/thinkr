import 'package:flutter/material.dart';
import 'package:thinkr/cards/article_card.dart';
import 'package:thinkr/models/article_model.dart';
import 'package:thinkr/screens/boot_screen.dart';
import 'package:thinkr/utils/api.dart';
import 'package:thinkr/utils/auth.dart';
import 'package:thinkr/utils/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<ArticleModel>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = API.fetchFavorites();
  }
  
  void _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (shouldLogout != true) return;
    await Auth.logout();
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      Routes.asDefault(BootScreen())
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(Auth.currentUser!.avatarUrl!),
            ),
            const SizedBox(height: 16),
            Text(
              Auth.currentUser!.fullName!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              Auth.currentUser!.username!,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  '${Auth.currentUser!.quizStars!}',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(width: 24),
                Icon(Icons.location_on, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  '${Auth.currentUser!.country!}, ${Auth.currentUser!.city!}',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: FutureBuilder<List<ArticleModel>>(
                future: _favoritesFuture,
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
            ),
          ],
        ),
      ),
    );
  }
}
