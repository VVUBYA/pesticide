import 'package:flutter/material.dart';

// Custom Widget Definition
class CustomWidget extends StatelessWidget {
  final Widget title;
  final String subTitle;
  final Widget child;
  final Widget image; // New parameter for the image
  final CrossAxisAlignment crossAxisAlignment;
  final double heightBetween;
  final TextAlign textAlign;

  const CustomWidget({
    required this.title,
    required this.subTitle,
    required this.child,
    required this.image, // Pass the image here
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.heightBetween = 10.0,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        image, // Display the image
        Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            title,
            SizedBox(height: heightBetween),
            Text(
              subTitle,
              textAlign: textAlign,
            ),
          ],
        ),
        const SizedBox(height: 20),
        child,
      ],
    );
  }
}

// ForgetPasswordMailScreen
class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                //Image.asset(
                // The image before the title
                // 'assets/images/logo.jpg',
                // height: 100,
                //),
                CustomWidget(
                  image: Image.asset(
                    // Image included in the CustomWidget
                    'assets/images/logo.jpg',
                    height: 100,
                  ),
                  title: Text(
                    'Forget Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subTitle:
                      'Select one of the options below to reset your Password',
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail_outline_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              //Get.to(() => const OTPScreen());
                            },
                            child: const Text('Next'),
                          ),
                        ),
                      ],
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
}
