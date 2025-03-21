import 'package:flutter/material.dart';

class FAQScreens extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: "What is the Farmer Support App?",
      icon: "🌾",
      points: [
        "A digital platform for Indian farmers",
        "Provides cow breed info, AI-based health tools & market insights",
        "Helps in breeding, nutrition, and farm management"
      ],
    ),
    FAQItem(
      question: "How does the app help farmers?",
      icon: "🧠",
      points: [
        "Get AI-powered recommendations for cattle breeding & health",
        "Find best breeds for milk, meat, or farm work",
        "Access govt schemes, subsidies & loan info",
        "Connect with marketplaces & buyers"
      ],
    ),
    FAQItem(
      question: "What are the best Indian cow breeds for milk?",
      icon: "🥛",
      points: [
        "Gir – 12-15L/day, A2 milk",
        "Sahiwal – 10-12L/day, disease-resistant",
        "Rathi – 8-10L/day, heat-resistant",
        "Tharparkar – 6-8L/day, low maintenance"
      ],
    ),
    FAQItem(
      question: "How to improve milk yield?",
      icon: "🥗",
      points: [
        "Feed balanced nutrition (green fodder + minerals)",
        "Ensure clean water & hygiene",
        "Regular health check-ups",
        "Reduce stress & provide shelter"
      ],
    ),
    FAQItem(
      question: "What is PM-KISAN?",
      icon: "💰",
      points: [
        "₹6,000/year cash transfer",
        "Paid in 3 installments",
        "For small & marginal farmers"
      ],
    ),
    FAQItem(
      question: "How to sell dairy products online?",
      icon: "🛒",
      points: [
        "Register on FPOs, eNAM & AgriBazaar",
        "Get FSSAI certification for processing",
        "Use social media & farm-to-home delivery"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Frequently Asked Questions',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return FAQCard(faqItem: faqItems[index], index: index + 1);
        },
      ),
    );
  }
}

class FAQCard extends StatefulWidget {
  final FAQItem faqItem;
  final int index;

  FAQCard({required this.faqItem, required this.index});

  @override
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.index}️⃣',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.faqItem.question,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    widget.faqItem.icon,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.green[700],
                  ),
                ],
              ),
            ),
            if (_expanded)
              Container(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.faqItem.points.map((point) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            margin: EdgeInsets.only(top: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String icon;
  final List<String> points;

  FAQItem({
    required this.question,
    required this.icon,
    required this.points,
  });
}

// Detailed FAQ Screen

class DetailedFAQScreen extends StatelessWidget {
  final FAQItem faqItem;

  DetailedFAQScreen({required this.faqItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ Details'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  faqItem.icon,
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    faqItem.question,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ...faqItem.points.map((point) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green[700]),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        point,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement related action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Learn More',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
