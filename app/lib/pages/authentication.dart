import 'package:app/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/qurma.png',
              height: 150,
            ),
            const SizedBox(height: 16),
            const Text(
              'Qurma',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Qur\'an Metode Kelipatan Lima',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(300, 50),
              ),
              onPressed: () async {
                UserCredential? userCredential = await AuthService().signInWithGoogle();
                if (userCredential != null) {
                  if (kDebugMode) {
                    print('User signed in: ${userCredential.user?.displayName}');
                  }
                } else {
                  // Sign-in failed or canceled
                  if (kDebugMode) {
                    print('Sign-in canceled or failed.');
                  }
                }
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: 24,
              ),
              label: const Text('Sign In With Google'),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                minimumSize: const Size(300, 50),
              ),
              onPressed: () {
                // Add guest sign-in logic here
              },
              icon: Image.asset(
                'assets/images/guest.png',
                height: 24,
              ),
              label: const Text('Sign In as Guest'),
            ),
          ],
        ),
      ),
    );
  }
}