import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_Content.dart';
import 'Reusable_card.dart';
import 'Constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/bmi_Calcculator.dart';

enum Gender{
 MALE ,
 FEMALE
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender ;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:  ReusableCard(
                onPress: (){
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                },
                colour: selectedGender == Gender.MALE ? couleur : inactiveCardColor,
                cardChild:  ReusableColumn(IconContent:FontAwesomeIcons.mars, label: 'MALE'),)),
              Expanded(child: ReusableCard(
                  onPress: (){
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                  },
                  colour: selectedGender == Gender.FEMALE ? couleur : inactiveCardColor,
                cardChild:  ReusableColumn(IconContent:FontAwesomeIcons.venus,label: 'FEMALE'),))
            ],
          )),
          Expanded(child: ReusableCard(
            colour: couleur,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: labelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic ,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: NumberTextStyle,
                    ),
                    Text(
                      'cm',
                       style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0XFFe0093b),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0X29e0093b),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    max: 220.0,
                    min: 120.0,

                    inactiveColor: Color(0XFF8d8e98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });;
                    },
                  ),
                )
              ],

            ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: couleur,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,

                    ),
                    Text(
                      weight.toString(),
                      style: NumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,

                      ),
                      RoundIconButton(
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                          icon: FontAwesomeIcons.plus,
                        ),
                    ],
                ),]
              ),
              ),),
              Expanded(child: ReusableCard(colour: couleur,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: labelTextStyle,

                      ),
                      Text(
                        age.toString(),
                        style: NumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,

                          ),
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),]
                ),
              ))
            ],
          )),
          GestureDetector(
            onTap: (){
              Bmicalculator calc = Bmicalculator(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsPage(bmiR: calc.CalculateBMI(), resultT: calc.getResult(), Inter: calc.getInterpretation(),);
                  }));


            },
            child: Container(
              child: Center(child: Text('CALCULATE', style: kTextStyle,)),
              color:  bottomContainerColor,
              padding: EdgeInsets.only(bottom: 20.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height:bottomContainerHeigtht,
            ),
          ),
        ],
      )

      );
  }
}
class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),

    );
  }
}




