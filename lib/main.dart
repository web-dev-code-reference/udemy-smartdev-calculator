import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Simple Interest Calculator App',
    home: SIForm(),
    debugShowCheckedModeBanner: false,
    theme:
        ThemeData(primaryColor: Colors.indigo, accentColor: Colors.indigo[100]),
  ));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final _minimumPadding = 5.0;

  var _currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      // resizeToAvoidBottomPadding: false, //to avoid overlapping error at bottom
      appBar: AppBar(
        title: new Text('Simple Interest Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            Center(
              child: getImageAsset(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                style: textStyle,
                keyboardType: TextInputType.number,
                controller: principalController,
                decoration: InputDecoration(
                    labelStyle: textStyle,
                    labelText: 'Principal',
                    hintText: 'Enter Principal e.g. 1200',
                    // labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                style: textStyle,
                keyboardType: TextInputType.number,
                controller: roiController,
                decoration: InputDecoration(
                    labelStyle: textStyle,
                    labelText: 'Rate of Interest',
                    hintText: 'In Percentage',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      controller: termController,
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: 'Term',
                          hintText: 'Time in Years',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: textStyle,
                          ),
                        );
                      }).toList(),
                      value: _currentItemSelected,
                      onChanged: (String newValueSelected) {
                        _onDropDownitemSelected(newValueSelected);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Calculate',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          this.displayResult = _calculatTotalReturns();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Reset',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                this.displayResult,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/monkey-logo.png');
    Image image = Image(
      image: assetImage,
      width: 100,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownitemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculatTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
