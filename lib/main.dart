import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AllyTech LLC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirestoreTestPage(),
    );
  }
}

class FirestoreTestPage extends StatefulWidget {
  const FirestoreTestPage({super.key});

  @override
  State<FirestoreTestPage> createState() => _FirestoreTestPageState();
}

class _FirestoreTestPageState extends State<FirestoreTestPage> {
  String _status = 'No test run yet.';
  String? _lastMessage;
  bool _busy = false;

  Future<void> _runFirestoreTest() async {
    setState(() {
      _busy = true;
      _status = 'Writing test document...';
    });

    try {
      // 1. WRITE a test document to a 'test' collection.
      final docRef = await FirebaseFirestore.instance.collection('test').add({
        'message': 'Hello from allytechllc',
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        _status = 'Write succeeded (doc id: ${docRef.id}). Reading it back...';
      });

      // 2. READ it back to confirm the round trip.
      final snapshot = await docRef.get();
      final data = snapshot.data();

      setState(() {
        _status = 'Round trip successful!';
        _lastMessage = data?['message']?.toString() ?? '(no message field)';
        _busy = false;
      });
    } catch (e) {
      setState(() {
        _status = 'Firestore test FAILED: $e';
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllyTech LLC — Firestore Connectivity Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _status,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (_lastMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  'Read back from Firestore: "$_lastMessage"',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontStyle: FontStyle.italic),
                ),
              ],
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _busy ? null : _runFirestoreTest,
                child: _busy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Run Firestore Write + Read Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}