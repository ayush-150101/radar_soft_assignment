import 'package:flutter/material.dart';
import 'package:radar_soft_assignment/models/events.dart';

class InfoScreen extends StatefulWidget {
  Events event;
  InfoScreen({Key? key, required this.event}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Event  Details'),
        elevation: 0,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.qr_code_scanner),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                  widget.event.bannerImage2!,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.eventName!,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.event.startTime!} - ${widget.event.endTime} | ${widget.event.eventLocation}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.share,
                          color: Colors.green,
                          size: 34,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 34,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.event.eventDescription!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.7)),
                ),
              )

            ],
          ),
          Positioned(
            bottom: 10,
            child:Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child:  Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(child: Text('Check In',style: TextStyle(fontSize: 24,color: Colors.white),)),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
