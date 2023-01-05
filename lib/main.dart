import 'package:bloc_tutorial/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Bloc State'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is a simple app in flutter which uses Bloc and Cubit state management',
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                color: Colors.grey[700],
                iconSize: 20,
              ),
              VerticalDivider(
                color: Colors.grey[500],
              ),
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                );
              }),
              VerticalDivider(
                color: Colors.grey[500],
              ),
              IconButton(
                icon: Icon(Icons.add_outlined),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                color: Colors.grey[700],
                iconSize: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
