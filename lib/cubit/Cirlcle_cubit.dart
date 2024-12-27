import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CircleAreaCubit extends Cubit<double> {
  CircleAreaCubit() : super(100.0); // Default radius

  static const double pi = 3.141592653589793;

  void incrementRadius() {
    double radius = state + 1.0;
    emit(_calculateArea(radius));
  }

  void decrementRadius() {
    if (state > 0) {
      double radius = (state / pi).sqrt() - 1.0; // Reverse area to radius
      emit(_calculateArea(radius));
    }
  }

  void resetRadius() {
    emit(_calculateArea(100.0)); // Reset to default radius of 100
  }

  double _calculateArea(double radius) {
    return pi * radius * radius; // Area calculation
  }
}
