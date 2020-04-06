import 'package:flutter/material.dart';


class track_progress extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Color hexToColor(String code) {

      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to Flutter",
        home: new Material(
            child: new Container (
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: new Container(
                  child: new Center(
                      child: new Column(
                          children : [
                            new Padding(padding: EdgeInsets.only(top: 40.0)), //top: 140.0)
                            new Text('Track Progress',
                              style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                            new Padding(padding: EdgeInsets.only(top: 50.0)),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Enter Matriculation",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 40.0)),
                            new Padding(padding: EdgeInsets.only(top: 40.0)),
                            new RaisedButton(
                              onPressed: () {

//                              }
                              },
                              child: Text('Submit'),
                            ),
                          ]
                      )
                  ),
                )
            )
        )
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              // Add TextFormFields and RaisedButton here.
            ]
        )
    );
  }
}





















//List<String> matriculation_list =
//[
//  "U1823850A",
//  "U1823850B",
//  "U1823850C",
//  "U1823850D",
//  "U1823850E",
//  "U1823850F",
//  "U1823850G",
//  "U1823850H",
//  "U1823850I",
//  "U1823850J",
//  "U1823850K",
//  "U1823850L",
//  "U1823850M",
//  "U1823850N",
//  "U1823850O",
//  "U1823850P",
//  "U1823850Q",
//  "U1823850R",
//  "U1823850S",
//  "U1823850T",
//  "U1823850U",
//  "U1823850V",
//  "U1823850W",
//  "U1823850X",
//  "U1823850Y",
//  "U1823850Z",
////  "Matric no. 6",
//];
//
////matriculation_list[index]
//
//
////https://blog.usejournal.com/flutter-search-in-listview-1ffa40956685
//
//class MyApp_search extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        title: 'Flutter Demo',
//        theme: new ThemeData(
//        primarySwatch: Colors.blue,
//    ),
//    home: new MyHomePage(title: 'Track Progress'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController editingController = TextEditingController();
//
////  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//  final duplicateItems = List<String>.generate(matriculation_list.length, (i) => matriculation_list[i]);
////  final duplicateItems = List<String>.generate(matriculation_list.length, (i) => matriculation_list[1]);
////  itemCount:
//  var items = List<String>();
//
//  @override
//  void initState() {
//    items.addAll(duplicateItems);
//    super.initState();
//  }
//
//  void filterSearchResults(String query) {
//    List<String> dummySearchList = List<String>();
//    dummySearchList.addAll(duplicateItems);
//    if(query.isNotEmpty) {
//      List<String> dummyListData = List<String>();
//      dummySearchList.forEach((item) {
//        if(item.contains(query)) {
//          dummyListData.add(item);
//        }
//      });
//      setState(() {
//        items.clear();
//        items.addAll(dummyListData);
//      });
//      return;
//    } else {
//      setState(() {
//        items.clear();
//        items.addAll(duplicateItems);
//      });
//    }
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: TextField(
//                onChanged: (value) {
//                  filterSearchResults(value);
//                },
//                controller: editingController,
//                decoration: InputDecoration(
//                    labelText: "Enter Matriculation Number",
//                    hintText: "Enter Matriculation Number",
//                    prefixIcon: Icon(Icons.search),
//                    border: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//              ),
//            ),
//            Expanded(
//              child: ListView.builder(
//                shrinkWrap: true,
//                itemCount: items.length,
//                itemBuilder: (context, index) {
//                  return ListTile(
//                    title: Text('${items[index]}'),
//                  );
//                },
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}