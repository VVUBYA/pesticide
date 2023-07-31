import 'package:csdatabase/dashboard.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'forget_password_mail_screen.dart';
import 'forget_password_phone_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Pop the current screen to go back
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.jpg',
                  height: size.height * 0.2), // Set the desired height
              Text(
                'Welcome Back,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20, // Choose an appropriate size for Headline1
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Make it work, make it right.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint),
                          labelText: 'Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              builder: (context) => Container(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Make Selection',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        'Select one of the options below to reset your Password'),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext content) {
                                              return ForgetPasswordMailScreen();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.mail_lock_rounded,
                                                size: 40.0),
                                            const SizedBox(width: 10.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Email',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                    'Reset via Email Verification'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext content) {
                                              return ForgetPasswordPhoneScreen();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                                Icons.mobile_friendly_rounded,
                                                size: 40.0),
                                            const SizedBox(width: 10.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Phone No',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                    'Reset via Phone Verification'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: const Text('Forgot Password'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext content) {
                                  return DashboardScreen();
                                },
                              ),
                            );
                          },
                          child: Text('LOGIN'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('OR'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: Image.asset('assets/images/google-logo.png',
                          width: 50.0),
                      onPressed: () {},
                      label: Text('Sign In With Google'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext content) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Dont Have An Account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Signup',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
