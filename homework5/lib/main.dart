import 'package:flutter/material.dart';

void main() {
  runApp(SignInApp());
}

class SignInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      theme: ThemeData(
        primaryColor: _AppColors.primary,
        scaffoldBackgroundColor: _AppColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInScreen(),
    );
  }
}

class _AppColors {
  static const Color primary = Color(0xFF2C4D56); // Dark teal
  static const Color background = Colors.white;
  static const Color text = Colors.black87;
  static const Color border = Color(0xFF2C4D56);
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: implement sign-in logic
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signing in...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: _AppColors.text,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildTextField(
                    controller: _emailController,
                    label: 'EMAIL OR PHONE',
                    hintText: 'you@example.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'PASSWORD',
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _AppColors.primary,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        // TODO: navigate to forgot password
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: _AppColors.primary),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _submit,
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text('OR', style: TextStyle(color: _AppColors.text)),
                  ),
                  SizedBox(height: 16),
                  OutlinedButton.icon(
                    icon: Icon(Icons.g_translate, color: _AppColors.border),
                    label: Text(
                      'Continue With Google',
                      style: TextStyle(color: _AppColors.text),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: _AppColors.border),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Google sign-in
                    },
                  ),
                  SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: Icon(Icons.facebook, color: _AppColors.border),
                    label: Text(
                      'Continue With Facebook',
                      style: TextStyle(color: _AppColors.text),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: _AppColors.border),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Facebook sign-in
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet?"),
                      TextButton(
                        onPressed: () {
                          // TODO: navigate to sign up
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(color: _AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: _AppColors.primary),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        return null;
      },
    );
  }
}
