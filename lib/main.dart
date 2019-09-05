import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var records = List<String>.generate(20, (index) => "Record : $index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar in Flutter'),
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(records[index]),
            trailing: Container(
              width: 40,
              child: FlatButton(
                child: Icon(
                  Icons.delete,
                  color: Colors.purple,
                ),
                onPressed: () {
                  showSnackBar(context, index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void showSnackBar(BuildContext context, int index) {
    var deletedRecord = records[index];
    setState(() {
      records.removeAt(index);
    });
    SnackBar snackBar = SnackBar(
      content: Text('Deleted $deletedRecord'),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          // print('Undo Delete of $message');
          setState(() {
            records.insert(index, deletedRecord);
          });
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
