import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  final controller_name = TextEditingController();
  List<String> items = ['jinal', 'shah', 'flutter'];
  void onButtonClick() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Application'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Value of count is $count',
              style: TextStyle(fontSize: 38.0),
            ),
            RaisedButton(
              child: Text('Click Me'),
              onPressed: onButtonClick,
              // onPressed: (){
              //   setState(() {
              //      count++;
              //   });

              //   print('you pressed button $count times');
              // },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter Name'),
              keyboardType: TextInputType.text,
              controller: controller_name,
            ),
            RaisedButton(
              child: Text('Add Name'),
              onPressed: () {
                setState(() {
                  items.add(controller_name.text);
                });
                
              },
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  String currentItem = items[index];
                  return ListTile(
                    title: Text(currentItem),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          items.remove(currentItem);
                        });
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
