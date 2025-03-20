// home_screen.dart
import 'package:flutter/material.dart';
import 'package:gausampada/backend/models/breed_model.dart';
import 'package:gausampada/const/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gausampada/screens/breed/bread_list_tile.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.indian_cow_breeds_title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: themeColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ).copyWith(bottom: 2),
              child: Text(
                AppLocalizations.of(context)!.breedInformation,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200, // Adjusted height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 8),
                itemCount: _breeds.length,
                itemBuilder: (context, index) {
                  return BreedCard(
                    breed: _breeds[index],
                    showBookButton: false,
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
