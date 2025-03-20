// import 'package:flutter/material.dart';
// import 'package:gausampada/screens/auth/signup.dart';
// import 'package:google_fonts/google_fonts.dart';

// // Enum to represent user types
// enum UserType {
//   user,
//   doctor,
//   farmer,
// }

// class UserTypeSelectionScreen extends StatefulWidget {
//   const UserTypeSelectionScreen({super.key});

//   @override
//   _UserTypeSelectionScreenState createState() =>
//       _UserTypeSelectionScreenState();
// }

// class _UserTypeSelectionScreenState extends State<UserTypeSelectionScreen> {
//   UserType? selectedUserType;

//   // Green color for selected state
//   final Color selectGreen = const Color(0xFF2E7D32);

//   // User type data
//   final List<Map<String, dynamic>> userTypes = [
//     {
//       'type': UserType.user,
//       'title': 'Regular User',
//       'subtitle': 'Access general features and services',
//       'icon': Icons.person,
//     },
//     {
//       'type': UserType.doctor,
//       'title': 'Doctor',
//       'subtitle': 'Provide medical services and consultation',
//       'icon': Icons.medical_services,
//     },
//     {
//       'type': UserType.farmer,
//       'title': 'Farmer',
//       'subtitle': 'Access agricultural tools and resources',
//       'icon': Icons.agriculture,
//     },
//   ];

//   void _navigateToSignup() {
//     if (selectedUserType != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SignupScreen(userType: selectedUserType!),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: Text(
//           'Select User Type',
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Who are you?',
//               style: GoogleFonts.poppins(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               'Select your user type to continue',
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 40),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: userTypes.length,
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   final userTypeData = userTypes[index];
//                   final isSelected = selectedUserType == userTypeData['type'];

//                   return UserTypeOption(
//                     title: userTypeData['title'],
//                     subtitle: userTypeData['subtitle'],
//                     icon: userTypeData['icon'],
//                     isSelected: isSelected,
//                     selectColor: selectGreen,
//                     onTap: () {
//                       setState(() {
//                         selectedUserType = userTypeData['type'];
//                       });
//                     },
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: selectedUserType != null ? _navigateToSignup : null,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor:
//                     selectedUserType != null ? selectGreen : Colors.grey[300],
//                 foregroundColor: Colors.white,
//                 elevation: selectedUserType != null ? 2 : 0,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//               ),
//               child: Text(
//                 'Continue to Signup',
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class UserTypeOption extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final bool isSelected;
//   final VoidCallback onTap;
//   final Color selectColor;

//   const UserTypeOption({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.isSelected,
//     required this.onTap,
//     required this.selectColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(16),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             decoration: BoxDecoration(
//               color: isSelected ? selectColor.withOpacity(0.1) : Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(
//                 color: isSelected ? selectColor : Colors.grey.withOpacity(0.3),
//                 width: isSelected ? 2 : 1,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: isSelected
//                       ? selectColor.withOpacity(0.2)
//                       : Colors.grey.withOpacity(0.1),
//                   blurRadius: 8,
//                   spreadRadius: 1,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: isSelected ? selectColor : Colors.grey.shade100,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       icon,
//                       color: isSelected ? Colors.white : Colors.black54,
//                       size: 30,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: isSelected ? selectColor : Colors.black87,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           subtitle,
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             color: isSelected
//                                 ? selectColor.withOpacity(0.7)
//                                 : Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (isSelected)
//                     Icon(
//                       Icons.check_circle,
//                       color: selectColor,
//                       size: 28,
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
