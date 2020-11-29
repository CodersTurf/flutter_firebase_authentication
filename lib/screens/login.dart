import 'package:ccrwork_mobile/colors.dart';
import 'package:ccrwork_mobile/screens/primary_button.dart';
import 'package:flutter/material.dart';

import '../auth_helper.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.onSignIn}) {}

  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  var auth = Auth();
  static final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  String _authHint = '';

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        _formType == FormType.login
            ? await auth.signIn(_email, _password)
            : await auth.createUser(_email, _password);
        setState(() {
          _authHint = 'Signed In\n\nUser id: ${Auth.user.uid}';
        });
        widget.onSignIn();
      } catch (e) {
        setState(() {
          _authHint = 'Sign In Error\n\n${e.toString()}';
        });
        print(e);
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
      _authHint = '';
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
      _authHint = '';
    });
  }

  List<Widget> usernameAndPassword() {
    return [
      padded(
          child: new TextFormField(
        key: new Key('email'),
        decoration: new InputDecoration(labelText: 'Email'),
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
        onSaved: (val) => _email = val,
      )),
      padded(
          child: new TextFormField(
        key: new Key('password'),
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
        onSaved: (val) => _password = val,
      )),
    ];
  }

  List<Widget> submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return [
          new PrimaryButton(
              key: new Key('login'),
              text: 'Login',
              height: 44.0,
              onPressed: validateAndSubmit),
          new FlatButton(
              key: new Key('need-account'),
              textColor: AppColor.buttonTextColor,
              color: AppColor.buttonColor,
              child: new Text("Need an account? Register"),
              onPressed: moveToRegister),
        ];
      case FormType.register:
        return [
          new PrimaryButton(
              key: new Key('register'),
              text: 'Create an account',
              height: 44.0,
              onPressed: validateAndSubmit),
          new FlatButton(
              key: new Key('need-login'),
              textColor: AppColor.buttonTextColor,
              color: AppColor.buttonColor,
              child: new Text("Have an account? Login"),
              onPressed: moveToLogin),
        ];
    }
    return null;
  }

  Widget hintText() {
    return new Container(
        //height: 80.0,
        padding: const EdgeInsets.all(32.0),
        child: new Text(_authHint,
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center));
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: new Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/front.jpg"),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: new Column(children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.asset('assets/images/logo.jpeg')),
              SizedBox(
                height: 10,
              ),
              new Card(
                  child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    new Container(
                        padding: const EdgeInsets.all(16.0),
                        child: new Form(
                            key: formKey,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: usernameAndPassword() + submitWidgets(),
                            ))),
                  ])),
              hintText()
            ])));
  }

  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}
