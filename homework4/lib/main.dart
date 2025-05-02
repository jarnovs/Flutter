import 'package:flutter/material.dart';

void main() {
  runApp(EzyRentalApp());
}

class EzyRentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZY Rental',
      theme: ThemeData(
        primaryColor: _EzyColors.purple,
        scaffoldBackgroundColor: _EzyColors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        RegistrationScreen.routeName: (_) => RegistrationScreen(),
      },
    );
  }
}

class _EzyColors {
  static const Color purple = Color(0xFF8A2BE2);
  static const Color white = Colors.white;
}

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo placeholder; replace with your own asset
              Icon(Icons.construction, size: 120, color: _EzyColors.white),
              SizedBox(height: 32),
              Text(
                'Добро пожаловать!',
                style: TextStyle(
                  color: _EzyColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Приветствуем вас на площадке аренды строительной техники',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _EzyColors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: _EzyColors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Регистрация',
                    style: TextStyle(color: _EzyColors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.routeName);
                  },
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // TODO: navigate to login
                },
                child: Text(
                  'У меня уже есть аккаунт',
                  style: TextStyle(
                    color: _EzyColors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  // TODO: navigate to parts shop
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: _EzyColors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Магазин автозапчастей',
                    style: TextStyle(color: _EzyColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // TODO: implement registration logic
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Регистрация...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _EzyColors.purple,
        elevation: 0,
        iconTheme: IconThemeData(color: _EzyColors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24),
                _buildTextField(
                  controller: _surnameController,
                  label: 'Фамилия',
                ),
                SizedBox(height: 16),
                _buildTextField(controller: _nameController, label: 'Имя'),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Номер телефона',
                  hintText: '(+996) 500 000 000',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _passwordController,
                  label: 'Пароль',
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: _EzyColors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _EzyColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _register,
                  child: Text(
                    'Зарегистрироваться',
                    style: TextStyle(
                      color: _EzyColors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
      style: TextStyle(color: _EzyColors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: _EzyColors.white.withOpacity(0.8)),
        hintText: hintText,
        hintStyle: TextStyle(color: _EzyColors.white.withOpacity(0.6)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _EzyColors.white.withOpacity(0.6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _EzyColors.white),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, заполните поле';
        }
        return null;
      },
    );
  }
}
