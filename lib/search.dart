import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:charset_converter/charset_converter.dart';

class Search {

  late String word;
  // List<String> words = [];
  List<Dict> dicts = [];

  Search(this.word);

  Future<void> getPage() async {
    try {
      final response =
        await http.Client().get(Uri.parse('http://samah.chv.su/s/' + word));

      if(response.statusCode == 200) {
        var document = parse(response.body);
        var elems = document.querySelectorAll('h3, blockquote');

        Dict dict = Dict('main');
        for(int i = 0; i < elems.length; i++) {
          dom.Element elem = elems[i] as dom.Element;

          //var latinBytes = latin1.encode(elem.text);
          var latinBytes = latin1.encode(elem.outerHtml);
          var txtenc = await CharsetConverter.decode("utf8", latinBytes);

          dicts.add(Dict(txtenc!));
        }
      } else {
        throw Exception();
      }
    }
     catch(error) {
      print('error: $error');
      throw Exception();
    }    
  }
}

class Dict {
  late String dict;
  late List<String> words;

  Dict(this.dict) {
    words = [];
  }
}