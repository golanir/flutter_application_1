import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/constants.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_application_1/screens/article_screen/artical_screen.dart';
import 'package:flutter_application_1/screens/home_screen/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..updateData(),
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Nir Golan"),
                  Text(state.dateTime.toString()),
                  TextButton(
                      onPressed: state.lastArticalTitle.isEmpty
                          ? null
                          : () async {
                              final articalUrl = (await sharedPrefs)
                                  .getString(Constants.lastItemUrl);
                              if (articalUrl != null && articalUrl.isNotEmpty) {
                                final uri = Uri.parse(articalUrl);
                                if (await canLaunchUrl(uri)) {
                                  launchUrl(uri);
                                }
                              }
                            },
                      child: Text(state.lastArticalTitle)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                              builder: (context) => const ArticalScreen(),
                            ))
                            .then((value) =>
                                context.read<HomeCubit>().updateData());
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
