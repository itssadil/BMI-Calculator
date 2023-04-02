import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Specifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BMI, or Body Mass Index, is a measure of a person's body fat based on their weight and height. It is a widely used tool to assess whether someone is underweight, normal weight, overweight, or obese.\n\nThe formula for BMI is simple: BMI = weight (in kilograms) / height (in meters) squared. A BMI below 18.5 is considered underweight, 18.5 to 24.9 is considered normal weight, 25 to 29.9 is considered overweight, and 30 or above is considered obese.\n\nBMI is a useful screening tool for identifying potential health risks associated with being overweight or obese, such as type 2 diabetes, high blood pressure, heart disease, and certain types of cancer. However, it's important to note that BMI is not a diagnostic tool, and factors such as muscle mass, bone density, and body composition can affect the accuracy of the results.\n\nOverall, BMI can be a helpful tool for monitoring weight and identifying potential health risks, but it's important to consider other factors, such as lifestyle habits and medical history, when making decisions about health and wellness.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              "BMI for children:\n",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "BMI, or Body Mass Index, is a measure of a child's body fat based on their weight and height. It is a widely used tool to assess whether a child is underweight, normal weight, overweight, or obese.\n",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'For boys:\n',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Between the ages of 2 and 5, a BMI less than 13 is considered underweight, a BMI between 13 and 18 is considered normal weight, a BMI between 18 and 21 is considered overweight, and a BMI greater than 21 is considered obese.\nBetween the ages of 6 and 9, a BMI less than 14 is considered underweight, a BMI between 14 and 19 is considered normal weight, a BMI between 19 and 23 is considered overweight, and a BMI greater than 23 is considered obese.\nBetween the ages of 10 and 14, a BMI less than 15 is considered underweight, a BMI between 15 and 21 is considered normal weight, a BMI between 21 and 25 is considered overweight, and a BMI greater than 25 is considered obese.\nBetween the ages of 15 and 20, a BMI less than 17 is considered underweight, a BMI between 17 and 23 is considered normal weight, a BMI between 23 and 28 is considered overweight, and a BMI greater than 28 is considered obese.\n',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'For girls:\n',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Between the ages of 2 and 5, a BMI less than 13 is considered underweight, a BMI between 13 and 18 is considered normal weight, a BMI between 18 and 21 is considered overweight, and a BMI greater than 21 is considered obese.\n"
              "Between the ages of 6 and 9, a BMI less than 14 is considered underweight, a BMI between 14 and 20 is considered normal weight, a BMI between 20 and 24 is considered overweight, and a BMI greater than 24 is considered obese.\n"
              "Between the ages of 10 and 14, a BMI less than 15 is considered underweight, a BMI between 15 and 22 is considered normal weight, a BMI between 22 and 27 is considered overweight, and a BMI greater than 27 is considered obese.\n"
              "Between the ages of 15 and 20, a BMI less than 17 is considered underweight, a BMI between 17 and 24 is considered normal weight, a BMI between 24 and 29 is considered overweight, and a BMI greater than 29 is considered obese.\n\n"
              "It's important to note that BMI is not a diagnostic tool, and factors such as muscle mass, bone density, and body composition can affect the accuracy of the results. Additionally, it's important to consider other factors, such as lifestyle habits and medical history, when making decisions about a child's health and wellness.\n\n"
              "Parents should consult with a healthcare professional if they have concerns about their child's BMI or overall health.",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
