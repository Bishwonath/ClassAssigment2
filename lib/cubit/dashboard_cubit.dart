import 'package:class_assignment2/cubit/Simpleinterest_cubit.dart';
import 'package:class_assignment2/view/AreaofCircle_cubit_view.dart';
import 'package:class_assignment2/view/Calculator_cubit_view.dart';
import 'package:class_assignment2/view/Simpleinterest_cubi_viewt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit() : super(null);

void openSimpleInterestCalculatorView(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => SimpleInterestCubit(), // Provide the appropriate cubit
        child: SimpleInterestCalculator(), // Pass the widget
      ),
    ),
  );
}

  // Method to open Circle Area Calculator
  void openCircleAreaView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CircleAreaView(),
      ),
    );
  }

  // Method to open Calculator View
  void openCalculatorView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CalculatorView(),
      ),
    );
  }

}

