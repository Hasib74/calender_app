import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  String? event;

  String? eventDate;

  String? eventDes;

  String? eventImage;

  EventDetailsScreen(
      {Key? key, this.event, this.eventDate, this.eventDes, this.eventImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(eventImage!))),
                    Positioned(
                      top: 16 * 2,
                      left: 16,
                      child: Container(
                        height: 30,
                        width: 30,
                        child: FloatingActionButton(
                          backgroundColor: Colors.black54,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 17,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  event!,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  eventDate!,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Text(
                    eventDes!,
                    style: TextStyle(fontWeight: FontWeight.w300, height: 1.3),
                  ),
                )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
