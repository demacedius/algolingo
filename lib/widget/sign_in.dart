import 'package:algolingo/main.dart';
import 'package:algolingo/widget/transition_slide.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'accueil'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Connectez-vous',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              LoginForm(),
              SizedBox(height: 20.0),
              Text(
                'Ou connectez-vous avec',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              SocialLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, SlideRightRoute(page: Main()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre adresse e-mail';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'E-mail',
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre mot de passe';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Mot de passe',
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _login,
            child: Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {
              // Logique de connexion avec Google
            },
            icon: Icon(Icons.map),
            label: Text('Google'),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {
              // Logique de connexion avec Facebook
            },
            icon: Icon(Icons.facebook),
            label: Text('Facebook'),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {
              // Logique de connexion avec Apple
            },
            icon: Icon(Icons.apple),
            label: Text('Apple'),
          ),
        ),
      ],
    );
  }
}
