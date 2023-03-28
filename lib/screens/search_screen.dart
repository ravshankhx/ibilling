import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String appTitle;

  const SearchScreen({Key? key, required this.appTitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(51),
      child: AppBar(
          backgroundColor: const Color(0xff141416),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: const [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.add,
            ),
            SizedBox(
              width: 24,
            ),
          ],
          elevation: 0,
          title: Form(
            child: TextFormField(),
          )),
    ),
    body:   Center(
      child: Container()
    ),
    );
  }
}
