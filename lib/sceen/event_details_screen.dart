import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EventDetailsScreen extends StatefulWidget {
  String? event;

  String? eventDate;

  String? eventDes;

  String? eventImage;

  String? music;

  EventDetailsScreen(
      {Key? key,
      this.event,
      this.eventDate,
      this.eventDes,
      this.eventImage,
      this.music})
      : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  AudioPlayer? _player;

  @override
  void initState() {
    // TODO: implement initState

    if (widget.music != null && widget.music!.isNotEmpty) {
      _player = AudioPlayer();
      _loadMusic().then((value) {
        if (_player != null) {
          _player!.play();
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    if (widget.music != null && widget.music!.isNotEmpty) {
      if (_player != null) {
        _player!.stop();
        _player!.dispose();
      }
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant EventDetailsScreen oldWidget) {
    // TODO: implement didUpdateWidget

    if (widget.music != null && widget.music!.isNotEmpty) {
      _player = AudioPlayer();
      _loadMusic().then((value) {
        if (_player != null) {
          _player!.play();
        }
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // print("Music url : ${widget.music}");
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
                        child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.eventImage!,
                    )),
                    Positioned(
                      top: 16 * 3,
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
                  widget.event!,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.eventDate!,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Text(
                    widget.eventDes!,
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

  Future _loadMusic() async {
    await _player!.setUrl(widget.music!);
  }
}
