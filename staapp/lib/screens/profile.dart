import 'package:home_widget/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

const String appGroupId = 'com.example.staapp';
const String iOSWidgetName = 'DayNumberSmall';
const String androidWidgetName = 'DayNumberSmall';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final Stream<User?> authState;

  @override
  void initState() {
    super.initState();
    authState = FirebaseAuth.instance.authStateChanges();
    HomeWidget.setAppGroupId(appGroupId);
  }

  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      final googleProvider = GoogleAuthProvider();
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: authState,
          builder: (context, snapshot) {
            final user = snapshot.data;

            return Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color(0xFF870029),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    )),
                Text(
                  user != null
                      ? 'Signed in as\n${user.displayName ?? user.email ?? 'Anonymous'}'
                      : 'Not signed in',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      await signInWithGoogle();
                    } catch (e) {
                      print("Google sign-in failed: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign-in failed: $e')),
                      );
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Sign in with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF870029),
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
