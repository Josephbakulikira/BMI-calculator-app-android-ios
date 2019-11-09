import 'dart:math';

class Bmicalculator{
  Bmicalculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String CalculateBMI (){
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult () {

    if(_bmi >= 25 ){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation () {

    if(_bmi >= 25 ){
      return 'i think yo should consider to a diet' ;
    }else if(_bmi > 18.5){
      return 'normal';
    } else {
      return 'too skinny , haukulake';
    }
  }
}