import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sttal/data/datasources/auth_local_datasource.dart';
import 'package:sttal/presentation/auth/bloc/login/login_bloc.dart';
import 'package:sttal/presentation/home/pages/main_page.dart';

import '../../../core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController nrpController;
  late final TextEditingController passwordController;
  bool isShowPassword = false;

  @override
  void initState() {
    nrpController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nrpController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpaceHeight(50),
              Image.asset(
                Assets.images.logo.path,
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
              const SpaceHeight(107),
              CustomTextField(
                controller: nrpController,
                label: 'NRP',
                showLabel: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.email.path,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const SpaceHeight(20),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                showLabel: false,
                obscureText: !isShowPassword,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.password.path,
                    height: 20,
                    width: 20,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                ),
              ),
              const SpaceHeight(104),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      AuthLocalDatasource().saveAuthData(data);
                      context.pushReplacement(const MainPage());
                    },
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    },
                  );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                            onPressed: () {
                              // context.pushReplacement(const MainPage());
                              context.read<LoginBloc>().add(LoginEvent.login(
                                    nrpController.text,
                                    passwordController.text,
                                  ));
                            },
                            label: 'Sign in');
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
