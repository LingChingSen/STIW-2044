import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Tutorial",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  TextEditingController numaTextEditingContriller = new TextEditingController();
  TextEditingController numbTextEditingController = new TextEditingController();
  TextEditingController numcTextEditingController = new TextEditingController();
  TextEditingController numdTextEditingController = new TextEditingController();
  double result = 0.0, resultA = 0.0, resultB = 0.0, resultC = 0.0, bmi = 0.0,wc = 0.0,he = 0.0;
  String absi;
  double cm = 0.0;
 
  String dropdownValue = 'cm';
 String dropsexValue = 'Male'; 
 String dropweightValue = 'kg'; 
 String dropwaistValue = 'cm'; 
  
  String holder = '' ;
    String holder2 = '' ;
    String holder3 = '';
     String holder4 = '';
 
  List <String> usersHeight = [
    'cm', 
    'm', 
    'ft', 
    'in', 
    ] ;

    List <String> usersSex= [
    'Male', 
    'Female', 
    ] ;

     List <String> usersWeight= [
    'kg', 
    'ib', 
    'stone'
    ] ;
    List <String> usersWaist= [
    'cm', 
    'm', 
    'in'
    ] ;
 
  void getDropDownItem(){
 
    setState(() {
      holder = dropdownValue ;
      holder2 = dropsexValue ;
      holder3 = dropweightValue ;
      holder4= dropwaistValue;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ABSI Calculator"),
        ),
       body: Center(
        child: Container(
          width:400,
          padding: EdgeInsets.all(20.0),
          child: Column(
            
            children:[
              SizedBox(
                height:50,
              ),
             Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
             children:[
             Text("SEX") ,
             Text("                      "),
            DropdownButton<String>(
            value: dropsexValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 15,
            elevation: 7,
            style: TextStyle(color: Colors.red, fontSize: 12),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropsexValue = data;
              });
            },
            items: usersSex.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
             ],
             ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          Text("AGE"),
          Container(
            width:230,
            child: TextField(controller:numaTextEditingContriller),
          ),
          
           ],
           ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          Text("HEIGHT"),
          
          Container(
            width:150,
            child: TextField(controller: numbTextEditingController),
          ),
           DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 15,
            elevation: 8,
            style: TextStyle(color: Colors.red, fontSize: 12),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropdownValue = data;
              });
            },
            items: usersHeight.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
           ],
           
           ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          Text("WEIGHT"),
          Container(
            width:120,
            child: TextField(controller: numcTextEditingController),
          ),
          DropdownButton<String>(
            value: dropweightValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 15,
            elevation: 7,
            style: TextStyle(color: Colors.red, fontSize: 12),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropweightValue = data;
              });
            },
            items: usersWeight.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
           ],
           ),
           
            
           Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          Text("WAIST CIRCUMFERENCE"),
          
          Container(
            width:30,
            child: TextField(controller: numdTextEditingController),
          ),
          DropdownButton<String>(
            value: dropwaistValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 15,
            elevation: 7,
            style: TextStyle(color: Colors.red, fontSize: 12),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropwaistValue = data;
              });
            },
            items: usersWaist.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
           ],
           ),
                    SizedBox(
            height:10,
          ),
          Container(
          width:200,
          height:20,
          child: RaisedButton(child:Text("Calculate ABSI"),onPressed: calculateMethod,)),
                                                  SizedBox(
                                                    height:10,
                                                  ),
                                                  Text("ABSI"+("      ")+ absi.toString()),
                              
                                          ],
                                           ),
                                          
                                           ),),);
                                }
                      void calculateHeight(){
                        holder =  dropdownValue ;
                        double numb = double.parse(numbTextEditingController.text);
                       if(holder == 'cm'){
                        resultA = numb*0.01;
                       }else if(holder == 'm'){
                        resultA = numb;
                       }else if(holder == 'ft'){
                        resultA = numb*0.3048;
                       }else if(holder == 'in'){
                        resultA = numb*0.0254;
                       }
                      
                       }
                                             void calculateWeight(){
                        holder3 =  dropweightValue ;
                        double numc = double.parse(numcTextEditingController.text);
                       if(holder3 == 'kg'){
                        resultB = numc;
                       }else if(holder3 == 'ib'){
                        resultB = numc*0.453592 ;
                       }else if(holder3 == 'stone'){
                        resultB = numc*6.35029;
                       }
                      
                       }

                void calculateWaist(){
                        holder4 =  dropwaistValue ;
                        double numd = double.parse(numdTextEditingController.text);
                       if(holder4 == 'cm'){
                        resultC = numd*0.01;
                       }else if(holder4 == 'm'){
                        resultC = numd;
                       }else if(holder4 == 'in'){
                        resultC = numd*0.0254;
                       }
                      
                       }

                       
                     
      

                      
             
                    
                    
          
            void calculateMethod() {
              setState(() {
                    calculateWaist();
                     calculateWeight();
                     calculateHeight();
                     
                    bmi = resultB/ (resultA * resultA);
                      wc = pow(bmi,2/3);
                      he =pow(resultA,1/2);
                      result = resultC /  (wc * he);
                      absi = format(result);
              
                       
                                    
                        });
                         
                    
                        
                        }
