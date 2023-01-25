
import 'package:booking/pages/search/seats_grid_page.dart';
import 'package:booking/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

import '../../../providers/flight_provider.dart';

class ListFlights extends StatefulWidget {
  @override
  _ListFlightsState createState() => _ListFlightsState();
}

class _ListFlightsState extends State<ListFlights>
    with TickerProviderStateMixin {
  PageController _cardController = PageController(initialPage: 0);
  List<int> passengers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  int currentPassengers = 1;
  int currentIndex = 0;

  DateTime now = DateTime.now();
  late DateTime dateTime = DateTime(now.year, now.month, now.day);
  @override
  dispose() {
    super.dispose();
    _cardController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flightsAvailable.length,
      itemBuilder: (context, index) {
        return DelayedDisplay(
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: AnimatedContainer(
              height: currentIndex == index ? 134 : 66,
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.fromLTRB(
                  16, 0, 16, index == flightsAvailable.length - 1 ? 80 : 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                  )
                ],
              ),
              child: PageView(
                controller: _cardController,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            flightsAvailable[index].logo!,
                            width: 64,
                          ),
                          SizedBox(width: 16),
                          Container(
                            color: veppoLightGrey,
                            height: 32,
                            width: 1,
                          ),
                          SizedBox(width: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Column(
                                children: [Text(
                                'Select',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ), 
                              Text(
                                "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
],
                               ),
                              Container(width: 70,),
                              Text(
                          '\$ 129,90',
                          style: TextStyle(
                            color: veppoBlue,
                            fontSize: 15,
                          ),
                        ),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: currentIndex == index ? 32 : 0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return veppoLightGrey;
                                return veppoBlue;
                              },
                            ),
                          ),
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                      height: 250,
                                      child: CupertinoDatePicker(
                                        backgroundColor: Colors.white,
                                        initialDateTime: dateTime,
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() {
                                            dateTime = newTime;
                                          });
                                        },
                                        use24hFormat: true,
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    ));
                          },
                          child: Text(
                            'Select Travel date',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.supervised_user_circle,
                            size: 32,
                          ),
                          SizedBox(width: 16),
                          Container(
                            color: veppoLightGrey,
                            height: 32,
                            width: 1,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Passengers',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
                              Text(
                                'Adults (12+)',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 34,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return veppoLightGrey;
                                    return veppoBlue;
                                  },
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SeatsGridPage(
                                        flight: flightsAvailable[index]),
                                  ),
                                );
                              },
                              child: Text(
                                'next step',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      

                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
