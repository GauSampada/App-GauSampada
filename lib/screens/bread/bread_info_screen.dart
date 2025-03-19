// home_screen.dart
import 'package:flutter/material.dart';
import 'package:gausampada/backend/models/breed_model.dart';
import 'package:gausampada/const/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'breed_details.dart';

class BreadInfoScreen extends StatefulWidget {
  const BreadInfoScreen({super.key});

  @override
  State<BreadInfoScreen> createState() => _BreadInfoScreenState();
}

class _BreadInfoScreenState extends State<BreadInfoScreen> {
  Locale? _currentLocale;
  late List<Breed> _breeds;

  @override
  void initState() {
    super.initState();
    // Initialize breeds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateBreeds();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newLocale = Localizations.localeOf(context);
    // Only update if locale has changed
    if (_currentLocale != newLocale) {
      _currentLocale = newLocale;
      _updateBreeds();
    }
  }

  void _updateBreeds() {
    setState(() {
      _breeds = getBreeds(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.indian_cow_breeds_title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: themeColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: _breeds.length,
        itemBuilder: (context, index) {
          final breed = _breeds[index];
          final backgroundColor = index % 2 == 0
              ? const Color(0xFF2AA76F)
              : const Color(0xFFE5E7E9);
          final textColor = index % 2 == 0 ? Colors.white : Colors.black;

          return BreedListTile(
            breed: breed,
            backgroundColor: backgroundColor,
            textColor: textColor,
            showBookButton: false,
          );
        },
      ),
    );
  }
}

class BreedListTile extends StatelessWidget {
  final Breed breed;
  final Color backgroundColor;
  final Color textColor;
  final bool showBookButton;

  const BreedListTile({
    super.key,
    required this.breed,
    required this.backgroundColor,
    required this.textColor,
    this.showBookButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                BreedDetailScreen(breed: breed),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rounded corners
            Hero(
              tag: 'breed-image-${breed.breedName}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  breed.imageURl,
                  width: 120,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Breed name
                  Hero(
                    tag: 'breed-name-${breed.breedName}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        '${AppLocalizations.of(context)!.breed}: ${breed.breedName}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Origin
                  Text(
                    '${AppLocalizations.of(context)!.origin}: ${breed.origin}',
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Cost
                  Text(
                    '${AppLocalizations.of(context)!.cost_approx}: ${breed.cost}',
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  if (showBookButton) ...[
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${AppLocalizations.of(context)!.booking} ${breed.breedName}'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                        child: Text(AppLocalizations.of(context)!.book_now),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
