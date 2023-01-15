import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> FormKye = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: FormKye,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height:15.0,),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value){
                      if(value ==null || value.trim().length <= 3){
                        return 'Email Address must not Empity';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                    suffix: Icons.email,
                  ),
                  SizedBox(
                    height:8.0,),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value){
                            if(value ==null || value.trim().length <= 3){
                              return 'Password must not Empity';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                          isPassword: isPassword,
                          suffix: isPassword ? Icons.visibility :Icons.visibility_off,
                          suffixPressed: (){
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                      ),
                      SizedBox(
                      height:8.0,),
                      defaultButton(
                      function: () {
                          if (FormKye?.currentState !=null && FormKye!.currentState!.validate())
                            {
                              print(emailController.text);
                              print(passwordController.text);
                            }
                      },
                      text: 'login',
                      background: Colors.blue,
                      radius: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: (){},
                          child: Text('Register Now'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
