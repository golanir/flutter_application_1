import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/aticle_screen/tabs/firstt_sceen/cubit/first_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstCubit()..getData(),
      child: Column(
        children: [
          const Text("Cars"),
          BlocBuilder<FirstCubit, FirstState>(
            builder: (context, state) {
              return const Placeholder();
            },
          )
        ],
      ),
    );
  }
}
