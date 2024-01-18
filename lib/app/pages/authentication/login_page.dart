import 'package:cordova/app/styles/colors.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/large_button.dart';
import 'package:cordova/app/widgets/snackbar.dart';
import 'package:cordova/app/widgets/text_fields.dart';
import 'package:cordova/data/repositories/auth_repository/firebase_auth_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../routes/route_name.dart';
import 'bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void displaySnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBarShared(
      text: message,
      onActionPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(FirebaseAuthRepository());

    _authBloc.stream.listen((state) {
      if (state is AuthError) {
        displaySnackbar(context, state.errorMessage);
      } else if (state is AuthSignedIn) {
        context.goNamed(RouteName.mainPage);
      }
    });
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 93.h,
          ),
          GestureDetector(
            onTap: () {
              context.goNamed(RouteName.onboardingPage);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF323232),
              ),
            ),
          ),
          SizedBox(
            height: 42.h,
          ),
          LoginContent(authBloc: _authBloc),
        ],
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  final AuthBloc authBloc;

  const LoginContent({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

bool isRemember = true;

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorStyles.grey50,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 48.h, right: 16.w, left: 16.w, bottom: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyles.h3SemiBoldBlack,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Log in for personalized resources and tools that will guide you towards a heart-healthy lifestyle.",
                  style: TextStyles.b2MediumBlack,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyles.b2MediumBlack,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  controller: emailController,
                  type: CustomTextFieldType.input,
                  hintText: 'sando1234@gmail.com',
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyles.b2MediumBlack,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  controller: passwordController,
                  type: CustomTextFieldType.inputPasswordAndHint,
                  obscure: true,
                  hintText: 'sando321',
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRemember = !isRemember;
                        });
                      },
                      child: Image.asset(
                        isRemember
                            ? 'assets/icons/checkbox-fill.png'
                            : 'assets/icons/checkbox-blank-line.png',
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Remember me',
                      style: TextStyles.c1RegularGrey500,
                    ),
                  ],
                ),
                SizedBox(height: 42.h),
                LargeButton(
                  text: 'Login',
                  onClicked: () {
                    widget.authBloc.add(SignInEvent(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                ),
                SizedBox(height: 8.h),
                Text(
                  'or',
                  style: TextStyles.c2MediumBlack,
                ),
                SizedBox(height: 8.h),
                GoogleButton(authBloc: widget.authBloc),
                SizedBox(height: 158.h),
                RichText(
                  text: TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyles.b2RegularBlack,
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyles.b2MediumInfo600Underline,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(RouteName.registerPage);
                          },
                      ),
                    ],
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

class GoogleButton extends StatelessWidget {
  final AuthBloc authBloc;

  const GoogleButton({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(382.sp, 40.sp),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: ColorStyles.primary600,
            width: 1.0,
          ),
        ),
      ),
      onPressed: () {
        authBloc.add(SignInWithGoogleEvent());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/google-icon.png',
            width: 18.w,
            height: 18.h,
          ),
          SizedBox(width: 10.w),
          Text(
            'Login with Google',
            style: TextStyles.b1MediumPrimary,
          ),
        ],
      ),
    );
  }
}
