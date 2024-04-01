import 'package:flutter/material.dart';
import '/presentation/ui/search_screen.dart';

class SearchScreenLayout extends StatelessWidget {
  const SearchScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.25),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Search(),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
