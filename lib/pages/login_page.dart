import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_provider.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = "user@example.com";
    _passwordController.text = "password";
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Replace with your actual credentials
      const validEmail = 'user@example.com';
      const validPassword = 'password';

      if (email == validEmail && password == validPassword) {
        Provider.of<DataProvider>(context, listen: false).login(email, password);
        Navigator.pushReplacementNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Login to continue"),
              const Text("Valid credentials: user@example.com / password"),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email/Mobile'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or mobile';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}