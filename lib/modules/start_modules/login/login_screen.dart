import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/modules/start_modules/splash_screen.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import '../../../shared/component/components.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_state.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    bool inProgress=false;

    return BlocConsumer<LoginCubit,LoginStates>(
      listener:(context,state){
        if(state is LoginLoadingState)
        {
          inProgress=true;
        }
        else {
          inProgress=false;
        }

        if(state is LoginSuccessState)
        {
          showToast(
              text: 'Login Successfully',
              state: ToastStates.SUCCESS
          );
          navigateAndEnd(context, SplashScreen());
        }
        if(state is LoginErrorState)
        {
          showToast(
              text: '${state.error}',
              state: ToastStates.ERROR
          );
        }


      },
      builder:(context,state)
      {
        var cubit=LoginCubit.get(context);

        return Scaffold(
          appBar: myAppBar(appBarText: 'Log in',),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage('images/loginLogo.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      '  Sign In ',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          '  Welcome Back',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 9,),
                        Icon(Icons.waving_hand_rounded,color: Colors.yellow[700],)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defaultFormFeild(
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Email',
                        controller: emailController,
                        validatorText: 'Please enter your email',
                        inputType: TextInputType.emailAddress,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defaultFormFeild(
                          controller: passwordConfirmController,
                          validatorText: 'Please enter your password',
                          isObsecured:cubit.isObsecured ,
                          suffixIcon: IconButton(
                              color: Colors.white,
                              icon: cubit.isObsecured?Icon(Icons.visibility,color: primaryColor,):Icon(Icons.visibility_off,color: primaryColor,),
                              onPressed: (){
                                cubit.changeVisibility();
                              }),
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: Icon(Icons.lock_outline,
                            color: Colors.black,),
                          labelText: 'Password'
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    inProgress?Center(child: const CircularProgressIndicator()):
                    defaultButton(
                      color: primaryColor,
                      textColor: Colors.white,
                      width: size.width * .95,
                      function: ()
                      {
                        if(formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                            email: emailController.text.trim(),
                            password: passwordConfirmController.text.trim(),
                          );
                        }
                      },
                      string: 'Sign In',
                    )

                  ],
                ),
              ),
            ),
          ),
        );

      } ,

    );
  }


}






