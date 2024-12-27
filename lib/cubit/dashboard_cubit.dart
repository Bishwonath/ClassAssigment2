import 'package:class_assignment2/view/AreaofCircle_cubit_view.dart';
import 'package:class_assignment2/view/Calculator_cubit_view.dart';
import 'package:class_assignment2/view/Simpleinterest_cubi_viewt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit() : super(null);

  // Method to open Simple Interest Calculator
  void openSimpleInterestCalculatorView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SimpleInterestCalculator(),
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

