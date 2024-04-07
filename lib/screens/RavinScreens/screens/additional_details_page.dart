import 'package:flutter/material.dart';
import '../widgets/toggle_switch.dart';

class AdditionalDetailsPage extends StatefulWidget {
  @override
  _AdditionalDetailsPageState createState() => _AdditionalDetailsPageState();
}

class _AdditionalDetailsPageState extends State<AdditionalDetailsPage> {
  bool familyHistoryHeartDisease = false;
  bool familyHistoryDiabetes = false;
  bool pastHistoryHT = false;
  bool historyCoExistingIllness = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ToggleSwitch(
                leftText: 'Yes',
                rightText: 'No',
                initialValue: familyHistoryHeartDisease,
                onChanged: (value) {
                  setState(() {
                    familyHistoryHeartDisease = value;
                    if (value) {
                      familyHistoryDiabetes = false;
                      pastHistoryHT = false;
                      historyCoExistingIllness = false;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              ToggleSwitch(
                leftText: 'Yes',
                rightText: 'No',
                initialValue: familyHistoryDiabetes,
                onChanged: (value) {
                  setState(() {
                    familyHistoryDiabetes = value;
                    if (value) {
                      familyHistoryHeartDisease = false;
                      pastHistoryHT = false;
                      historyCoExistingIllness = false;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              ToggleSwitch(
                leftText: 'Yes',
                rightText: 'No',
                initialValue: pastHistoryHT,
                onChanged: (value) {
                  setState(() {
                    pastHistoryHT = value;
                    if (value) {
                      familyHistoryHeartDisease = false;
                      familyHistoryDiabetes = false;
                      historyCoExistingIllness = false;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              Visibility(
                visible: pastHistoryHT,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Since when (if Yes)?',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'On what medication (if Yes)?',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              ToggleSwitch(
                leftText: 'Yes',
                rightText: 'No',
                initialValue: historyCoExistingIllness,
                onChanged: (value) {
                  setState(() {
                    historyCoExistingIllness = value;
                    if (value) {
                      familyHistoryHeartDisease = false;
                      familyHistoryDiabetes = false;
                      pastHistoryHT = false;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              Visibility(
                visible: historyCoExistingIllness,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Specify (if Yes):',
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Add logic to handle submission here
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
