import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(top: 25.0)),
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Text('Email'),
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue ?? '';
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        label: Text('Password'),
        hintText: 'password',
      ),
      validator: validatePassword,
      onSaved: (newValue) {
        password = newValue ?? '';
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('Time to send $email and $password to an API');
        }
      },
      child: Text('Submit!'),
    );
  }
}
