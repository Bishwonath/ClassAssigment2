import 'package:class_assignment2/cubit/Simpleinterest_cubit.dart';
import 'package:class_assignment2/cubit/dashboard_cubit.dart';
import 'package:class_assignment2/view/Dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide DashboardCubit only once
        BlocProvider(create: (context) => DashboardCubit()),

        // Provide the necessary cubit for SimpleInterestCalculator
        BlocProvider(create: (context) => SimpleInterestCubit()),

        // Other cubits can be added here if necessary, but avoid duplicates
        // For example:
        // BlocProvider(create: (context) => CircleAreaCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Bloc Example",
        home: DashboardView(),
      ),
    );
  }
}
