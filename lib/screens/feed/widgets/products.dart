import 'package:flutter/material.dart';
import 'package:gausampada/screens/market/market_screen.dart';

class DairyProductsCardScreen extends StatelessWidget {
  const DairyProductsCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dairyProducts = [
      {
        "image": "assets/products/milk.png",
        "name": "Milk",
        "price": "₹80",
        "quantity": "1 Litre"
      },
      {
        "image": "assets/products/cheese.png",
        "name": "Cheese",
        "price": "₹450",
        "quantity": "200g"
      },
      {
        "image": "assets/products/curd.png",
        "name": "Curd",
        "price": "₹60",
        "quantity": "500g"
      },
      {
        "image": "assets/products/yogurt.jpg",
        "name": "Yogurt",
        "price": "₹120",
        "quantity": "1 kg"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding:
        //       const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 8),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       const Text(
        //         "Dairy Products",
        //         style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //           color: Color(0xFF2E3E5C),
        //         ),
        //       ),
        //       TextButton(
        //         onPressed: () {
        //           Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder: (context) => const MarketAccessScreen(),
        //             ),
        //           );
        //         },
        //         child: const Text(
        //           "View All",
        //           style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w500,
        //             color: Color(0xFF4A6CFA),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          height: 230, // Increased height for better fit
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: dairyProducts.length,
            itemBuilder: (context, index) {
              final product = dairyProducts[index];
              return Container(
                width: 164, // Increased width
                margin: const EdgeInsets.only(left: 4, right: 12),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image container with badge
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                child: Container(
                                  height: 110, // Increased image height
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF7F9FC),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      product["image"],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              // Favorite button
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Material(
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: const CircleBorder(),
                                  child: InkWell(
                                    onTap: () {},
                                    customBorder: const CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 18,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Product details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product["name"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E3E5C),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product["quantity"],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Price and add button row
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product["price"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF4A6CFA),
                                        ),
                                      ),
                                      Material(
                                        color: const Color(0xFF4A6CFA),
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () {},
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
