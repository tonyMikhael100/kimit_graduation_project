import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/view/widgets/customize_text_form_field.dart';
import 'package:graduation_project/view/widgets/customized_elevatedbutton.dart';
import 'package:graduation_project/view/widgets/customized_text.dart';
import 'package:graduation_project/view/authantication_view/sign_in_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          isLoading = true;
        } else if (state is AuthSignUpSuccessState ) {
          isLoading = false;
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return SignInView();
          }), (route) => false);
        } else if (state is AuthSignUpFailState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMsg)),
          );
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        color: primaryColor,
        inAsyncCall: isLoading,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.6, 0.8],
            colors: [
              const Color(0x09FBD3).withOpacity(0.2),
              Colors.transparent,
              const Color(0x09FBD3).withOpacity(0.2),
            ],
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                          )),
                      CustomizedText(
                          text: "Sign Up", fontSize: 32, color: primaryColor),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: BlocBuilder<AuthCubit, AuthState>(
                        builder: ((context, state) {
                      if (state is AuthLoadingState) {
                        return Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        );
                      } else {
                        return Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: myCubit.imageUrl == null
                                  ? Icon(
                                      Icons.image,
                                      size: 100,
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          NetworkImage('${myCubit.imageUrl}'),
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 50,
                                height: 50,
                                child: IconButton(
                                    onPressed: () {
                                      myCubit
                                          .chooseImageAndUploadInCloudStorage();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor),
                              ),
                            ),
                          ],
                        );
                      }
                    })),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: myCubit.signUpKey,
                    child: Column(
                      children: [
                        CustomizeTextFormField(
                          hintText: "name",
                          onChanged: (value) {
                            myCubit.signUpName = value;
                            print(myCubit.signUpName);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomizeTextFormField(
                          hintText: "email",
                          onChanged: (value) {
                            myCubit.signUpemail = value;
                          },
                          suffixIcon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomizeTextFormField(
                          onChanged: (value) {
                            myCubit.signUpPassowrd = value;
                            print(value);
                          },
                          hintText: "password",
                          suffixIcon: Icons.password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your passowrd';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustoomizedElevatedButton(
                            width: MediaQuery.of(context).size.width,
                            text: "Sign up",
                            onPressed: () {
                              if (myCubit.signUpKey.currentState!.validate()) {
                                myCubit.signUp();
                              }
                            })
                      ],
                    ),
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
