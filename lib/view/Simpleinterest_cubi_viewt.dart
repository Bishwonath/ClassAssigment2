import 'package:class_assignment2/cubit/Simpleinterest_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart'


class SimpleInterestCalculator extends StatelessWidget {
  SimpleInterestCalculator({super.key});

  TextEditingController principal = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Principal (P)",
              ),
              controller: principal,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Rate of Interest (R)",
              ),
              controller: rate,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Time (T) in years",
              ),
              controller: time,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                double p = double.tryParse(principal.text) ?? 0;
                double r = double.tryParse(rate.text) ?? 0;
                double t = double.tryParse(time.text) ?? 0;
                context.read<SimpleInterestCubit>().calculateInterest(p, r, t);
              },
              child: Text("Calculate"),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SimpleInterestCubit, String>(
              builder: (context, state) {
                return Text(
                  state,
                  style: const TextStyle(fontSize: 18),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
