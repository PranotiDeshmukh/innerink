import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _savedPin;
  String? _savedPassword;

  @override
  void initState() {
    super.initState();
    _loadLockData();
  }

  Future<void> _loadLockData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedPin = prefs.getString("app_pin");
      _savedPassword = prefs.getString("app_password");
    });
  }

  Future<void> _saveLockData(String pin, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("app_pin", pin);
    await prefs.setString("app_password", password);
  }

  void _checkLock() {
    if (_savedPin == null || _savedPassword == null) {
      // First time → Save PIN + Password
      if (_pinController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _saveLockData(_pinController.text, _passwordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("PIN & Password set successfully!")),
        );
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter both PIN and Password")),
        );
      }
    } else {
      // Validate PIN + Password
      if (_pinController.text == _savedPin &&
          _passwordController.text == _savedPassword) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Incorrect PIN or Password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _savedPin == null ? "Set PIN & Password" : "Enter PIN & Password",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "PIN",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkLock,
                child: Text(_savedPin == null ? "Set Lock" : "Unlock"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
