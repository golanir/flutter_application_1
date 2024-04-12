import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/article_screen/tabs/firstt_sceen/first_tab_screen.dart';
import 'package:flutter_application_1/screens/article_screen/tabs/second_screen/second_tab_screen.dart';

class ArticalScreen extends StatelessWidget {
  const ArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: controller,
            children: const [
              FirstTabScreen(),
              SecondTabScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
