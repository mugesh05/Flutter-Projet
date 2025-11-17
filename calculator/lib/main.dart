import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
   const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // ignore: non_constant_identifier_names
  String InputValue = "";

  String calculaevaule = "";

  String opretors = "";
  @override
  Widget build(BuildContext context) {

    double size =MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment:Alignment.bottomRight,
              child: Text(InputValue ,style: TextStyle(color: Colors.white,fontSize: 100)), 
            
            
            ),
            Column(
              children: [
                Row(
                  children: [
                    CalcButton("7", Colors.white38,size),
                    CalcButton("8", Colors.white38,size),
                    CalcButton("9", Colors.white38,size),
                    CalcButton("/", Colors.orange,size),

                  ],
                ),

                Row(
                  children: [
                    CalcButton("4", Colors.white38,size),
                    CalcButton("5", Colors.white38,size),
                    CalcButton("6", Colors.white38,size),
                    CalcButton("*", Colors.orange,size),

                  ],
                ),

                Row(
                  children: [
                    CalcButton("1", Colors.white38,size),
                    CalcButton("2", Colors.white38,size),
                    CalcButton("3", Colors.white38,size),
                    CalcButton("-", Colors.orange,size),

                  ],
                ),

                Row(
                  children: [
                    CalcButton("0", Colors.white38,size),
                    CalcButton(".", Colors.white38,size),
                    CalcButton("=", Colors.white38,size),
                    CalcButton("+", Colors.orange,size),

                  ],
                ),
                CalcButton("Clear", Colors.black, size ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }   

   // ignore: non_constant_identifier_names
   Widget CalcButton(String text, Color bgcolor, double size){
     return InkWell(
      onTap: () {
        if(text == "Clear"){
          setState(() {
            InputValue ="";
            opretors = "";
            calculaevaule ="";
          });
        }

        else if(text == "+" || text == "-" || text == "*" || text == "/"){
          setState(() {
            calculaevaule =InputValue;
            InputValue ="";
          });
        }

        

        else if(text == "="){
          setState(() {
            double calc =double.parse(calculaevaule) ;
            double input = double.parse(InputValue);

            if(opretors == "+"){
              opretors =(calc + input).toString();
            }
            else if(opretors == "-"){
              opretors =(calc - input).toString();
            }
            else if(opretors == "*"){
              opretors =(calc * input).toString();
            }
            else if(opretors == "/"){
              opretors =(calc / input).toString();
            }
            
          });
        }

        else{
            setState(() {
            InputValue = InputValue + text;
         });
        }
         
      },
        child: Container(
                decoration: BoxDecoration(
                color: bgcolor,
                borderRadius: BorderRadius.circular(100)),
                margin: EdgeInsets.all(10),
                height: size,
                width: size,
                alignment: Alignment.center,
                          
                child: Text(text ,style: TextStyle(color:Colors.white,fontSize: 30) ),
              ),
   );
   }
}

