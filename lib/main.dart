import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc/bloc/counter/counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        
        primarySwatch: Colors.blue,
        
        
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  
  

  
  
  
  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBloc _counterBloc = CounterBloc();
  int _counter = 0;

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    _counterBloc.eventSink.add(CounterEvent.Increment);
  }
  void _decrementCounter() {
    _counterBloc.eventSink.add(CounterEvent.Decrement);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        
        title: Text(widget.title),
      ),
      body: Center(
        
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: _counterBloc.counterStream,
               initialData: 0,
              builder: (context, snapshot) {
                int counter = snapshot.data;
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(onPressed: _decrementCounter, tooltip: "Decrement", child: Icon(Icons.remove),),
        ],
      ), 
    );
  }
}
