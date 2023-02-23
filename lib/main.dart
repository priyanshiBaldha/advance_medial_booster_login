import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashbord.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pres = await SharedPreferences.getInstance();
  remember = pres.getBool('remember') ?? false;

  await pres.setBool('remember', remember);

  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: (remember == false) ? '/' : 'dasbord',
        routes: {
          '/': (context) => home(),
          'dasbord': (context) => dasbord(),
        }),
  );
}

bool remember = false;
Color mycolor = Colors.grey;
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailcontroller.clear();
    passwordcontroller.clear();
    remember = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LogIn"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  label: Text("Enter You Email"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: passwordcontroller,
              decoration: InputDecoration(
                  label: Text("Enter You Password"),
                  border: OutlineInputBorder()),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Remember",
                style: TextStyle(color: mycolor),
              ),
              value: remember,
              onChanged: (val) {
                setState(() {
                  remember = val!;
                  if (remember == true) {
                    setState(() {
                      mycolor = Colors.blue;
                    });
                  } else if (remember == false) {
                    setState(() {
                      mycolor = Colors.grey;
                    });
                  }
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  if (emailcontroller.text == "piyu" &&
                      passwordcontroller.text == "piyu") {
                    if (remember == true) {
                      SharedPreferences pres =
                      await SharedPreferences.getInstance();
                      pres.setBool('remember', true);
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('dasbord', (route) => false);
                    } else {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('dasbord', (route) => false);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You Email And Password Is Worg"),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                child: Text("save"),)
          ],
        ),
      ),
    );
  }
}