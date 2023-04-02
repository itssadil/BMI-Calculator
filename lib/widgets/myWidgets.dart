import 'package:bmi_calculator/pages/desails.dart';
import 'package:flutter/material.dart';

class MyWidgets {
  Widget MyTxtField({
    required var cFor,
    required Icon errorIcon,
    required Color errorClr,
    required String labelTxt,
    String? sufTxt,
    required String hntTxt,
  }) {
    return TextField(
      controller: cFor,
      decoration: InputDecoration(
        prefixIcon: errorIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorClr,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        label: Text(labelTxt),
        hintText: hntTxt,
        suffixText: sufTxt,
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }

  Widget ErrorTxt({required bool errorTxt, required String txtAlert}) {
    return Visibility(
      visible: errorTxt,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          txtAlert,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget BtmSheet({
    required double arrowAngle,
    required String bmi,
    required String cat,
    required String bmiAdvise,
    required String bmiIcon,
    required bool errorCat,
  }) {
    return Builder(
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.3,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(bmiIcon),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 8,
                      right: MediaQuery.of(context).size.width * 0.5,
                      child: Transform.rotate(
                        alignment: Alignment.centerRight,
                        angle: arrowAngle,
                        child: Image(
                          image: AssetImage("assets/arrow2.png"),
                          height: MediaQuery.of(context).size.width * 0.22,
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: MediaQuery.of(context).size.width * 0.1,
                        child: Text(
                          bmi,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.257,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: errorCat,
                            child: Icon(
                              Icons.report_problem,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            cat,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Visibility(
                            visible: errorCat,
                            child: Icon(
                              Icons.report_problem,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.teal[800],
                    size: 35,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: 10,
                right: 10,
                child: Text(
                  bmiAdvise,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Details(),
                        ),
                      );
                    },
                    child: Text("More Details")),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget infoTxt(
      {required String inTxt,
      required Color inClr,
      double? inSize,
      TextAlign? inAlign}) {
    return Text(
      inTxt,
      style: TextStyle(
        color: inClr,
        fontSize: inSize,
        fontWeight: FontWeight.bold,
      ),
      textAlign: inAlign,
    );
  }
}
