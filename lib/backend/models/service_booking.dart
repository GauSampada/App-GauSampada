import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceBooking {
  final String name;
  final String uid;
  // final Service service;
  final String bookingDate;
  final String location;
  final String timeSlot;
  final String phoneNumber;
  final String? alternateTimeSlot;
  final String? note;
  ServiceBooking(
      {required this.name,
      required this.uid,
      // required this.service,
      required this.bookingDate,
      required this.location,
      required this.phoneNumber,
      this.alternateTimeSlot,
      this.note,
      required this.timeSlot});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      // 'service': service.toString(),
      'bookingDate': bookingDate,
      'location': location,
      'timeSlot': timeSlot,
      'phoneNumber': phoneNumber,
      'note': note ?? '',
      'alternateTimeSlot': alternateTimeSlot ?? '',
    };
  }

  static ServiceBooking fromSnapshot(DocumentSnapshot documentSnapshot) {
    var map = documentSnapshot.data() as Map<String, dynamic>;
    return ServiceBooking(
      name: map['name'] as String,
      uid: map['uid'] as String,
      // service: stringToService(map['service']),
      bookingDate: map['bookingDate'],
      phoneNumber: map['phoneNumber'],
      location: map['location'] as String,
      timeSlot: map['timeSlot'],
      alternateTimeSlot: map['alternateTimeSlot'],
      note: map['note'] ?? '',
    );
  }

  // static Service stringToService(String service) {
  //   return Service.values.firstWhere((e) => e.toString() == service);
  // }

  // static IssueType stringToIssue(String issue) {
  //   return IssueType.values.firstWhere((e) => e.toString() == issue);
  // }

  String toJson() => json.encode(toMap());
}
