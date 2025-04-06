import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/view/widgets/customize_text_form_field.dart';
import 'package:graduation_project/view/widgets/customized_elevatedbutton.dart';
import 'package:graduation_project/view/widgets/customized_text.dart';
import 'package:graduation_project/view/authantication_view/sign_up_view.dart';
import 'package:graduation_project/view/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  bool isLoading = false;
  static GlobalKey<FormState> signInKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          isLoading = true;
        } else if (state is AuthSignInSuccessState) {
          isLoading = false;
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return HomeView();
          }), (route) => false);
        } else if (state is AuthSignInFailState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMsg)),
          );
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
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
                  CustomizedText(
                      text: "Sign In", fontSize: 32, color: primaryColor),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CustomizedText(
                        text: "Bookly App", fontSize: 32, color: primaryColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: signInKey,
                    child: Column(
                      children: [
                        CustomizeTextFormField(
                          hintText: "email",
                          onChanged: (value) {
                            myCubit.signInemail = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            // return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomizeTextFormField(
                          hintText: "password",
                          onChanged: (value) {
                            myCubit.signInPassword = value;
                          },
                          suffixIcon: Icons.password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustoomizedElevatedButton(
                            width: MediaQuery.of(context).size.width,
                            text: "Sign In",
                            onPressed: () {
                              if (signInKey.currentState!.validate()) {
                                myCubit.signIn();
                                //get books request
                                BlocProvider.of<BooksCubit>(context)
                                    .getNewAndAllBooks();
                                myCubit.getUserInformation();
                              }
                            }),
                      const  SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomizedText(
                                text: "don't hava an account ?",
                                fontSize: 14,
                                color: Colors.grey),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUpView();
                                }));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 18),
                              ),
                            )
                          ],
                        ),
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
