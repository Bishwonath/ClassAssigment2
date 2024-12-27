import 'package:class_assignment2/cubit/Cirlcle_cubit.dart';
import 'package:class_assignment2/view/Dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:class_assignment2/cubit/dashboard_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Only the necessary cubit for Dashboard
        BlocProvider(create: (context) => DashboardCubit()), 
         BlocProvider(create: (context) => CircleAreaCubit()),
          BlocProvider(create: (context) => DashboardCubit()),
           BlocProvider(create: (context) => DashboardCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Bloc",
        home: DashboardView(),  // The dashboard will be the initial screen
      ),
    );
  }
}
