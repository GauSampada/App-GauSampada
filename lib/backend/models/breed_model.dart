import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Breed {
  String breedName;
  String origin;
  List<String> localNames;
  String milkYield;
  String lactationPeriod;
  String description;
  String cost;
  String imageURl;
  Breed({
    required this.breedName,
    required this.origin,
    required this.localNames,
    required this.milkYield,
    required this.lactationPeriod,
    required this.description,
    required this.cost,
    required this.imageURl,
  });
}

List<Breed> getBreeds(BuildContext context) {
  return [
    Breed(
      breedName: AppLocalizations.of(context)!.gir_breedName,
      origin: AppLocalizations.of(context)!.gir_origin,
      localNames: [AppLocalizations.of(context)!.gir_localNames],
      milkYield: AppLocalizations.of(context)!.gir_milkYield,
      lactationPeriod: AppLocalizations.of(context)!.gir_lactationPeriod,
      description: AppLocalizations.of(context)!.gir_description,
      cost: "₹50,000 - ₹1,50,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/e036ab.jpg",
    ),
    Breed(
      breedName: AppLocalizations.of(context)!.sahiwal_breedName,
      origin: AppLocalizations.of(context)!.sahiwal_origin,
      localNames: [],
      milkYield: AppLocalizations.of(context)!.sahiwal_milkYield,
      lactationPeriod: AppLocalizations.of(context)!.sahiwal_lactationPeriod,
      description: AppLocalizations.of(context)!.sahiwal_description,
      cost: "₹60,000 - ₹1,80,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/16f343.jpg",
    ),
    Breed(
      breedName: AppLocalizations.of(context)!.red_sindhi_breedName,
      origin: AppLocalizations.of(context)!.red_sindhi_origin,
      localNames: [
        AppLocalizations.of(context)!.red_sindhi_localNames,
        // "Red Karachi"
      ],
      milkYield: AppLocalizations.of(context)!.red_sindhi_milkYield,
      lactationPeriod: AppLocalizations.of(context)!.red_sindhi_lactationPeriod,
      description: AppLocalizations.of(context)!.red_sindhi_description,
      cost: "₹40,000 - ₹1,20,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/7ebbae.jpg",
    ),
    Breed(
      breedName: "Tharparkar",
      origin: "Rajasthan",
      localNames: ["Thari"],
      milkYield: "8-12 liters/day",
      lactationPeriod: "260-290 days",
      description:
          "Tharparkar is a dual-purpose breed known for both milk production and draught work. It has a white or grey coat, making it distinct from other indigenous breeds. This breed is highly resistant to drought conditions and can thrive on minimal fodder. The milk is rich in nutrients and has a good fat percentage, making it valuable for dairy farms. Due to their sturdy build, they are often used in farming activities in desert regions.",
      cost: "₹50,000 - ₹1,40,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/c03272.jpg",
    ),
    Breed(
      breedName: "Deoni",
      origin: "Maharashtra, Telangana, Karnataka",
      localNames: ["Dongerpati", "Wannera"],
      milkYield: "5-10 liters/day",
      lactationPeriod: "250-280 days",
      description:
          "Deoni cattle are medium-sized, with a black-and-white coat and a strong muscular build. They are excellent milk producers and also perform well in draught work. These cows are known for their disease resistance and adaptability to both dry and wet climates. Their milk is high in fat content, making it useful for various dairy products. Due to their dual-purpose nature, they are widely reared by farmers across different regions.",
      cost: "₹40,000 - ₹1,10,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/bd29c5.jpg",
    ),
    Breed(
      breedName: "Ongole",
      origin: "Andhra Pradesh",
      localNames: ["Nellore"],
      milkYield: "5-8 liters/day",
      lactationPeriod: "220-250 days",
      description:
          "Ongole cattle are large, muscular, and mainly used for draught work, though they also provide a decent amount of milk. They have a white coat, a strong body, and a calm temperament. This breed is well-known for its endurance and ability to thrive in harsh climatic conditions. Ongole bulls are widely used for plowing and transport due to their strength. They have a long lifespan and require minimal maintenance, making them cost-effective.",
      cost: "₹50,000 - ₹1,20,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/133b3f.jpg",
    ),
    Breed(
      breedName: "Hariana",
      origin: "Haryana",
      localNames: [],
      milkYield: "8-10 liters/day",
      lactationPeriod: "250-280 days",
      description:
          "Hariana cattle are known for their ability to perform both as dairy and draught animals. They have a white or grey coat and a well-proportioned body structure. These cows are highly resistant to diseases and can survive on low-quality fodder. They produce milk with a moderate fat percentage, suitable for domestic dairy production. Due to their strong build, they are often used for plowing and transportation in rural areas.",
      cost: "₹40,000 - ₹1,00,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/7d6ee1.jpg",
    ),
    Breed(
      breedName: "Kankrej",
      origin: "Gujarat, Rajasthan",
      localNames: ["Wadhiar"],
      milkYield: "8-12 liters/day",
      lactationPeriod: "250-300 days",
      description:
          "Kankrej cattle are known for their speed and endurance, making them ideal for heavy farm work. They have a sleek body, long horns, and a white coat. These animals are extensively used for plowing and cart pulling due to their strong build. Though they produce a small quantity of milk, they are mainly reared for their strength. They have high disease resistance and can survive in extreme climatic conditions.",
      cost: "₹55,000 - ₹1,50,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/58b291.jpg",
    ),
    Breed(
      breedName: "Khillari",
      origin: "Karnataka, Maharashtra",
      localNames: [],
      milkYield: "6-9 liters/day",
      lactationPeriod: "240-280 days",
      description:
          "The Krishna Valley breed is known for its medium-to-large build, making it suitable for both milk production and draught work. It has a strong muscular frame, a broad forehead, and a short, compact body. Typically, these cattle are white or greyish with a slight bluish tinge. They are well-adapted to the hot and humid conditions of southern India and are used for plowing and cart-pulling in addition to dairy farming. The milk has a moderate fat content, making it valuable for small-scale dairy operations.",
      cost: "₹40,000 - ₹1,10,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/d8dd9c.jpg",
    ),
    Breed(
      breedName: "Hallikar",
      origin: "Karnataka",
      localNames: [],
      milkYield: "2-4 liters/day",
      lactationPeriod: "200-250 days",
      description:
          "One of the oldest and most well-known draught breeds in India, Hallikar cattle are valued for their endurance, speed, and strength. They have a sleek, well-muscled body with a white or greyish coat and long, curved horns. They are highly active and commonly used for plowing fields and pulling carts, particularly in Karnataka’s agricultural regions.",
      cost: "₹30,000 - ₹80,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/80427b.jpg",
    ),
    Breed(
      breedName: "Amrit Mahal",
      origin: "Karnataka",
      localNames: [],
      milkYield: "2-3 liters/day",
      lactationPeriod: "200-230 days",
      description:
          "Amrit Mahal cattle are a powerful draught breed, known for their incredible stamina and endurance. They have a compact, strong body with a well-developed hump and a predominantly grey or white coat. These cattle are extensively used in military and transport applications due to their ability to travel long distances under harsh conditions. Their aggressive nature makes them more suitable for work rather than dairy production.",
      cost: "₹30,000 - ₹75,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/6afde2.jpg",
    ),
    Breed(
      breedName: "Khillari",
      origin: "Maharashtra, Karnataka",
      localNames: [],
      milkYield: "2-5 liters/day",
      lactationPeriod: "200-250 days",
      description:
          "The Khillari breed is known for its agility, speed, and strength, making it ideal for farm work and transportation. These cattle are small to medium-sized with a compact, muscular build and a short, fine coat, often seen in shades of grey, white, or reddish-brown. Their horns curve backward in a distinctive manner. They are widely used in hilly and semi-arid regions for tilling fields and pulling heavy loads.",
      cost: "₹30,000 - ₹85,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/d8dd9c.jpg",
    ),
    Breed(
      breedName: "Kangayam",
      origin: "Tamil Nadu",
      localNames: [],
      milkYield: "3-6 liters/day",
      lactationPeriod: "220-260 days",
      description:
          "Kangayam cattle are medium-sized, well-built, and well-adapted to the dry climate of Tamil Nadu. They are typically white or grey, with short, strong legs and an upright posture. Their strength and endurance make them highly suitable for plowing, cart-pulling, and other agricultural activities. Though not primarily used for milk production, they provide a moderate yield that is sufficient for household dairy needs.",
      cost: "₹35,000 - ₹90,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/d3bd97.jpg",
    ),
    Breed(
      breedName: "Bargur",
      origin: "Tamil Nadu",
      localNames: ["Bargur Gidda"],
      milkYield: "2-4 liters/day",
      lactationPeriod: "200-240 days",
      description:
          "Bargur cattle are small, agile, and well-suited for working in hilly and rugged terrains. They are recognized by their reddish-brown coat, lean frame, and quick movements. These cattle are commonly used for plowing in regions with uneven land and for pulling carts in remote areas. Though they produce a small quantity of milk, it has high nutritional value and is used by local farmers.",
      cost: "₹25,000 - ₹70,000",
      imageURl:
          "https://timesofagriculture.in/wp-content/uploads/2023/12/6978fb.jpg",
    ),
  ];
}
