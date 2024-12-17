import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customElevatedButton.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(context),
      appBar: BasicAppbar(
        tittle: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _registerText(context),
            const SizedBox(
              height: 50,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 15,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 15,
            ),
            _PasswordField(context),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              tittle: 'Create Account',
              onpressed: () {},
              textColor: Colors.white,
            ),
            const SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }

  Widget _registerText(BuildContext context) {
    return CustomTextwiget(
      text: 'Register',
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      textFontsize: 30,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _EmailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _PasswordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextwiget(
          text: 'Do you Have an Account?',
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          textFontsize: 12,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ));
          },
          child: CustomTextwiget(
            text: 'Sign in',
            color: Colors.blue[600],
            fontWeight: FontWeight.w500,
            textFontsize: 12,
          ),
        ),
      ],
    );
  }
}
