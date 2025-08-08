// In login_screen.dart
void _login() async {
  if (_formKey.currentState!.validate()) {
    final email = _emailController.text;
    final password = _passwordController.text;
    
    final isValid = await AuthService.validateLogin(email, password);
    
    if (isValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainLayout(userEmail: email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }
}

// In register_screen.dart
void _register() async {
  if (_formKey.currentState!.validate()) {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    
    final isRegistered = await AuthService.registerUser(name, email, password);
    
    if (isRegistered) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email already registered')),
      );
    }
  }
}