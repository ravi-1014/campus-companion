import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirm.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    final n = name.text.trim();
    final e = email.text.trim();
    final p = password.text;
    final c = confirm.text;

    if (n.isEmpty || e.isEmpty || p.isEmpty || c.isEmpty) {
      message('Please fill all fields.');
      return;
    }

    if (!e.contains('@')) {
      message('Enter a valid email.');
      return;
    }

    if (p.length < 6) {
      message('Password must be at least 6 characters.');
      return;
    }

    if (p != c) {
      message('Passwords do not match.');
      return;
    }

    setState(() => loading = true);

    try {
      // Create Firebase Authentication account
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: e,
        password: p,
      );

      final user = credential.user!;

      // Save user's name
      await user.updateDisplayName(n);

      // Save user profile in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'uid': user.uid,
        'name': n,
        'email': e,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully!'),
          ),
        );

        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (ex) {
      String text;

      switch (ex.code) {
        case 'email-already-in-use':
          text = 'An account already exists with this email.';
          break;

        case 'invalid-email':
          text = 'Enter a valid email.';
          break;

        case 'weak-password':
          text = 'Password is too weak.';
          break;

        case 'network-request-failed':
          text = 'Check your internet connection.';
          break;

        case 'operation-not-allowed':
          text = 'Email/Password authentication is not enabled.';
          break;

        default:
          text = 'Authentication error: ${ex.code}';
      }

      message(text);
    } on FirebaseException catch (ex) {
      // Show the actual Firestore error
      message(
        'Firestore error: ${ex.code}',
      );
    } catch (ex) {
      message(
        'Error: $ex',
      );
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(
              Icons.person_add_alt_1_rounded,
              size: 70,
              color: Color(0xFF4F46E5),
            ),
            const SizedBox(height: 18),
            const Text(
              'Create your account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 28),

            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: confirm,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: loading ? null : createAccount,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('Create Account'),
              ),
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Already have an account? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}