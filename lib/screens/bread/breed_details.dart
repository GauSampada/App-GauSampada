// breed_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:gausampada/backend/models/breed_model.dart';

class BreedDetailScreen extends StatelessWidget {
  final Breed breed;

  const BreedDetailScreen({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 240,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'breed-image-${breed.breedName}',
                  child: Image.network(
                    breed.imageURl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              leading: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'breed-name-${breed.breedName}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          breed.breedName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Origin', breed.origin),
                    _buildInfoRow('Milk Yield', breed.milkYield),
                    _buildInfoRow('Lactation Period', breed.lactationPeriod),
                    _buildInfoRow('Cost', breed.cost),
                    if (breed.localNames.isNotEmpty)
                      _buildInfoRow('Local Names', breed.localNames.join(', ')),
                    const SizedBox(height: 24),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      breed.description,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // This could be implemented to add to favorites or contact seller
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Interested in ${breed.breedName}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          icon: const Icon(
            Icons.phone,
            color: Colors.white,
          ),
          label: const Text(
            'Contact Seller',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[700],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
