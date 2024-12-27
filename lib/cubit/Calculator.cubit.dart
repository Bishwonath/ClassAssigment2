import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<double> {
  CalculatorCubit() : super(0);

  void add(double num1, double num2) => emit(num1 + num2);
  void subtract(double num1, double num2) => emit(num1 - num2);
  void multiply(double num1, double num2) => emit(num1 * num2);
  void divide(double num1, double num2) {
    if (num2 == 0) {
      emit(0); // Or use a custom error state if division by zero
    } else {
      emit(num1 / num2);
    }
  }

  void reset() => emit(0);
}
