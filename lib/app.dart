import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ArithmeticCubit()),
        BlocProvider(create: (context) => StudentCubit()),
        BlocProvider(
            create: (context) => DashboardCubit(
                  context.read<CounterCubit>(),
                  context.read<ArithmeticCubit>(),
                  context.read<StudentCubit>(),
                ))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Bloc",
        home: DashboardView(),
      ),
    );
  }
}
