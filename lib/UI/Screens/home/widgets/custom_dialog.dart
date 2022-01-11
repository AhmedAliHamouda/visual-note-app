/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazyon_tracking/Helpers/routes.dart';
import 'package:kazyon_tracking/UI/Widgets/buttons/rounded_button.dart';
import 'package:kazyon_tracking/Utils/colors_utils.dart';
import 'package:kazyon_tracking/Utils/custom_functions.dart';
import 'package:kazyon_tracking/ViewModel/Riverpods/visual_note_provider.dart';
import 'package:kazyon_tracking/repository/authRepo/auth_repository.dart';
import 'package:validators/validators.dart' as validators;

class CustomDialog extends StatefulWidget {
  final String macAddress;

  CustomDialog({required this.macAddress});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController emailEditingController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text('Email \nplease enter your email'),
        content: Form(
          key:_formKey,
          child: TextFormField(
            controller: emailEditingController,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              hintText: 'Enter Your Email',
              hintStyle: TextStyle(color: ColorsUtils.blackColor.withOpacity(0.7), fontSize: 15.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.5),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.5),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.5),
              ),
            ),
            onSaved: (String? val) {
              //_newsLetterRequest.email=val;
            },
            validator: (String? val) {
              if (val!.isEmpty) {
                return 'Enter Email';
              } else if (!validators.isEmail(val)) {
                return 'Enter A valid Email';
              } else if (!val.endsWith('kazyon.com')) {
                return 'Enter A  valid kazyon Email';
              }
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRoundedButton(
                  text: 'Cancel',
                  backgroundColor: ColorsUtils.whiteColor,
                  borderColor: ColorsUtils.whiteColor,
                  height: 40,
                  fontSize: 16,
                  pressed: () {
                    SystemNavigator.pop();
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CustomRoundedButton(
                  text: 'Ok',
                  backgroundColor: ColorsUtils.whiteColor,
                  borderColor: ColorsUtils.whiteColor,
                  height: 40,
                  fontSize: 16,
                  pressed: () async{
                    await _confirmEmail(widget.macAddress,emailEditingController.value.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmEmail(String macAddress, String email) async {
    //'Mohamed.saeed@kazyon.com'
    bool _isValidate = _formKey.currentState!.validate();
    if (_isValidate) {
      FocusManager.instance.primaryFocus!.unfocus();
      _formKey.currentState!.save();
      final userData = await AuthRepository.addUser(
        email: email,
        macAddress: macAddress,
      );

      if (userData.status) {
        CustomNavigator.popScreen(context);
        await ProviderContainer().read(userProvider).checkUser(macAddress);
      } else {
        CustomFunctions.showCustomSnackBar(context: context, text: 'enter Your Email Again');
      }
    }
  }
}
*/
