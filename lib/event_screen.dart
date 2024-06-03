import 'package:connecto_app/data_handler.dart';
import 'package:connecto_app/templates.dart';
import 'package:connecto_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Events around me",
                  style: headingStyle_1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: inputFieldDecoration,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Featured",
                  style: headingStyle_2,
                ),
                const SizedBox(
                  height: 5,
                ),
                EventPageView(events: fetchFeaturedEvents()),
                const SizedBox(height: 35),
                const Text(
                  "Popular around me",
                  style: headingStyle_2,
                ),
                const SizedBox(
                  height: 5,
                ),
                HorizontalEventList(events: fetchFeaturedEvents())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalEventList extends StatelessWidget {
  const HorizontalEventList({super.key, required this.events});

  final List<EventSummary> events;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: events.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 180,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            events[index].eventName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Row(children: [
                            const Icon(
                              Icons.alarm,
                              size: 14.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(events[index].eventTime)
                          ]),
                          Row(children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 14.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(events[index].eventDate)
                          ]),
                          Row(children: [
                            const Icon(
                              Icons.location_on,
                              size: 14.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                events[index].eventLocation,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class EventPageView extends StatelessWidget {
  EventPageView({super.key, required this.events});

  final List<EventSummary> events;
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView(
            controller: pageController,
            children: List.generate(
              events.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        gradient: const LinearGradient(
                          colors: [Color.fromARGB(155, 0, 0, 0), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment(0, 0.2),
                        ),
                      ),
                    ),
                    Align(
                        alignment: const Alignment(-1, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                events[index].eventName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.alarm,
                                        size: 14.0,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        events[index].eventTime,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        size: 14.0,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        events[index].eventDate,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 14.0,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Text(events[index].eventLocation,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                )
                              ]),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        SmoothPageIndicator(
            controller: pageController,
            count: events.length,
            effect: const WormEffect(
              dotHeight: 6,
              dotWidth: 7,
              type: WormType.thin,
            )),
      ],
    );
  }
}
