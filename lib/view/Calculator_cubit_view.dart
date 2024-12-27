import 'package:class_assignment2/cubit/Calculator.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: BlocProvider(
        create: (_) => CalculatorCubit(),
        child: const CalculatorView(),
      ),
    );
  }
}

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController num1Controller = TextEditingController();
    final TextEditingController num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            BlocBuilder<CalculatorCubit, double>(
              builder: (context, result) {
                return Text(
                  'Result: $result',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(num1Controller.text) ?? 0;
                    final num2 = double.tryParse(num2Controller.text) ?? 0;
                    context.read<CalculatorCubit>().add(num1, num2);
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(num1Controller.text) ?? 0;
                    final num2 = double.tryParse(num2Controller.text) ?? 0;
                    context.read<CalculatorCubit>().subtract(num1, num2);
                  },
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(num1Controller.text) ?? 0;
                    final num2 = double.tryParse(num2Controller.text) ?? 0;
                    context.read<CalculatorCubit>().multiply(num1, num2);
                  },
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(num1Controller.text) ?? 0;
                    final num2 = double.tryParse(num2Controller.text) ?? 0;
                    if (num2 != 0) {
                      context.read<CalculatorCubit>().divide(num1, num2);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Division by zero is not allowed!')),
                      );
                    }
                  },
                  child: const Text('Divide'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CalculatorCubit>().reset();
                    num1Controller.clear();
                    num2Controller.clear();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
