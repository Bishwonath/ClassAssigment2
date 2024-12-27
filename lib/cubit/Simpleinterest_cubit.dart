
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubit extends Cubit<String> {
  SimpleInterestCubit() : super("Enter values to calculate Simple Interest");

  void calculateInterest(double principal, double rate, double time) {
    if (principal <= 0 || rate <= 0 || time <= 0) {
      emit("Please enter valid positive numbers for P, R, and T.");
    } else {
      double simpleInterest = (principal * rate * time) / 100;
      emit("Simple Interest: $simpleInterest");
    }
  }
}
