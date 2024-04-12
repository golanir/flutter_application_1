import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/list_tile_model.dart';
import 'package:flutter_application_1/screens/article_screen/tabs/firstt_sceen/cubit/first_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstCubit()..getData(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Cars",
              style: TextStyle(),
            ),
            BlocBuilder<FirstCubit, FirstState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const LinearProgressIndicator();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            BlocBuilder<FirstCubit, FirstState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state.data.isNotEmpty) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) =>
                          ListTileModel(data: state.data[index]));
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
