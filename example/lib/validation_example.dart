import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class ValidationExample extends StatefulWidget {
  const ValidationExample({super.key});

  @override
  State<ValidationExample> createState() => _ValidationExampleState();
}

class _ValidationExampleState extends State<ValidationExample> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validation Example')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => FormValidator.compose([
                () => FormValidator.instance.required(value),
                () => FormValidator.instance.email(value),
              ]),
            ),
            const AppSpacer.verticalM(),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              controller: _passwordController,
              obscureText: true,
              validator: (value) => FormValidator.compose([
                () => FormValidator.instance.required(value),
                () => FormValidator.instance.minLength(value, 8),
                () => FormValidator.instance.password(value),
              ]),
            ),
            const AppSpacer.verticalM(),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              validator: (value) => FormValidator.instance.mustMatch(
                value,
                _passwordController.text,
              ),
            ),
            const AppSpacer.verticalL(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid!')),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
