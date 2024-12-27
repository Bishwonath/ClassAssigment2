import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart'

class ArithmeticCubit extends Cubit<int> {
  ArithmeticCubit() : super(0); 

  void add(int num1, int num2) {
    emit(num1 + num2);
  }

  void subtract(int num1, int num2) {
    emit(num1 - num2);
  }

  void multiply(int num1, int num2) {
    emit(num1 * num2);
  }

  void reset() {
    emit(0);
  }
}
