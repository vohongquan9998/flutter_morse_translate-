import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map mapper = {
    'a': '.-',
    'b': '-...',
    'c': '-.-.',
    'd': '-..',
    'e': '.',
    'f': '..-.',
    'g': '--.',
    'h': '....',
    'i': '..',
    'j': '.---',
    'k': '-.-',
    'l': '.-..',
    'm': '--',
    'n': '-.',
    'o': '---',
    'p': '.--.',
    'q': '--.-',
    'r': '.-.',
    's': '...',
    't': '-',
    'u': '..-',
    'v': '...-',
    'w': '.--',
    'x': '-..-',
    'y': '-.--',
    'z': '--..',
    ' ': '     '
  };
  TextEditingController texty = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // This function is triggered when the copy icon is pressed
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: code));
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  String code = '';

  void encoder() {
    setState(() {
      String temp = texty.text.toLowerCase();
      code = '';
      for (int i = 0; i < temp.length; i++) {
        code += mapper[temp[i]] + ' ';
      }
    });
  }

  TextStyle textStyle =
      TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .4,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      controller: texty,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                        color: Colors.white,
                        onPressed: encoder,
                        child: Center(
                          child: Text(
                            'Convert To Morse Code',
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .4,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        code,
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton(
                          color: Colors.white,
                          onPressed: _copyToClipboard,
                          child: Center(
                            child: Text(
                              'Copy',
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
