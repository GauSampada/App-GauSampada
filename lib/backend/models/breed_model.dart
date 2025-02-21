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

List<Breed> breeds = [
  Breed(
    breedName: "Gir",
    origin: "Gujarat, India",
    localNames: ["Gyr"],
    milkYield: "10-15 liters/day",
    lactationPeriod: "270-300 days",
    description:
        "Gir cows are well-adapted to hot climates and have a strong immune system, making them highly disease-resistant. They have a distinctive reddish-brown coat and curved horns. Known for their high milk yield, they produce milk rich in A2 protein, making it highly nutritious. These cows are also easy to maintain as they require minimal veterinary care. Due to their adaptability, they are exported worldwide for dairy breeding programs.",
    cost: "₹50,000 - ₹1,50,000",
    imageURl:
        "https://timesofagriculture.in/wp-content/uploads/2023/12/e036ab.jpg",
  ),
  Breed(
    breedName: "Sahiwal",
    origin: "Punjab, Haryana, Uttar Pradesh",
    localNames: [],
    milkYield: "15-20 liters/day",
    lactationPeriod: "280-320 days",
    description:
        "Sahiwal is one of the best indigenous dairy breeds, known for its high milk production and resistance to tropical diseases. These cows have a reddish-brown coat, a loose skin structure, and short horns. They can adapt to both stall feeding and grazing conditions, making them highly versatile. Their milk contains a high percentage of fat, making it suitable for dairy-based products. Sahiwal cattle are also used in crossbreeding programs to improve the milk yield of other breeds.",
    cost: "₹60,000 - ₹1,80,000",
    imageURl:
        "https://timesofagriculture.in/wp-content/uploads/2023/12/16f343.jpg",
  ),
  Breed(
    breedName: "Red Sindhi",
    origin: "Sindh (Pakistan), now found in India",
    localNames: ["Sindhi", "Red Karachi"],
    milkYield: "12-15 liters/day",
    lactationPeriod: "270-300 days",
    description:
        "Red Sindhi cows have a deep red coat, high disease resistance, and adapt well to hot, humid climates. They are widely used in crossbreeding to improve productivity. Their milk has a good fat percentage, making it ideal for ghee and butter production.",
    cost: "₹40,000 - ₹1,20,000",
    imageURl:
        "https://timesofagriculture.in/wp-content/uploads/2023/12/7ebbae.jpg",
  ),
  // Breed(
  //   breedName: "Rathi",
  //   origin: "Rajasthan",
  //   localNames: [],
  //   milkYield: "6-10 liters/day",
  //   lactationPeriod: "250-280 days",
  //   description:
  //       "Rathi cattle are known for their high milk yield and excellent adaptability to arid climates. They have a brown coat with white patches and a compact body structure. Their milk has a good fat percentage, making it suitable for dairy-based products like curd and ghee. These cows are known for their good fertility rates and regular calving cycles. Due to their heat tolerance, they are preferred in Rajasthan and other dry regions.",
  //   cost: "₹35,000 - ₹1,00,000",
  //   imageURl: "",
  // ),
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
];
