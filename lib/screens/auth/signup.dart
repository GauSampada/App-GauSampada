import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:gausampada/backend/localization/localization.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/const/toast.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:gausampada/screens/auth/widgets/custom_auth_buttons.dart';
import 'package:gausampada/screens/auth/widgets/customtextformfield.dart';
import 'package:gausampada/backend/auth/auth_methods.dart';
import 'package:gausampada/screens/home/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phonenum = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  bool obscureText = true;
  bool isLoading = false;
  bool isgoogleLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phonenum.dispose();
    name.dispose();
    super.dispose();
  }

  void signUpEmail() async {
    if (!formKey.currentState!.validate()) {
      toastMessage(
          context: context,
          message: AppLocale.signupFillAllFields.getString(context),
          leadingIcon: const Icon(Icons.message),
          toastColor: Colors.yellow[300],
          borderColor: Colors.orange,
          position: DelightSnackbarPosition.top);
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String res = await authService.handleSignUpWithEmail(
        email: email.text.trim(),
        password: password.text.trim(),
        name: name.text.trim(),
        phoneNumber: phonenum.text.trim(),
      );

      if (res == "success") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const HomeScreen(
                    isLoginOrSignUp: true,
                  )),
        );
      } else {
        toastMessage(
            context: context,
            message: res,
            leadingIcon: const Icon(Icons.message),
            toastColor: Colors.yellow[300],
            borderColor: Colors.orange,
            position: DelightSnackbarPosition.top);
      }
    } catch (e) {
      toastMessage(
          context: context,
          message: e.toString(),
          leadingIcon: const Icon(Icons.error),
          toastColor: Colors.red[200],
          borderColor: Colors.red,
          position: DelightSnackbarPosition.top);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> signUpWithGoogle() async {
    setState(() {
      isgoogleLoading = true;
    });
    try {
      String res = await authService.handleSignUpWithGoogle();

      if (res == "success") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        toastMessage(
            context: context,
            message: res,
            leadingIcon: const Icon(Icons.error),
            toastColor: Colors.red[200],
            borderColor: Colors.red,
            position: DelightSnackbarPosition.top);
      }
    } catch (e) {
      toastMessage(
          context: context,
          message: e.toString(),
          leadingIcon: const Icon(Icons.error),
          toastColor: Colors.red[200],
          borderColor: Colors.red,
          position: DelightSnackbarPosition.top);
    } finally {
      setState(() {
        isgoogleLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              "O",
                              style: TextStyle(
                                fontSize: 60.0,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -4),
                              child: const Text(
                                "nboard!",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: const Offset(0, -22),
                          child: Text(
                            AppLocale.signupScreenSubtitle.getString(context),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/auth/signup.jpg",
                    width: screenWidth * 0.65,
                    height: screenHeight * .25,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    label: AppLocale.signupNameLabel.getString(context),
                    hinttext: AppLocale.signupNameHint.getString(context),
                    controller: name,
                    prefixicon: Icons.person_2,
                    validator: (value) => value == null || value.isEmpty
                        ? AppLocale.signupNameRequired.getString(context)
                        : null,
                  ),
                  CustomTextFormField(
                    label: AppLocale.signupEmailLabel.getString(context),
                    hinttext: AppLocale.signupEmailHint.getString(context),
                    controller: email,
                    prefixicon: Icons.email_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocale.signupEmailRequired.getString(context);
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return AppLocale.signupEmailInvalid.getString(context);
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: AppLocale.signupPasswordLabel.getString(context),
                    hinttext: AppLocale.signupPasswordHint.getString(context),
                    controller: password,
                    prefixicon: Icons.lock,
                    isobsure: obscureText,
                    suffixicon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocale.signupPasswordRequired
                            .getString(context);
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: AppLocale.signupPhoneLabel.getString(context),
                    hinttext: AppLocale.signupPhoneHint.getString(context),
                    controller: phonenum,
                    prefixicon: Icons.phone,
                    keyboard: TextInputType.phone,
                    validator: (value) =>
                        value == null || value.isEmpty || value.length < 10
                            ? AppLocale.signupPhoneRequired.getString(context)
                            : null,
                  ),
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  LoginSignupButtons(
                    label: AppLocale.signupButton.getString(context),
                    onTap: signUpEmail,
                    isLoading: isLoading,
                    backgroundColor: Colors.green[500],
                  ),
                  SizedBox(
                    height: screenHeight * .015,
                  ),
                  const Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * .015,
                  ),
                  LoginSignupButtons(
                    imagepath: "assets/auth/google.jpg",
                    label: AppLocale.signupGoogleButton.getString(context),
                    onTap: signUpWithGoogle,
                    isLoading: isgoogleLoading,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      AppLocale.signupAlreadyHaveAccount.getString(context),
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
