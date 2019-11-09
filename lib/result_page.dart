import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({ this.bmiR, this.resultT, this.Inter});
  final String bmiR;
  final String resultT;
  final String Inter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(

            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text('Your result', style: kTitleTextStyle),
              alignment: Alignment.bottomLeft,

            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: couleur,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Text(resultT.toUpperCase(), style: kResultText,),
                  Text(bmiR, style: kBMIText),
                  Text(Inter,textAlign: TextAlign.center, style: kResultBMI),
                ],
              ),),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text('RE-CALCULATE', style: kTextStyle,)),
              color:  bottomContainerColor,
              padding: EdgeInsets.only(bottom: 20.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height:bottomContainerHeigtht,
            ),
          ),
        ],
      ),
    );
  }
}
