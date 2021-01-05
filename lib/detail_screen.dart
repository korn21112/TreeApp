import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:test_tree/plant.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';
//import 'package:fl_chart/fl_chart.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class DetailScreen extends StatefulWidget {
  final Plant plant ;


  DetailScreen({
    Key key,
    this.plant
  }):super(key:key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static DateTime date = DateTime.now();
  String dateFormat = DateFormat('EEEE').format(date);
  double rating = 0;

  void _onPress(){
    setState(() {
      //rating = 1;
      Navigator.pop(context);
    });
  }

  Color _renderColor(double pos){
    if(pos>rating){
      return Colors.black54;
    }

    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey[800],
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: _onPress,
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30,top: 10),
                child: Text(
                  'Greenhouse#1',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.only(left: 30,top: 10),
                child: Text(
                  widget.plant.name,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 300,
                child: Image.asset(widget.plant.image)
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                          Text(widget.plant.height.toString())
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'WATER',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                          Text(widget.plant.water)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                          Text(widget.plant.age.toString())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 1000,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Watering Schedule',
                        style: TextStyle(
                          fontSize: 15
                        ),
                        textAlign: TextAlign.start,
                      ),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Icon(
                                      MdiIcons.record,
                                      color: _renderColor(0),
                                    )
                                ),
                                Expanded(
                                    child: Icon(
                                      MdiIcons.water,
                                      color: _renderColor(1/6),
                                    )
                                ),
                                Expanded(
                                    child: Icon(
                                      MdiIcons.record,
                                      color: _renderColor(2/6),
                                    )
                                ),
                                Expanded(
                                    child: Icon(
                                      MdiIcons.water,
                                      color: _renderColor(3/6),
                                    )
                                ),
                                Expanded(
                                    child: Icon(
                                      MdiIcons.record,
                                      color: _renderColor(4/6),
                                    )
                                ),
                                Expanded(
                                    child: Icon(
                                      MdiIcons.water,
                                      color: _renderColor(5/6),
                                    )
                                ),
                                Expanded(
                                    child: Icon(
                                      MdiIcons.record,
                                      color: _renderColor(6/6),
                                    )
                                ),
                              ],
                            ),
                          ),
                          Slider(
                            activeColor: Colors.teal,
                            value: rating,
                            onChanged:
                                (newRating){
                              setState(() => rating = newRating);
                              print('$rating');
                            },
                            divisions: 6,
                          ),
                          Container(
                            //padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'M',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                      'T',
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    child: Text(
                                      'W',
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    child: Text(
                                      'T',
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    child: Text(
                                      'F',
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    child: Text(
                                      'S',
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    child: Text(
                                      'S',
                                      textAlign: TextAlign.center,
                                    )
                                ),
                              ],),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Growth',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 20),
                          ),
                          Container(
                            child: sample3(context),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

Widget sample3(BuildContext context) {
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  return Center(
    child: Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(

        fromDate: fromDate,
        bezierChartScale: BezierChartScale.WEEKLY,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            lineColor: Colors.teal,
            label: "cm",
            onMissingValue: (dateTime) {
              if (dateTime.day.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: [
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          //bubbleIndicatorColor: Colors.teal,
          //backgroundColor: Colors.red,
          xAxisTextStyle: TextStyle(
            color: Colors.black54
          ),
          footerHeight: 40.0,
        ),
      ),
    ),
  );
}
