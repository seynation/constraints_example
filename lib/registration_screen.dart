import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String gender = '';
  String email = '';
  String phone = '';
  String country = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onSaved: (value) => firstName = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Middle Name'),
                onSaved: (value) => middleName = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onSaved: (value) => lastName = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gender'),
                onSaved: (value) => gender = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) => phone = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country of Birth'),
                onSaved: (value) => country = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryScreen(
                          firstName: firstName,
                          middleName: middleName,
                          lastName: lastName,
                          gender: gender,
                          email: email,
                          phone: phone,
                          country: country,
                        ),
                      ),
                    );
                  }
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

class SummaryScreen extends StatelessWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;
  final String country;

  SummaryScreen({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name: $firstName'),
                Text('Middle Name: $middleName'),
                Text('Last Name: $lastName'),
                Text('Gender: $gender'),
                Text('Email: $email'),
                Text('Phone: $phone'),
                Text('Country of Birth: $country'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
