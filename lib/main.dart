

import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: 'Simple Interest Calculator App',
      home: SIForm(),
      debugShowCheckedModeBanner: false,

    )
  );
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds' ];
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false, //to avoid overlapping error at bottom
      appBar: AppBar(
        title: new Text('Simple Interest Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2 ),
        child: ListView(
          children: <Widget>[
            Center(child: getImageAsset(),),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: 
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Principal',
                  hintText: 'Enter Principal e.g. 1200',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: 
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  hintText: 'In Percentage',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: 
                Row(
                children: <Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In Percentage',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                  ),
                ),
                Container(width: _minimumPadding *5,),
                Expanded(
                  child: DropdownButton<String>(
                   
                      items: _currencies.map((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: 'Rupees',
                      onChanged: (String newValueSelected){

                      },
                    
                  ),
                )
              ],
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: 
              Row(children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('Calculate'),
                    onPressed: (){},
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text('Reset'),
                    onPressed: (){},
                  ),
                )
              ],),
            ),
            
            Padding(
              padding: EdgeInsets.all(_minimumPadding*2),
              child: Text('todo text'),
            ),

          ],
        ),
      ),
    );
  }
  Widget getImageAsset(){
    AssetImage assetImage=AssetImage('images/monkey-logo.png');
    Image image=Image(image: assetImage, width: 125,);
    
    return Container( child: image, margin: EdgeInsets.all(_minimumPadding * 10), );
  }
}

