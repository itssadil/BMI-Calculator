import 'package:bmi_calculator/widgets/myWidgets.dart';
import 'package:flutter/material.dart';

class BmiBody extends StatefulWidget {
  const BmiBody({Key? key}) : super(key: key);

  @override
  State<BmiBody> createState() => _BmiBodyState();
}

class _BmiBodyState extends State<BmiBody> {
  var wKg = TextEditingController();
  var hFit = TextEditingController();
  var hInch = TextEditingController();
  var bAge = TextEditingController();
  String bmiAdvise =
      "Congratulations on having a healthy BMI! To maintain it, continue to eat a balanced diet, exercise regularly, and prioritize self-care.";
  var txtAlert = "";
  var bmiIcon = "assets/bmi.png";
  var bmi = "";
  var cat = "";
  Color ageError = Colors.teal;
  Color wError = Colors.teal;
  Color hError = Colors.teal;
  Icon wErrorIcon = Icon(Icons.line_weight);
  Icon hErrorIcon = Icon(Icons.height);
  Icon ageErrorIcon = Icon(Icons.man);
  bool _errorTxt = false;
  bool _errorCat = false;
  bool kidChk = false;
  bool kidMale = true;
  bool kidFemale = false;

  var myWigets = MyWidgets();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myWigets.infoTxt(
                              inTxt: "For children ages 2 to 20, click here ⫸ ",
                              inClr: Colors.teal,
                            ),
                            Checkbox(
                              value: kidChk,
                              activeColor: Colors.blue,
                              onChanged: (bool? isKidChk) {
                                kidChk = isKidChk!;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: kidChk,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myWigets.infoTxt(
                                inTxt: "Male",
                                inClr: Colors.teal,
                              ),
                              Checkbox(
                                value: kidMale,
                                activeColor: Colors.blue,
                                shape: CircleBorder(),
                                onChanged: (bool? isKidmale) {
                                  kidMale = isKidmale!;
                                  kidMale == true
                                      ? kidFemale = false
                                      : kidFemale = true;
                                  setState(() {});
                                },
                              ),
                              myWigets.infoTxt(
                                inTxt: "Female",
                                inClr: Colors.teal,
                              ),
                              Checkbox(
                                value: kidFemale,
                                activeColor: Colors.blue,
                                shape: CircleBorder(),
                                onChanged: (bool? isKidFemale) {
                                  kidFemale = isKidFemale!;
                                  kidFemale == true
                                      ? kidMale = false
                                      : kidMale = true;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: kidChk,
                              child: Expanded(
                                child: myWigets.MyTxtField(
                                  cFor: bAge,
                                  errorIcon: ageErrorIcon,
                                  errorClr: ageError,
                                  labelTxt: "Age",
                                  sufTxt: "Age",
                                  hntTxt: "Ex: 16",
                                ),
                              ),
                            ),
                            Visibility(
                              visible: kidChk,
                              child: SizedBox(width: 5),
                            ),
                            Expanded(
                              child: myWigets.MyTxtField(
                                cFor: wKg,
                                errorIcon: wErrorIcon,
                                errorClr: wError,
                                labelTxt: "Weight (kg)",
                                sufTxt: kidChk ? "" : "Weight (kg)",
                                hntTxt: "Ex: 57",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: myWigets.MyTxtField(
                                cFor: hFit,
                                errorIcon: hErrorIcon,
                                errorClr: hError,
                                labelTxt: "Height (Fit)",
                                hntTxt: "Ex: 5",
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: myWigets.MyTxtField(
                                cFor: hInch,
                                errorIcon: Icon(Icons.height),
                                errorClr: Colors.teal,
                                labelTxt: "Height (Inch)",
                                hntTxt: "Ex: 7",
                              ),
                            ),
                          ],
                        ),
                        myWigets.ErrorTxt(
                            errorTxt: _errorTxt, txtAlert: txtAlert),
                        ElevatedButton(
                          onPressed: () {
                            BtnOnPressed();
                          },
                          child: Text("Calculate"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: myWigets.infoTxt(
                      inTxt:
                          "This calculator is not intended to replace the evaluation of a healthcare professional.",
                      inClr: Color(0xFF01464F),
                      inAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // This calculator is not intended to replace the evaluation of a healthcare professional.

  BtnOnPressed() {
    String uWeight = wKg.text;
    String uHfit = hFit.text;
    String uHinch = hInch.text;
    String cAge = bAge.text;
    double angle1 = 0;
    double angle2 = 0;
    double angle3 = 0;
    double angle4 = 0;
    double arrowAngle = 0.15;
    double result = 0;

    wError = Colors.teal;
    hError = Colors.teal;
    ageError = Colors.teal;

    wErrorIcon = Icon(Icons.line_weight);
    hErrorIcon = Icon(Icons.height);
    ageErrorIcon = Icon(Icons.man);

    _errorTxt = false;

    //==================================================
    //                BMI advice for kids
    //==================================================

    String kidBmiAdviseNormal =
        "Congratulations on your healthy BMI! Keep up the good work with healthy habits and self-care. You are loved.";
    String kidBmiAdviseUnder =
        "Believe in yourself. Eat healthy, exercise, and rest. Reach out for help if needed. You are loved and important.";
    String kidBmiAdviseOver =
        "Your worth is not defined by size. Focus on healthy habits, be kind to yourself, and seek help. You are loved.";
    String kidBmiAdviseObese =
        "Believe in yourself. Take small steps towards healthy habits. Seek professional help. You are loved and valuable.";

    if (kidChk) {
      if (uWeight != "" && uHfit != "" && cAge != "") {
        if (double.parse(cAge) >= 2 && double.parse(cAge) <= 20) {
          double dWeight = double.parse(uWeight);

          String heightInch = uHinch != "" ? uHinch : "0";

          //==================================================
          // Convert Fit to inch and then inch to meter
          //==================================================

          double HeightMeter =
              (((double.parse(uHfit) * 12) + double.parse(heightInch)) *
                  0.0254);

          result = dWeight / (HeightMeter * HeightMeter);
          if (kidMale) {
            if (double.parse(cAge) >= 2 && double.parse(cAge) <= 5) {
              bmiIcon = "assets/kidicon/bmi25m.png";

              if (result < 13) {
                angle1 = 0;
                angle2 = 12.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 13 && result < 18) {
                angle1 = 13;
                angle2 = 17.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 18 && result < 21) {
                angle1 = 18;
                angle2 = 20.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 21;
                angle2 = 40;
                angle4 = 26.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            } else if (double.parse(cAge) >= 6 && double.parse(cAge) <= 9) {
              bmiIcon = "assets/kidicon/bmi69m.png";
              if (result < 14) {
                angle1 = 0;
                angle2 = 13.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 14 && result < 19) {
                angle1 = 14;
                angle2 = 18.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 19 && result < 23) {
                angle1 = 19;
                angle2 = 22.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 23;
                angle2 = 40;
                angle4 = 28.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            } else if (double.parse(cAge) >= 10 && double.parse(cAge) <= 14) {
              bmiIcon = "assets/kidicon/bmi1014m.png";
              if (result < 15) {
                angle1 = 0;
                angle2 = 14.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 15 && result < 21) {
                angle1 = 15;
                angle2 = 20.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 21 && result < 25) {
                angle1 = 21;
                angle2 = 24.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 25;
                angle2 = 45;
                angle4 = 30.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            } else {
              bmiIcon = "assets/kidicon/bmi1520m.png";
              if (result < 17) {
                angle1 = 0;
                angle2 = 16.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 17 && result < 23) {
                angle1 = 17;
                angle2 = 22.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 23 && result < 28) {
                angle1 = 22;
                angle2 = 27.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 28;
                angle2 = 50;
                angle4 = 33.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            }
          } else {
            if (double.parse(cAge) >= 2 && double.parse(cAge) <= 5) {
              bmiIcon = "assets/kidicon/bmi25f.png";
              if (result < 13) {
                angle1 = 0;
                angle2 = 12.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 13 && result < 18) {
                angle1 = 13;
                angle2 = 18.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 18 && result < 21) {
                angle1 = 18;
                angle2 = 20.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 21;
                angle2 = 40;
                angle4 = 27.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            } else if (double.parse(cAge) >= 6 && double.parse(cAge) <= 9) {
              bmiIcon = "assets/kidicon/bmi69f.png";
              if (result < 14) {
                angle1 = 0;
                angle2 = 13.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 14 && result < 20) {
                angle1 = 14;
                angle2 = 19.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 20 && result < 24) {
                angle1 = 20;
                angle2 = 23.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 24;
                angle2 = 45;
                angle4 = 29.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            } else if (double.parse(cAge) >= 10 && double.parse(cAge) <= 14) {
              bmiIcon = "assets/kidicon/bmi1014f.png";
              if (result < 15) {
                angle1 = 0;
                angle2 = 14.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 15 && result < 22) {
                angle1 = 15;
                angle2 = 21.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 22 && result < 28) {
                angle1 = 22;
                angle2 = 27.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 28;
                angle2 = 50;
                angle4 = 33.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            } else {
              bmiIcon = "assets/kidicon/bmi1520f.png";
              if (result < 17) {
                angle1 = 0;
                angle2 = 17.9;
                cat = "Underweight";
                bmiAdvise = kidBmiAdviseUnder;
                _errorCat = true;
              } else if (result >= 17 && result < 24) {
                angle1 = 17;
                angle2 = 23.9;
                cat = "Normal";
                bmiAdvise = kidBmiAdviseNormal;
                _errorCat = false;
              } else if (result >= 24 && result < 29) {
                angle1 = 24;
                angle2 = 28.9;
                cat = "Overweight";
                bmiAdvise = kidBmiAdviseOver;
                _errorCat = true;
              } else {
                angle1 = 29;
                angle2 = 50;
                angle4 = 34.9;
                cat = "Obese";
                bmiAdvise = kidBmiAdviseObese;
                _errorCat = true;
              }
            }
          }

          setState(() {
            bmi = result.toStringAsFixed(1);
            txtAlert = " ";
          });
        } else if (double.parse(cAge) > 20) {
          txtAlert =
              "Sorry you are a adult person, Please uncheck the kid mark.";

          ageError = Colors.red;
          ageErrorIcon = Icon(
            Icons.report_problem,
            color: Colors.red,
          );
          _errorTxt = true;
          setState(() {});
        } else {
          _errorTxt = true;

          ageError = Colors.red;
          ageErrorIcon = Icon(
            Icons.report_problem,
            color: Colors.red,
          );
          txtAlert = "Error: Age must be 2 years or older.";
          setState(() {});
        }
      } else {
        setState(() {
          if (uWeight == "" && uHfit == "" && cAge == "") {
            wError = Colors.red;
            hError = Colors.red;
            ageError = Colors.red;
            ageErrorIcon = Icon(Icons.report_problem, color: Colors.red);
            wErrorIcon = Icon(Icons.report_problem, color: Colors.red);
            hErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else if (uWeight == "" && cAge == "") {
            wError = Colors.red;
            ageError = Colors.red;
            wErrorIcon = Icon(Icons.report_problem, color: Colors.red);
            ageErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else if (uWeight == "" && uHfit == "") {
            wError = Colors.red;
            hError = Colors.red;
            wErrorIcon = Icon(Icons.report_problem, color: Colors.red);
            hErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else if (cAge == "" && uHfit == "") {
            ageError = Colors.red;
            hError = Colors.red;
            ageErrorIcon = Icon(Icons.report_problem, color: Colors.red);
            hErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else if (uWeight == "") {
            wError = Colors.red;
            wErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else if (cAge == "") {
            ageError = Colors.red;
            ageErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else {
            hError = Colors.red;
            hErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          }

          _errorTxt = true;
          txtAlert = "Please fill all the require blanks";
          // txt = cat;
        });
      }
    } else {
      if (uWeight != "" && uHfit != "") {
        bmiIcon = "assets/bmi.png";
        double dWeight = double.parse(uWeight);

        String heightInch = uHinch != "" ? uHinch : "0";

        //==================================================
        // Convert Fit to inch and then inch to meter
        //==================================================

        double HeightMeter =
            (((double.parse(uHfit) * 12) + double.parse(heightInch)) * 0.0254);

        result = dWeight / (HeightMeter * HeightMeter);
        if (result < 18.5) {
          angle1 = 0;
          angle2 = 18.4;
          cat = "Underweight";
          bmiAdvise =
              "Increase calorie intake with nutrient-dense food, strength training, frequent eating, and consult a doctor if underweight.";
          _errorCat = true;
        } else if (result >= 18.5 && result < 25) {
          angle1 = 18.5;
          angle2 = 24.9;
          cat = "Normal";
          bmiAdvise =
              "Congratulations on having a healthy BMI! To maintain it, continue to eat a balanced diet, exercise regularly, and prioritize self-care.";
          _errorCat = false;
        } else if (result >= 25 && result < 30) {
          angle1 = 25;
          angle2 = 29.9;
          cat = "Overweight";
          bmiAdvise =
              "Eat healthy, exercise regularly, monitor portions, and seek support for sustainable weight loss if BMI indicates overweight.";
          _errorCat = true;
        } else if (result >= 30 && result < 35) {
          angle1 = 30;
          angle2 = 34.9;
          cat = "Obese Class I";
          bmiAdvise =
              "Limit processed food, exercise, monitor portions, and seek support to improve health if BMI indicates obese class 1.";
          _errorCat = true;
        } else if (result >= 35 && result < 40) {
          angle1 = 35;
          angle2 = 39.9;
          cat = "Obese Class II";
          bmiAdvise =
              "Emergency consult a doctor, focus on nutrition, exercise, and self-care for obese class 2. Seek support and stay committed.";
          _errorCat = true;
        } else {
          angle1 = 40;
          angle2 = 50;
          cat = "Obese Class III";
          bmiAdvise =
              "Emergency seek medical attention, work with a dietitian, exercise, and seek emotional support for obese class 3. Stay committed.";
          _errorCat = true;
        }

        setState(() {
          bmi = result.toStringAsFixed(1);
          txtAlert = "";
        });
      } else {
        setState(() {
          if (uWeight == "" && uHfit == "") {
            wError = Colors.red;
            hError = Colors.red;
            wErrorIcon = Icon(Icons.report_problem, color: Colors.red);
            hErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else if (uWeight == "") {
            wError = Colors.red;
            wErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          } else {
            hError = Colors.red;
            hErrorIcon = Icon(Icons.report_problem, color: Colors.red);
          }

          _errorTxt = true;
          txtAlert = "Please fill all the require blanks";
          // txt = cat;
        });
      }
    }

    angle3 = (angle2 - angle1) / 5;
    // angle3 = 1;
    if (result >= angle1 && result <= angle2) {
      if (cat == "Underweight") {
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 0.15;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 0.26;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 0.42;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 0.53;
        } else {
          arrowAngle = 0.63;
        }
      } else if (cat == "Normal") {
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 0.72;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 0.82;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 0.95;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 1.07;
        } else {
          arrowAngle = 1.22;
        }
      } else if (cat == "Overweight") {
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 1.3;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 1.43;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 1.55;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 1.67;
        } else {
          arrowAngle = 1.83;
        }
      } else if (cat == "Obese Class I") {
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 1.9;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 2.02;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 2.15;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 2.27;
        } else {
          arrowAngle = 2.4;
        }
      } else if (cat == "Obese Class II") {
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 2.5;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 2.6;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 2.7;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 2.8;
        } else {
          arrowAngle = 2.87;
        }
      } else if (cat == "Obese Class III") {
        arrowAngle = 3.02;
      } else if (cat == "Obese" && result <= angle4) {
        //
        //===============================================
        //           This obese for kids
        //===============================================

        angle2 = angle4;
        angle3 = (angle2 - angle1) / 5;
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 1.9;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 2.02;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 2.15;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 2.27;
        } else {
          arrowAngle = 2.4;
        }
      } else if (cat == "Obese" && result > angle4) {
        //
        //===============================================
        //     This obese for kids(Extremely obese)
        //===============================================

        cat = "Extremely obese";
        bmiAdvise =
            "Consult a healthcare professional, focus on healthy eating, increase physical activity, avoid weight-loss diets, and be supportive.";

        angle1 = angle4 + 0.1;
        angle2 = 40;
        angle3 = (angle2 - angle1) / 5;
        if (result >= angle1 && result <= (angle1 + angle3)) {
          arrowAngle = 2.5;
        } else if (result >= (angle1 + angle3) &&
            result <= (angle1 + (angle3 * 2))) {
          arrowAngle = 2.62;
        } else if (result >= (angle1 + (angle3 * 2)) &&
            result <= (angle1 + (angle3 * 3))) {
          arrowAngle = 2.74;
        } else if (result >= (angle1 + (angle3 * 3)) && result < angle2) {
          arrowAngle = 2.87;
        } else {
          arrowAngle = 3.02;
        }
      } else {
        arrowAngle = 4;
      }
    } else {
      // arrowAngle = 3.02;
      arrowAngle = 3.02;
    }
    if (_errorTxt == false) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: Color(0xFF18221B),
        builder: (context) => myWigets.BtmSheet(
            bmiIcon: bmiIcon,
            arrowAngle: arrowAngle,
            bmi: bmi,
            bmiAdvise: bmiAdvise,
            cat: cat,
            errorCat: _errorCat),
      );
    }
  }
}
