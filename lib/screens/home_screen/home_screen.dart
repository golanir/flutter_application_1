import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/aticle_screen/artical_screen.dart';
import 'package:flutter_application_1/screens/home_screen/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..fetchData(),
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              String date = DateTime.now().toString();
              String? articalTitle = null;

              if (state is HomeData) {}

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Nir Golan"),
                  Text(date),
                  TextButton(
                      onPressed: articalTitle == null ? null : () {},
                      child: Text(articalTitle ?? "")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                              builder: (context) => const ArticalScreen(),
                            ))
                            .then((value) =>
                                context.read<HomeCubit>().fetchData());
                      },
                      child: const Text("Articlas")),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
