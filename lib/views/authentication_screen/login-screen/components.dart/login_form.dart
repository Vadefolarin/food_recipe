import 'package:flutter/material.dart';
import 'package:food_recipe/views/widgets/default_button.dart';
import 'package:food_recipe/views/widgets/form_error.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  final List<String> errors = [];

  // _SignFormState(
  //   this.email, this.password);

  //Method for add error and remove error below
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (error!.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Email Field
          buildEmailFormField(),
         // Password Field
          buildPasswordFormField(),
          
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Colors.amber,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
              //  onTap: () => 
                //Navigator.pushNamed(),
                   // context, ForgotPasswordScreen.routeName
                   
                child: Text(
                  "Forget Password", 
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.black),
                ),
              )
            ],
          ),
          FormError(errors: errors),
         
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then we go to success screen.
               // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),

          Row(
            children: [
                  SvgPicture.asset("assets/icons/Ellipse 10.svg"),
                   SvgPicture.asset("assets/icons/Ellipse 10.svg"),
                    SvgPicture.asset("assets/icons/Ellipse 10.svg"),
                  ],
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) removeError(error: kShortPassError);

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: ("Enter your Password"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
     //   suffixIcon: CustomSuffixIcon(svgIcon: Icons.lock_outline_rounded),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: ("Enter your Email"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSuffixIcon(svgIcon: Icons.mail_outline),
      
      ),
    );
  }
}
