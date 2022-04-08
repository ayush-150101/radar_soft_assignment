import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_soft_assignment/models/events.dart';
import 'package:radar_soft_assignment/screens/info_screen.dart';

class EventCard extends StatefulWidget {
  int eventState;
  Events event;
  EventCard({Key? key, required this.eventState, required this.event})
      : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(InfoScreen(event: widget.event));
      },
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Stack(
            children: [
              //widget.isLive ?
              Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85 / 2,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.event.eventName!.length >= 28
                                      ? (widget.event.eventName!
                                              .substring(0, 26) +
                                          "...")
                                      : widget.event.eventName!,
                                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.event.startDate!,
                                  style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.6)),
                                ),
                                const Text(
                                  'Lorem Ipsum dolor sit amet, consectetur',
                                  style: TextStyle(fontSize: 15),
                                ),
                                 (widget.eventState == 1 || widget.eventState == 2)?Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: widget.eventState == 1?Colors.green:Colors.yellow,
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Text(
                                                  widget.eventState == 1?'Join Now':"Book Now",
                                                  style: TextStyle(
                                                      color: widget.eventState == 1?Colors.white:Colors.black,
                                                      letterSpacing: 2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ):Container(),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85 / 2,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                widget.event.bannerImage1!,
                                fit: BoxFit.fill,
                              )),
                        )
                      ],
                    ),
                  /*: Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image.network(
                                widget.event.bannerImage1!,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.event.eventName!.length >= 28
                                    ? (widget.event.eventName!.substring(0, 26) +
                                        "...")
                                    : widget.event.eventName!,
                                style:
                                    const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 90,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Stack(
                                  children: const [
                                    Center(
                                      child: Text(
                                        'Book Now',
                                        style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),*/
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                  child: widget.eventState == 1
                      ? Container(
                          width: 70,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Stack(
                            children: [
                              const Center(
                                child: Text(
                                  'LIVE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                ),
                              ),
                              Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
