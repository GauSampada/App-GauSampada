import 'package:flutter/material.dart';

class DairyProductsCardScreen extends StatelessWidget {
  const DairyProductsCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dairyProducts = [
      {"image": "assets/products/milk.png", "name": "Milk"},
      {"image": "assets/products/cheese.png", "name": "Cheese"},
      {"image": "assets/products/curd.png", "name": "Curd"},
      {"image": "assets/products/yogurt.jpg", "name": "Yogurt"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dairyProducts.map((product) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      product["image"]!,
                      width: 90,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          product["name"]!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
