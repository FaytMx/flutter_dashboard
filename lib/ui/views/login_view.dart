import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);
        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          onFormSubmit(loginFormProvider, authProvider),
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? ''))
                          return 'Email no valido';

                        return null;
                      },
                      onChanged: (value) => loginFormProvider.email = value,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          onFormSubmit(loginFormProvider, authProvider),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Ingrese su contrase??a.';
                        if (value.length < 6)
                          return 'La contrase??a debe ser de al menos 6 caracteres.';

                        return null;
                      },
                      onChanged: (value) => loginFormProvider.password = value,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '*****',
                        label: "Contrase??a",
                        icon: Icons.lock_outline,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomOutlinedButton(
                        onPressed: () =>
                            onFormSubmit(loginFormProvider, authProvider),
                        text: 'Ingrese'),
                    SizedBox(
                      height: 20,
                    ),
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Flurorouter.registerRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();

    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
