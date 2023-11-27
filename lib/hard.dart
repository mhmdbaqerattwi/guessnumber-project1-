import 'package:flutter/material.dart';
import 'dart:math';
class Hard extends StatefulWidget {
  const Hard({Key? key}) : super(key: key);

  @override
  _HardState createState() => _HardState();
}

class _HardState extends State<Hard> {
  late int Rcreated;
  late int nbuser;
  String result = '';
  String rhint='';
  late int hintcounter;
  late int tries;
  String rules='';
  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    final random = Random();
    Rcreated = random.nextInt(150) + 1; // Generate a random number between 1 and 100
    nbuser = 0;
    result = '';
    hintcounter=0;
    rhint='';
     tries=0;
  }
  bool type=true;
  void hint(){

    setState(() {
      if(hintcounter==0) {
        if (Rcreated % 2 == 0) {
          hintcounter++;
          rhint = 'number is even';
          type=true;
        }
        else {
          hintcounter++;
          type=false;
          rhint = 'number is odd';
        }
      }else if(hintcounter==1){
        hintcounter++;
        int min =Rcreated-20;
        int max=Rcreated+21;
        if(min<0){
          min=0;}if(max>150){max=150;}
        if(type){
          rhint='number is even and  between $min and $max';
        }else{rhint='number is odd and between $min and $max';}
      }
      else if(hintcounter==2){
        hintcounter++;
        int min =Rcreated-10;
        int max=Rcreated+11;
        if(min<0){
          min=0;}if(max>150){max=150;}
        if(type){
          rhint='number is even and  between $min and $max last hint';
        }else{rhint='number is odd and between $min and $max last hint';}
      }

    });
  }


  void checkGuess() {
    setState(() {
       tries++;
       if (tries>=6){
         result='what a fool';

       }else{
      if (nbuser == Rcreated) {
        result = 'Congratulations! You guessed the correct number.';
      }else if(nbuser>100||nbuser<1){
        result='thats out of range ';
      }
      else if (nbuser+10 < Rcreated) {
        result = 'Too low! Try again.';
      } else if(nbuser>Rcreated+10){
        result = 'Too high! Try again.';
      }
      else if(nbuser <Rcreated){result='too close';}
      else if(nbuser>Rcreated){result='too close';}

    }});
  }

  @override
  Widget build(BuildContext context) {
    String rules='in hard level you have three hints and  5 tries';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Guess the Number level:hard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            AddText(text:'Rules:'),
            AddText(text: rules),
            Text(
              'Guess a number between 1 and 150:',
              style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,color: Colors.red),
            ),
            TextField(
              decoration: const InputDecoration(

                  border: OutlineInputBorder(), hintText: 'Enter a number'
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  nbuser = int.tryParse(value) ?? 0;}
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {

                checkGuess();
              },
              child: const Text('Submit Guess'),
            ),
            const SizedBox(height: 20),

            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                hint();
              },
              child: const Text('take a hint?'),
            ),
            const SizedBox(height: 20),
            Text(
              rhint,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generateRandomNumber();
              },
              child: const Text('New Game'),
            ),
            Footer(text: 'student-id=12130259'),
            const SizedBox(height: 10),

          ],
        ),
      ),
      backgroundColor: Colors.brown,);
  }
}


class AddText extends StatelessWidget {
  final String text;

  const AddText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        color: Colors.red,
      ),
    );
  }
}

class Footer extends StatelessWidget {
  final String text;

  const Footer({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        text,
        style:
        const  TextStyle(fontSize: 24.0,color: Colors.red),
      ),
    );
  }
}
