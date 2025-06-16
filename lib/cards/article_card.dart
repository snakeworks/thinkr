import 'package:flutter/material.dart';
import 'package:thinkr/models/article_model.dart';
import 'package:thinkr/screens/article_detail_screen.dart';
import 'package:thinkr/utils/api.dart';
import 'package:thinkr/utils/routes.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard(this.data, {super.key});

  final ArticleModel data;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool _isTogglingFavorites = false;

  void _toggleFavorites() async {
    setState(() {
      _isTogglingFavorites = true;
    });

    await API.toggleFavorite(widget.data);

    setState(() {
      _isTogglingFavorites = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(
          context,
        ).push(Routes.asDefault(ArticleDetailScreen(widget.data)));
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        widget.data.bannerUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => SizedBox(
                              height: 200,
                              child: const Icon(Icons.image, size: 48),
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.data.title!,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Published: ${_formatDate(widget.data.createdAt!)}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child:
                      _isTogglingFavorites
                          ? const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                ),
                              ),
                            ),
                          )
                          : IconButton(
                            icon:
                                !widget.data.isFavorited
                                    ? const Icon(Icons.favorite_border)
                                    : const Icon(Icons.favorite),
                            color: Theme.of(context).primaryColor,
                            onPressed: _toggleFavorites,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
