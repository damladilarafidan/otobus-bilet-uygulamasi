import 'package:booking/pages/search/widgets/list_flights.dart';
import 'package:booking/pages/search/widgets/search_results.dart';
import 'package:booking/utils/consts.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:flutter/material.dart';

const List<String> list = <String>['Ankara', 'Two', 'Three', 'Four'];
const List<String> from = <String>['Samsun', 'Two', 'Three', 'Four'];

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  String dropdownValue = list.first;
  String dropdownValue1 = from.first;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: homeTabs.length, vsync: this);
    _tabController!.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      tabIndex = _tabController!.index;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  bool searchSelected = false;
  TabController? _tabController;
  int tabIndex = 0;
  bool changeFromTo = false;

  List<Tab> homeTabs = [
    Tab(text: 'One Way'),
    Tab(text: 'Round Trip'),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> tabViews = [
      Container(
        color: Colors.white,
        child: Center(
          child: Text('One Way Tab'),
        ),
      ),
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: searchSelected ? SearchResults() : ListFlights()),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: veppoBlue,
      body: Padding(
        padding: EdgeInsets.only(top: 52),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: veppoBlue,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: tabViews,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(.0),
                    height: (MediaQuery.of(context).size.height * 0.25) - 20,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    changeFromTo
                                        ? DelayedDisplay(
                                            child: DropdownButton<String>(
                                            value: dropdownValue,
                                           /*  icon: const Icon(
                                                Icons.arrow_downward), */
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            /* underline: Container(
                                              height: 2,
                                              color: Colors.white,
                                            ), */
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                dropdownValue = value!;
                                              });
                                            },
                                            items: list
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ))
                                        : DelayedDisplay(
                                            child: DropdownButton<String>(
                                              value: dropdownValue1,
                                              /* icon: const Icon(
                                                  Icons.arrow_downward), */
                                              elevation: 16,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              /* underline: Container(
                                                height: 2,
                                                color: Colors.white,
                                              ), */
                                              onChanged: (String? value) {
                                                // This is called when the user selects an item.
                                                setState(() {
                                                  dropdownValue1 = value!;
                                                });
                                              },
                                              items: from.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                    Text(
                                      'From',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                !searchSelected
                                    ? Container(
                                        width: 1,
                                        height: 32,
                                        color: Colors.white.withOpacity(0.4),
                                      )
                                    : Container(),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    changeFromTo
                                        ? DelayedDisplay(
                                            child: DropdownButton<String>(
                                              value: dropdownValue1,
                                              //icon: const Icon(Icons.arrow_downward),
                                              elevation: 16,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                             /*  underline: Container(
                                                height: 2,
                                                color: Colors.white,
                                              ), */
                                              onChanged: (String? value) {
                                                // This is called when the user selects an item.
                                                setState(() {
                                                  dropdownValue1 = value!;
                                                });
                                              },
                                              items: from.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          )
                                        : DelayedDisplay(
                                            child: DropdownButton<String>(
                                            value: dropdownValue,
                                            /* icon: const Icon(
                                                Icons.arrow_downward), */
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.black),
                                           /*  underline: Container(
                                              height: 2,
                                              color: Colors.white,
                                            ), */
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                dropdownValue = value!;
                                              });
                                            },
                                            items: list
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          )),
                                    Text(
                                      'to',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                !searchSelected
                                    ? Container(
                                        width: 1,
                                        height: 32,
                                        color: Colors.white.withOpacity(0.4),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                        searchSelected
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 14),
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        changeFromTo = !changeFromTo;
                                      });
                                    },
                                    child: Center(
                                      child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Icon(
                                          Icons.compare_arrows_sharp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  searchSelected
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Icon(
                                  Icons.filter_alt_outlined,
                                  color: veppoBlue,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.fromLTRB(11, 0, 11, 0),
                          height: 52,
                          child: Stack(
                            children: [
                              Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: 44,
                                width: (MediaQuery.of(context).size.width / 2) -
                                    26,
                                margin: EdgeInsets.fromLTRB(
                                    tabIndex == 1
                                        ? (MediaQuery.of(context).size.width /
                                                2) -
                                            26
                                        : 4,
                                    4,
                                    tabIndex == 4
                                        ? (MediaQuery.of(context).size.width /
                                                2) -
                                            26
                                        : 4,
                                    4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 52,
                                width: MediaQuery.of(context).size.width,
                                child: TabBar(
                                  labelColor: veppoBlue,
                                  unselectedLabelColor: veppoLightGrey,
                                  indicatorColor: Colors.transparent,
                                  controller: _tabController,
                                  onTap: (index) {
                                    setState(() {
                                      tabIndex = index;
                                    });
                                  },
                                  tabs: homeTabs,
                                ),
                              ),
                            ],
                          ),
                        ),
                  Spacer(),
                  _tabController!.index == 1
                      ? DelayedDisplay(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  searchSelected = !searchSelected;
                                });
                              },
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: Text(
                                  searchSelected ? 'Back' : 'Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
