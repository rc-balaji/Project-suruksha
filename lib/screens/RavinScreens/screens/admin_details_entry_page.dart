import 'package:flutter/material.dart';
import '../widgets/toggle_switch.dart';
import 'additional_details_page.dart';

class AdminDetailsEntryPage extends StatefulWidget {
  @override
  _AdminDetailsEntryPageState createState() => _AdminDetailsEntryPageState();
}

class _AdminDetailsEntryPageState extends State<AdminDetailsEntryPage> {
  final FocusNode _patientIdFocusNode = FocusNode();
  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _bpFocusNode = FocusNode();
  final FocusNode _waistCircumferenceFocusNode = FocusNode();
  final FocusNode _fastingBloodSugarFocusNode = FocusNode();
  final FocusNode _ldlCholesterolFocusNode = FocusNode();
  final FocusNode _hdlCholesterolFocusNode = FocusNode();
  final FocusNode _triglycerideFocusNode = FocusNode();

  String _patientId = '';
  String _errorText = '';
  bool _isAdminEnabled = false;
  bool _detailsCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Details Entry'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                focusNode: _patientIdFocusNode,
                decoration: InputDecoration(
                  hintText: 'Enter Patient ID',
                  labelText: 'Patient ID',
                  errorText: _errorText,
                ),
                onChanged: (value) {
                  setState(() {
                    _patientId = value;
                  });
                },
                onFieldSubmitted: (value) {
                  _checkPatientId();
                },
              ),
              SizedBox(height: 20.0),
              if (_isAdminEnabled) ...[
                Text(
                  'Enter Details:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  focusNode: _heightFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Height (cms)',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_weightFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _weightFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_bpFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _bpFocusNode,
                  decoration: InputDecoration(
                    labelText: 'BP (mm of Hg)',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_waistCircumferenceFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _waistCircumferenceFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Waist Circumference (cms)',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_fastingBloodSugarFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _fastingBloodSugarFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Fasting Blood Sugar (mg)',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_ldlCholesterolFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _ldlCholesterolFocusNode,
                  decoration: InputDecoration(
                    labelText: 'LDL Cholesterol',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_hdlCholesterolFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _hdlCholesterolFocusNode,
                  decoration: InputDecoration(
                    labelText: 'HDL Cholesterol',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_triglycerideFocusNode);
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                TextFormField(
                  focusNode: _triglycerideFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Triglyceride',
                  ),
                  onFieldSubmitted: (_) {
                    _checkDetailsCompletion();
                    _submitDetails();
                  },
                  onChanged: (_) {
                    _checkDetailsCompletion();
                  },
                ),
                SizedBox(height: 20.0),
                if (_detailsCompleted)
                  ElevatedButton(
                    onPressed: _submitDetails,
                    child: Text('Submit'),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _checkPatientId() {
    if (_patientId == '123') {
      setState(() {
        _errorText = '';
        _isAdminEnabled = true; // Enable admin input
      });
      FocusScope.of(context).requestFocus(_heightFocusNode);
    } else {
      setState(() {
        _errorText = 'Incorrect patient ID';
        _isAdminEnabled = false; // Disable admin input
      });
    }
  }

  void _checkDetailsCompletion() {
    // Check if all necessary details are filled
    setState(() {
      _detailsCompleted = _heightFocusNode.hasFocus &&
          _weightFocusNode.hasFocus &&
          _bpFocusNode.hasFocus &&
          _waistCircumferenceFocusNode.hasFocus &&
          _fastingBloodSugarFocusNode.hasFocus &&
          _ldlCholesterolFocusNode.hasFocus &&
          _hdlCholesterolFocusNode.hasFocus &&
          _triglycerideFocusNode.hasFocus;
    });
  }

  void _submitDetails() {
    // Handle form submission here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdditionalDetailsPage(),
      ),
    );
  }

  @override
  void dispose() {
    _patientIdFocusNode.dispose();
    _heightFocusNode.dispose();
    _weightFocusNode.dispose();
    _bpFocusNode.dispose();
    _waistCircumferenceFocusNode.dispose();
    _fastingBloodSugarFocusNode.dispose();
    _ldlCholesterolFocusNode.dispose();
    _hdlCholesterolFocusNode.dispose();
    _triglycerideFocusNode.dispose();
    super.dispose();
  }
}
