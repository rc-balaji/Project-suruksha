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
                  _patientId = value;
                },
                onFieldSubmitted: (value) {
                  _checkPatientId();
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Enter Details:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                focusNode: _heightFocusNode,
                decoration: InputDecoration(
                  labelText: 'Height (cms)',
                  enabled: _isAdminEnabled, // Enable only if admin is enabled
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_weightFocusNode);
                },
              ),
              TextFormField(
                focusNode: _weightFocusNode,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_bpFocusNode);
                },
              ),
              TextFormField(
                focusNode: _bpFocusNode,
                decoration: InputDecoration(
                  labelText: 'BP (mm of Hg)',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_waistCircumferenceFocusNode);
                },
              ),
              TextFormField(
                focusNode: _waistCircumferenceFocusNode,
                decoration: InputDecoration(
                  labelText: 'Waist Circumference (cms)',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_fastingBloodSugarFocusNode);
                },
              ),
              TextFormField(
                focusNode: _fastingBloodSugarFocusNode,
                decoration: InputDecoration(
                  labelText: 'Fasting Blood Sugar (mg)',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_ldlCholesterolFocusNode);
                },
              ),
              TextFormField(
                focusNode: _ldlCholesterolFocusNode,
                decoration: InputDecoration(
                  labelText: 'LDL Cholesterol',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_hdlCholesterolFocusNode);
                },
              ),
              TextFormField(
                focusNode: _hdlCholesterolFocusNode,
                decoration: InputDecoration(
                  labelText: 'HDL Cholesterol',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_triglycerideFocusNode);
                },
              ),
              TextFormField(
                focusNode: _triglycerideFocusNode,
                decoration: InputDecoration(
                  labelText: 'Triglyceride',
                  enabled: _isAdminEnabled,
                ),
                onFieldSubmitted: (_) {
                  if (_isAdminEnabled) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdditionalDetailsPage(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _checkPatientId,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
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
