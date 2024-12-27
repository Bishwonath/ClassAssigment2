import 'package:class_assignment2/cubit/Cirlcle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircleAreaView extends StatefulWidget {
  const CircleAreaView({super.key});

  @override
  _CircleAreaViewState createState() => _CircleAreaViewState();
}

class _CircleAreaViewState extends State<CircleAreaView> {
  final TextEditingController _radiusController = TextEditingController();

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
              'Enter the radius of the circle:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            // TextField for manual input of radius
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: _radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Radius',
                  border: OutlineInputBorder(),
                  hintText: 'Enter radius here',
                ),
                onChanged: (value) {
                  // Parse the input and calculate the area
                  final radius = double.tryParse(value);
                  if (radius != null) {
                    context.read<CircleAreaCubit>().setRadius(radius);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            // Display the calculated area
            BlocBuilder<CircleAreaCubit, double>(
              builder: (context, state) {
                return Text(
                  'Area: ${state.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32,
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
