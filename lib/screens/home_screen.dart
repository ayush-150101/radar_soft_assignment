import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar_soft_assignment/api_calls/https_service.dart';
import 'package:radar_soft_assignment/models/events.dart';
import 'package:radar_soft_assignment/widgets/exit_popup.dart';
import 'package:radar_soft_assignment/widgets/live_event_card.dart';
import 'package:get/get.dart';

import '../controllers/events_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventsController());
    return GetX<EventsController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
          body: controller.isEventsLoaded.value?Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Colors.green,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.white,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.liveEvents,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Text(
                        'Upcoming Events',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    CarouselSlider(
                      items: controller.upcomingEvents,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: false,
                          height: MediaQuery.of(context).size.height * 0.25 + 10,
                          enlargeCenterPage: false,
                          aspectRatio: 1,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DotsIndicator(
                          dotsCount: controller.upcomingEvents.length,
                          position: _currentIndex.toDouble(),
                          decorator: const DotsDecorator(
                            color: Colors.grey, // Inactive color
                            activeColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.pastEvents,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ):const Center(child: CircularProgressIndicator(),),
        ),
      );
    });
  }
}
