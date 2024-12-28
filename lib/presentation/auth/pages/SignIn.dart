import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customElevatedButton.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/data/models/auth/signin_user.dart';
import 'package:project/domain/usecases/auth/signin.dart';
import 'package:project/presentation/auth/pages/signup.dart';
import 'package:project/presentation/Home/pages/HomeScreen.dart';
import 'package:project/service_locator.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpText(context),
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
              _EmailField(context),
              const SizedBox(
                height: 15,
              ),
              _PasswordField(context),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                tittle: 'Sign In',
                onpressed: () async {
                  var result = await sl<SigninUseCase>().call(
                    Params: SigninUserReq(
                        email: _email.text.toString(),
                        password: _password.text.toString()),
                  );
                  
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(
                        content: Text(l),
                        behavior: SnackBarBehavior.floating,
                      );
                      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$l");
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const HomePage(),
                          ),
                          (route) => false);
                    },
                  );
                },
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText(BuildContext context) {
    return CustomTextwiget(
      text: 'Sign In',
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      textFontsize: 35,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _EmailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Username or Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _PasswordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextwiget(
          text: 'Not  a member?',
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          textFontsize: AppDimensions.fontsize15,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ));
          },
          child: CustomTextwiget(
            text: 'Register Now',
            color: Colors.blue[600],
            fontWeight: FontWeight.bold,
            textFontsize: AppDimensions.fontsize15,
          ),
        ),
      ],
    );
  }
}
