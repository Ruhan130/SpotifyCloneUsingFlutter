import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customElevatedButton.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/data/models/auth/create_user_req.dart';
import 'package:project/domain/usecases/auth/signup.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';
import 'package:project/presentation/root/pages/root.dart';
import 'package:project/service_locator.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
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
              _EmailField(context),
              const SizedBox(
                height: 15,
              ),
              _PasswordField(context),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                tittle: 'Create Account',
                onpressed: () async {
                  var result = await sl<SignupUseCase>().call(
                    Params: CreateUserReq(
                        fullName: fullname.text.toString(),
                        email: _email.text.toString(),
                        password: _password.text.toString()),
                  );
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(
                        content: Text(l),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SignIn(),
                          ),
                          (route) => false);
                    },
                  );
                },
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
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
      controller: fullname,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _EmailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _PasswordField(BuildContext context) {
    return TextField(
      controller: _password,
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
                  builder: (context) => SignIn(),
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
