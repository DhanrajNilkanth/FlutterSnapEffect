import 'package:flutter/material.dart';
import 'package:snappable/snappable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SnapDemo(),
    );
  }
}

class SnapDemo extends StatefulWidget {
  @override
  _SnapDemoState createState() => _SnapDemoState();
}

class _SnapDemoState extends State<SnapDemo> {
  
  final _key1 = GlobalKey<SnappableState>();
  final _key2 = GlobalKey<SnappableState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snap Effect Demo'),
      ),
      body: Column(
        children: [
          Snappable(
            key: _key1,
              child:Container(
                height: 120,
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.red,
                child: Image.asset('assets/netflix.png'),
              ),
            snapOnTap: true,
          ),
          SizedBox(height: 5,),
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.yellowAccent,
            child: Text('This will not snap',style: TextStyle(fontSize: 20.0),),
          ),
          SizedBox(height: 5,),
          Snappable(
            key: _key2,
            child:Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.green,
              child: Image.asset('assets/prime.png'),
            ),
            snapOnTap: true,
          ),
          SizedBox(height: 10,),
          RaisedButton(
            child: Text('Snap / Revers'),
              onPressed: (){
                SnappableState state1 = _key1.currentState;
                SnappableState state2 = _key2.currentState;
                if(state2.isGone && state1.isGone){
                  state1.reset();
                  state2.reset();
                }else{
                  state1.snap();
                  state2.snap();
                }
              }
          ),
        ],
      ),
    );
  }
}

















