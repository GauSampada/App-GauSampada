import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  final List<String> imageUrls = [
    'assets/schemes/farmer_schemes.png',
    'assets/schemes/pm-kisan.png',
    'assets/schemes/samman_nidhi.png',
    'assets/schemes/gokul.png',
  ];

  final List<String> links = [
    'https://example.com/1',
    'https://example.com/2',
    'https://example.com/3',
    "https://dahd.gov.in/schemes/programmes/rashtriya_gokul_mission"
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Carousel')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 200, // Carousel height
            child: PageView.builder(
              controller: _pageController,
              itemCount: imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _launchURL(links[index]),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageUrls.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
