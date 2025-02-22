import 'package:flutter/material.dart';
import 'package:gausampada/const/colors.dart';

class DoctorListScreen extends StatelessWidget {
  DoctorListScreen({super.key});

  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Rajesh Kumar",
      "specialty": "Veterinarian",
      "image": "assets/ai_model/doctor.jpg",
    },
    {
      "name": "Dr. Suresh Patel",
      "specialty": "Livestock Specialist",
      "image": "assets/ai_model/doctor2.jpg",
    },
    {
      "name": "Dr. Anjali Sharma",
      "specialty": "Dairy Consultant",
      "image": "assets/ai_model/doctor3.jpg",
    },
    {
      "name": "Dr. Vikram Singh",
      "specialty": "Animal Nutritionist",
      "image": "assets/ai_model/doctor.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text("Disease Prediction"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipOval(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(doctor["image"]!),
                  ),
                ),
              ),
              title: Text(
                doctor["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(doctor["specialty"]!),
              trailing: SizedBox(
                width: 40, // Compact size
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Add call functionality
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.call, size: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
