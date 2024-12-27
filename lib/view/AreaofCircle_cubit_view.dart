import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CircleAreaView extends StatelessWidget {
  const CircleAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Area Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The area of the circle with radius:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<CircleAreaCubit, double>(
              builder: (context, state) {
                return Text(
                  '${state.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32, // Specify the font size here
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => context.read<CircleAreaCubit>().incrementRadius(),
            tooltip: 'Increase Radius',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CircleAreaCubit>().decrementRadius(),
            tooltip: 'Decrease Radius',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CircleAreaCubit>().resetRadius(),
            tooltip: 'Reset Radius',
            child: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
