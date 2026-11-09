import 'package:flutter/material.dart';

import '../widgets/loginform.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFA9698),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(28),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text('Welcome',
                      style: TextStyle(
                        color: Color(0xFF3B1F20),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Sign in to manage your Products",
                      style: TextStyle(
                        color: Color(0xFF3B1F20),
                        fontSize: 20,
                      ),
                    )
                  ]
              ),
              ),
              Expanded(child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: const Loginform(),
              ))
            ],
        ),
      ),
    );
  }
}
