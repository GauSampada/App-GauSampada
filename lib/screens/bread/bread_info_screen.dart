// home_screen.dart
import 'package:flutter/material.dart';
import 'package:gausampada/backend/models/breed_model.dart';
import 'package:gausampada/const/colors.dart';

import 'breed_details.dart';

class BreadInfoScreen extends StatelessWidget {
  const BreadInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Breed> breeds = getBreeds(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Indian Cow Breeds',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: themeColor),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          final breed = breeds[index];
          // Alternate between dark green and light yellow backgrounds
          final backgroundColor = index % 2 == 0
              ? const Color(0xFF2AA76F) // Dark green
              : const Color(0xFFE5E7E9); // Light yellow/cream

          // Text color based on background for better contrast
          final textColor = index % 2 == 0 ? Colors.white : Colors.black;

          return BreedListTile(
            breed: breed,
            backgroundColor: backgroundColor,
            textColor: textColor,
            showBookButton: false, // Show "Book Now" button every third item
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
                        'Breed: ${breed.breedName}',
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
                    'Origin: ${breed.origin}',
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Cost
                  Text(
                    'Cost (Approx): ${breed.cost}',
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
                              content: Text('Booking ${breed.breedName}'),
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
                        child: const Text('Book Now'),
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
