import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

import '../search.dart';

class WordList extends StatelessWidget {
  static const routeName = '/words';
  WordList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(args.word),
      ),
      backgroundColor: Colors.amber[50],
      body: Center(        
        child: ListView.builder(
          itemCount: args.dicts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                color: Colors.amber[200],
                child: Html(
                  data: args.dicts[index].dict,
                  style: {
                    "h3": Style(
                      border: Border.all(style: BorderStyle.none,),
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize(24.0),
                    ),
                    "blockquote": Style(
                      fontSize: FontSize(16.0),
                    ),
                  },
                ),
              ),
            );
          }, //itemBuilder
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Посмотреть на сайте: ",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () => {
                  print("taplink"),
                  launch('http://samah.chv.su/s/' + args.word),
                },
                child: Text(
                  args.word,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String word;
  final List<Dict> dicts;

  ScreenArguments(this.word, this.dicts);
}