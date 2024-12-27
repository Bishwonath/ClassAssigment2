import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// Import math library for sqrt function
import 'dart:math';

class CircleAreaCubit extends Cubit<double> {
  CircleAreaCubit() : super(0.0); // Initial area is 0 when radius is 0

  // Set the radius directly from the user input
  void setRadius(double radius) {
    emit(radius * radius * 3.14159); // Calculate the area based on radius
  }

  // Increase radius by 1
  void incrementRadius() {
    final newRadius =
        sqrt(state / pi) + 1; // Calculate the new radius from area
    emit(newRadius * newRadius * 3.14159);
  }

  // Decrease radius by 1
  void decrementRadius() {
    final newRadius = sqrt(state / pi);
    if (newRadius > 1) {
      emit((newRadius - 1) *
          (newRadius - 1) *
          3.14159); // Calculate the new area
    }
  }

  // Reset radius to 0
  void resetRadius() {
    emit(0.0); // Reset area to 0
  }
}
