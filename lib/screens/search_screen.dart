import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatelessWidget {
  final String appTitle;

  const SearchScreen({Key? key, required this.appTitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(51),
      child: AppBar(
          backgroundColor: Color(0xff141416),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
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
