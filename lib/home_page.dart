import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/counter_cubit.dart';
import 'package:statemanagement/counter_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Increment"),
                  duration: Duration(microseconds: 300),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Decrement"),
                  duration: Duration(microseconds: 300),
                ));
              }
            },
            builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).decrement(),
                tooltip: "Decrement",
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).increment(),
                tooltip: "Increment",
                child: const Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}
