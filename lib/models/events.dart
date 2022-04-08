import 'package:flutter/material.dart';

class Events{

  late String? eventName;
  late String? eventDescription;
  late String? bannerImage1;
  late String? bannerImage2;
  late String? eventLocation;
  late String? startDate;
  late String? endDate;
  late String? startTime;
  late String? endTime;

  Events({this.eventName,this.eventDescription,this.bannerImage1,this.bannerImage2,this.eventLocation,this.startDate,this.endDate,this.startTime,this.endTime});

  factory Events.fromJson(Map<String, dynamic> json){
    try{
      return Events(
        eventName: json['eventName'],
        eventDescription: json['eventDescription'],
        bannerImage1: json['event_banner_img1'],
        bannerImage2: json['event_banner_img2'],
        eventLocation: json['eventLocation'],
        startDate: json['eventStartdate'],
        endDate: json['eventEnddate'],
        startTime: json['eventStarttime'],
        endTime: json['eventEndtime'],
      );
    }catch(e){
      print('Error: $e');
      return Events(
        eventName: null,
        eventDescription: null,
        bannerImage1: null,
        bannerImage2: null,
        eventLocation:null,
      );
    }
  }

}