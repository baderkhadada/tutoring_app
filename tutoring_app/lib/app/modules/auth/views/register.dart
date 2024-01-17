import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoring_app/app/config/theme/colors.dart';
import 'package:tutoring_app/app/core/extensions/context_extension.dart';
import 'package:tutoring_app/app/modules/auth/domain/provider/state/authproviders.dart';
import 'package:tutoring_app/app/modules/auth/widgets/form_widget.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final formProvider = ref.watch(authFormController);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary_500,
        automaticallyImplyLeading: false,
        title: Text(
          context.translate.register,
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: 16,
            color: MyColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyFormFields(formKey: formKey),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    authController.register(
                        email: formProvider.email,
                        username: formProvider.userName,
                        password: formProvider.password);
                  }
                },
                child: Text(
                  context.translate.register,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.translate.googleSignIn,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: MyColors.primary_500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
