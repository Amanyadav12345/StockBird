import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Stock Bird';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text(appTitle) ,
        ),
        body: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";

  void _submit() {
    // you can write your
    // own code according to
    // whatever you want to submit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Sending Message"),

                            ));
                      };
                    }),
                  // this is where the
                  // input goes
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty && value.length<5){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Make a valid password"),
                        ));

                      }

                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text("submit"),
                  ),
                ],
              ),
            ),
            // this is where
            // the form field
            // are defined
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                email.isEmpty ? Text("No data") : Text(email),
                SizedBox(
                  height: 10,
                ),
                password.isEmpty ? Text("No Data") : Text(password),
              ],
            )
          ],
        ),
      ),
    );
  }
}
