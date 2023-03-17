import 'package:coreapp1/providers/login/login_bloc.dart';
import 'package:coreapp1/ui/Home/home.dart';
import 'package:coreapp1/ui/facilities/facilites_screen.dart';
import 'package:coreapp1/utils/constants/asset_path_constants.dart';
import 'package:coreapp1/utils/constants/string_constants.dart';
import 'package:coreapp1/utils/reusable_widgets/core_text_form_field.dart';
import 'package:coreapp1/utils/style/style_constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = Provider.of<LoginBloc>(context);
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    switch (loginBloc.state) {
      case LoginState.initial:
        return buildLoginForm();
      case LoginState.loading:
        return const Center(child: CircularProgressIndicator());
      case LoginState.failed:
        return buildLoginForm();
      case LoginState.succeeded:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        });
    }
  }

  Form buildLoginForm() {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              buildLogo(),
              buildWelcomeText(),
              buildEmailInput(),
              buildPasswordInput(),
              buildLoginButton(),
              buildErrorMessage(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildLogo() {
    return SizedBox(
      height: 200,
      child: Image.asset(AssetPathConstants.loginImage),
    );
  }

  buildWelcomeText() {
    return Column(
      children: const [
        Text(
          StringConstants.welcomeAgain,
          style: TextStyle(
            color: Color(0xFF742B83), // set the text color
            fontSize: 35, // set the font size
            fontWeight: FontWeight.bold, // set the font weight
          ),
          textAlign: TextAlign.center, // set the text alignment
        ),
        SizedBox(width: 30, height: 20),
        Text(
          StringConstants.happyToSeeYou,
          style: TextStyle(
            color: Color(0xFFb8b8b8), // set the text color
            fontSize: 15, // set the font size
          ),
          textAlign: TextAlign.center, // set the text alignment
        ),
        SizedBox(width: 30, height: 20),
      ],
    );
  }

  buildEmailInput() {
    return Column(
      children: [
        CoreTextFormField(
          label: StringConstants.emailFieldLabel,
          hintText: StringConstants.emailFieldHint,
          textEditingController: emailController,
          autoFocus: false,
          validator: loginBloc.validateEmail,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  buildPasswordInput() {
    return Column(
      children: [
        CoreTextFormField(
          label: StringConstants.passwordFieldLabel,
          hintText: StringConstants.passwordFieldHint,
          textEditingController: passwordController,
          autoFocus: false,
          isTextObsecured: loginBloc.obscureText,
          maxLines: 1,
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            icon: Icon(loginBloc.obscureText
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () => loginBloc.toggleObsecurePassword(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          heightFactor: 3,
          child: GestureDetector(
            onTap: () {
              // Do something when the text is clicked
            },
            child: const Text(
              StringConstants.fogotPassword,
            ),
          ),
        ),
      ],
    );
  }

  buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        elevation: 0,
        height: 50,
        color: ColorConstants.kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () => loginBloc.login(
            _formKey, emailController.text, passwordController.text),
        child: const Text(
          StringConstants.loginButtonLabel,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  buildErrorMessage() {
    return Center(
      child: Text(
        loginBloc.errorMessage,
        style: const TextStyle(color: ColorConstants.kErrorColor),
      ),
    );
  }
}
