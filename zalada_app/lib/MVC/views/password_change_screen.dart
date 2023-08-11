import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zalada_app/MVC/controller/authentication_controller.dart';

import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/textfeild_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  AuthenticationController controller = Get.put(AuthenticationController());

  final _formKey = GlobalKey<FormState>();

  void clearTextFields() {
    controller.oldpassword.value.text = '';
    controller.newpassword.value.text = '';
    controller.confrimpassword.value.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Custom_Appbar(
          title: "change_password".tr,
          leadingButton: back_button(ontap: () {
            Get.back();
          })),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => textfeild_widget(
                    controller: controller.oldpassword.value,
                    hintText: 'current_password'.tr,
                    label: 'current_password'.tr,
                    validator: (input) =>
                        input!.length == 0 ? "validation_password".tr : null,
                    obscureText: controller.hidepasswordold.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidepasswordold.value =
                            !controller.hidepasswordold.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(
                        controller.hidepasswordold.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => textfeild_widget(
                    controller: controller.newpassword.value,
                    hintText: 'new_password'.tr,
                    label: 'new_password'.tr,
                    validator: (input) =>
                        input!.length == 0 ? "validation_password".tr : null,
                    obscureText: controller.hidepassword.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidepassword.value =
                            !controller.hidepassword.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(
                        controller.hidepassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => textfeild_widget(
                    controller: controller.confrimpassword.value,
                    hintText: 'confirm_password'.tr,
                    label: 'confirm_password'.tr,
                    validator: (input) =>
                        input!.length == 0 ? "validation_password".tr : null,
                    obscureText: controller.hidepasswordconfirm.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidepasswordconfirm.value =
                            !controller.hidepasswordconfirm.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(
                        controller.hidepasswordconfirm.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Button_Widget(
                  width: size.width,
                  title: 'change_password'.tr,
                  ontap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.loading.value = !controller.loading.value;
                      controller.updatePassword(context);
                      clearTextFields();
                    } else {
                      controller.loading.value;
                      Get.snackbar('form'.tr, 'please_Fill_the_form'.tr,
                          backgroundColor: Theme.of(context).cardColor,
                          colorText: Theme.of(context).hintColor);
                    }

                    // if (_formKey.currentState!.validate()) {
                    //   controller.loginwithEmail(email.text, password.text, context);
                    // } else {
                    //   Get.snackbar('form_validation'.tr, 'please_Fill_the_form'.tr,
                    //       backgroundColor: Theme.of(context).cardColor,
                    //       colorText: Theme.of(context).hintColor);
                    // }

                    //   if (controller.newPassword.value ==
                    //       controller.confirmPassword.value) {
                    //     controller.changePassword();
                    //   } else {
                    //     Get.snackbar('Error', 'Passwords do not match');
                    //   }
                    // },
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
