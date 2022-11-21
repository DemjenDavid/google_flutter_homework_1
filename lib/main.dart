import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }

}


class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key:key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  double value = 0;
  String? error;
  String show = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Currency Converter', textAlign: TextAlign.center)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network('https://www.pngall.com/wp-content/uploads/2/Money-Background-PNG-Image.png'),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter amount in Euro",
                errorText: error,
              ),

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (String input){
                  setState(() {
                    final double? number = double.tryParse(input);
                    if(number == null){
                      error = "Incorrect format";
                      value = 0;
                      show = "";
                    }
                    else{
                      value = number;
                      error = null;
                    }
                  });
              },

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                        show = "${value} Ron";
                    });
                  },
                  child: Text("Convert"),

              ),
            ),
            Center(
              child: Text(show, style: const TextStyle(
                fontSize: 50
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
