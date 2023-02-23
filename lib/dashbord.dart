import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dasbord extends StatefulWidget {
  const dasbord({Key? key}) : super(key: key);

  @override
  State<dasbord> createState() => _dasbordState();
}

class _dasbordState extends State<dasbord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dasbord"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences pres = await SharedPreferences.getInstance();
                pres.remove('remember');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              icon: Icon(Icons.power_settings_new_outlined))
        ],
      ),
    );
  }
}