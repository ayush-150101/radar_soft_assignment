import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_calls/https_service.dart';
import 'package:radar_soft_assignment/models/events.dart';

import '../widgets/live_event_card.dart';

class EventsController extends GetxController {
  HttpService service = HttpService();

  int count = 0;

  List<Events>? events = [];
  List<EventCard> liveEvents = [];
  List<EventCard> upcomingEvents = [];
  List<EventCard> pastEvents = [];
  RxBool isEventsLoaded = false.obs;

  void fetchEventsList() async {
    events = (await service.getEventsList())!;

    var currentDate = DateTime.now();

    for (int i = 0; i < events!.length; i++) {
      String startD = events![i].startDate! + " " + events![i].startTime!;
      String endD = events![i].endDate! + " " + events![i].endTime!;

      var start = DateTime.parse(startD);
      var end = DateTime.parse(endD);

      print('Date: ${start}');
      if (end.isAfter(currentDate) && start.isBefore(currentDate)) {
        liveEvents.add(EventCard(
          eventState: 1,
          event: events![i],
        ));
      }

      if (start.isAfter(currentDate)) {
        upcomingEvents.add(EventCard(
          eventState: 2,
          event: events![i],
        ));
      }

      if (end.isAfter(currentDate)){
        pastEvents.add(EventCard(
          eventState: 3,
          event: events![i],
        ));
      }

    }

    isEventsLoaded.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    fetchEventsList();
  }
}
