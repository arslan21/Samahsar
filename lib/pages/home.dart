import 'package:flutter/material.dart';
import 'package:smah/pages/word_list.dart';
import 'package:smah/search.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var samahController = TextEditingController();
  // late List<String> words;
  late List<Dict> dicts;

  Future updateWords() async {
    Search s =Search(samahController.text);
    await s.getPage();
    dicts = s.dicts;
    // words = s.words;
    print(dicts.length);
    await Navigator.pushNamed(
      context,
      WordList.routeName,
      arguments: ScreenArguments(
        samahController.text,
        dicts,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кĕсъе сăмахсарĕ'),
      ),
      backgroundColor: Colors.amber[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onSubmitted: (text) async {
                    await updateWords();
                },
                controller: samahController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Шырамалли сăмах",
                  // labelText: 'From',
                ),
                keyboardType: TextInputType.text,
                onChanged: (text) {print(samahController.text); },
              ),
              SizedBox( height: 15, ),
              SizedBox(
                height: 56.0,
                child: RaisedButton(
                  onPressed: () async {
                    await updateWords();
                  },
                  color: Colors.amber[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0)
                    )
                  ),
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Шыра",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox( height: 15.0, ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      "Использованы матриалы:",
                      style: TextStyle(
                          color: Colors.grey[800],
                        ),
                    ),
                    SizedBox(height: 5.0,),
                    InkWell(
                      onTap: () => {
                        print("taplink"),
                        launch('http://chgign.ru/'),
                      },
                      child: Text(
                        "ЧГИГН",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    InkWell(
                      onTap: () => {
                        print("Chuvah.Org"),
                        launch('https://chuvash.org/'),
                      },
                      child: Text(
                        "Chuvah.Org",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
