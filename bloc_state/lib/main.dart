import 'package:bloc_state/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<CounterBloc>(
      create: (countext) => CounterBloc(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) => Text(
                state.toString(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () => context.read<CounterBloc>().add(
                            CounterDecrement(),
                          ),
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 25,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () => context.read<CounterBloc>().add(
                            CounterIncrement(),
                          ),
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
