import 'package:flutter/material.dart';
import 'package:ssadpro/view/appbar.dart';

//////////////////////////////////////////////////////////////////////////////////////////////////

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //       child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Example App'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             text: "Home",
    //             icon: Icon(Icons.home),
    //           ),
    //           Tab(
    //             text: "Example page",
    //             icon: Icon(Icons.help),
    //           )
    //         ],
    //       ),
    //     ),

    return Scaffold(
//      appBar: ReusableWidgets.getAppBar(
//          "Assessment History", Colors.grey[50], Colors.blue[600]),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
               title: Text('Assessment History'),
              centerTitle: true,
              backgroundColor: Colors.blue[600],
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                indicatorColor: Colors.grey[50],
                tabs: <Widget>[
                  Tab(
                    text: "Current",
                    icon: Icon(Icons.offline_bolt),
                  ),
                  Tab(
                    text: "History",
                    icon: Icon(Icons.history),
                  )
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            PageOne(),
            PageTwo(),
          ],
          controller: _tabController,
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.control_point),
//        onPressed: () {
//          _tabController.animateTo(1,
//              curve: Curves.bounceInOut, duration: Duration(milliseconds: 20));
//
//          // _scrollViewController.animateTo(
//          //     _scrollViewController.position.minScrollExtent,
//          //     duration: Duration(milliseconds: 1000),
//          //     curve: Curves.decelerate);
//
//          _scrollViewController
//              .jumpTo(_scrollViewController.position.maxScrollExtent);
//        },
//      ),
    );
  }
}

List<String> current_assignment_list = [
  "\nCourse : SSAD\nAssignment Name : Lab Test 1\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 2\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 3\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 4\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 5\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 6\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 7\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 8\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 9\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 10\nTopic : abc\nDeadline  : dd-mm-yyy\n",
];

List<String> history_assignment_list = [
  "\nCourse : SSAD\nAssignment Name : Lab Test 1\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 2\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 3\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 4\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 5\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 6\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 7\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 8\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 9\nTopic : abc\nDeadline  : dd-mm-yyy\n",
  "\nCourse : SSAD\nAssignment Name : Lab Test 10\nTopic : abc\nDeadline  : dd-mm-yyy\n",
];

class PageOne extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: current_assignment_list.length,
//      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(20.0),
          color: index % 2 == 0 ? Colors.greenAccent : Colors.lightGreenAccent,
          child: Center(
            child: Text(current_assignment_list[index],
                style: TextStyle(fontSize: 15)),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history_assignment_list.length,
//      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(15.0),
          color: index % 2 == 0 ? Colors.orangeAccent : Colors.deepOrange,
          child: Center(
            child: Text(history_assignment_list[index],
                style: TextStyle(fontSize: 15)),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////    ROUGH    /////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//class PageTwo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemExtent: 250.0,
//      itemBuilder: (context, index) => Container(
//        padding: EdgeInsets.all(10.0),
//        child: Material(
//          elevation: 4.0,
//          borderRadius: BorderRadius.circular(5.0),
//          color: index % 2 == 0 ? Colors.orangeAccent : Colors.deepOrange,
//          child: Center(
//            child: Text(index.toString()),
//          ),
//        ),
//      ),
//    );
//  }
//}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////    PageOne    ///////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//class PageOne extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Center(
//            child: Text("First"),
//          ),
//          Center(
//            child: Text("Second"),
//          ),
//          Center(
//            child: Text("Third"),
//          ),
////          Container(
////          padding: EdgeInsets.all(10.0),
//          Material
//            (
////                BorderRadiusGeometry: borderRadius,
////                shape: CircleBorder(),
////                shape: StadiumBorder(),
////                borderRadius: BorderRadius.circular(10)
//            elevation: 4.0,
//            borderRadius: BorderRadius.circular(5.0),
//            color: Colors.orangeAccent,
//
//            child: Center(
//              child: Text( "Text"),
//            ),
//
//          )
//
//        ],
//      ),
//    );
//  }
//}

//import 'package:dashboard/dashboard.dart';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: SecondRoute(), // Dashboard(), FirstRoute
//    );
//  }
//}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////    Dashboard  ///////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//class Dashboard extends StatefulWidget {
//  @override
//  _DashboardState createState() => _DashboardState();
//}
//
//class _DashboardState extends State<Dashboard> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Instructor Dashboard"),
//        centerTitle: true,
//        elevation: .1,
//        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
//      ),
//
//      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),   // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//        child: GridView.count(
//          crossAxisCount: 2,
//          padding: EdgeInsets.all(3.0),
//          children: <Widget>[
//            makeDashboardItem("Profile", Icons.person),
//            makeDashboardItem("Create Student Group", Icons.group_add),
//            makeDashboardItem("Send Assignment", Icons.send),
//            makeDashboardItem("Track Progess", Icons.trending_up),
//            makeDashboardItem("Assesment History", Icons.assignment),
//            makeDashboardItem("Log Out", Icons.alarm)
//          ],
//        ),
//      ),
//
//    );
//  }
//}
//
//
//Card makeDashboardItem(String title, IconData icon) {
//  return Card(
//      elevation: 1.0,
//      margin: new EdgeInsets.all(8.0),
//      child: Container(
//        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
//        child: new InkWell(
//          onTap: () {},
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisSize: MainAxisSize.min,
//            verticalDirection: VerticalDirection.down,
//            children: <Widget>[
//              SizedBox(height: 50.0, width: 80.0),
//              Center
//                (
//                  child: Icon
//                    (
//                    icon,
//                    size: 40.0,
//                    color: Colors.black,
//                  )
//              ),
//              SizedBox(height: 20.0, width: 80.0),
//              new Center(
//                child: new Text(title,
//                    style:
//                    new TextStyle(fontSize: 18.0, color: Colors.black)),
////                    new TextStyle(fontSize: 18.0, color: Colors.black)),
//
//              )
//            ],
//          ),
//        ),
//      )
//  );
//}
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////    FirstRoute  //////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//class FirstRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('ok Route'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Open route'),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondRoute()),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}
///////////////////////////////////    Assignment_History
//FixedExtentScrollController fixedExtentScrollController =
//new FixedExtentScrollController();
//
//class SecondRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("Assignment History"),
//          centerTitle: true,
//          elevation: .1,
//          backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
//        ),
//        body:
//
//        Container(
//            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 117.714285714),
//            decoration: BoxDecoration(),
////    child: Center(
//            child:
//            ListWheelScrollView(
//              controller: fixedExtentScrollController,
//              physics: FixedExtentScrollPhysics(),
////            children: monthsOfTheYear.map((month) {
////              return Card(
////                  child: Row(
////                children: <Widget>[
////                  Expanded(
////                      child: Padding(
////                    padding: const EdgeInsets.all(8.0),
////                    child: Text(
////                      month,
////                      style: TextStyle(fontSize: 18.0),
////                    ),
////                  )),
////                ],
////              ));
////            }).toList(),
//              itemExtent: 60.0,
//            )
//
//
////    )
////            child:
////      Wrap(
////        alignment: WrapAlignment.center,
//////        spacing: 100,
//////        runSpacing: 20,
////        children:
////        <Widget>
////        [
////          RaisedButton(
////          onPressed: () {
////            Navigator.pop(context);
////          }, child: Text("Current")
////
////          ),
////          RaisedButton(
////              onPressed: () {
////                Navigator.pop(context);
////              }, child: Text("Past")
////          ),
////        ],
////
////      ),
//
//
//        )
//    );
//  }
//}
//
//
//
//class FirstRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Route'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Open route'),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondRoute()),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}
