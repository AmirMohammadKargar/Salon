// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon/src/core/errors/error_handler.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/user/data/dtos/update_user_body.dto.dart';
import 'package:salon/src/features/user/data/dtos/upload_body.dto.dart';
import 'package:salon/src/features/user/domain/usecases/user.usecases.dart';

class EditUserManager with ChangeNotifier {
  bool updating = false;
  bool uploading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String image = '';

  void initialScreen() {
    usernameController.text = Store.user!.username;
    firstnameController.text = Store.user!.firstName;
    emailController.text = Store.user!.email;
    lastnameController.text = Store.user!.lastName;
  }

  Future<void> uploadImage(BuildContext context) async {
    uploading = true;
    notifyListeners();
    final picker = ImagePicker();
    var response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      var res = await getIt<UploadUsecase>().call(
        UploadParams(
          body: UploadDto(
            file: File(response.path),
          ),
        ),
      );
      res.fold(
          (failire) =>
              ErrorHandler.showErrorSnack(context: context, failure: failire),
          (ress) {
        image = ress.filename;
        notifyListeners();
      });
    }
    uploading = false;
    notifyListeners();
  }

  Future<void> updateUser(BuildContext context) async {
    updating = true;
    notifyListeners();
    var res = await getIt<UpdateUserUsecase>().call(
      UpdateUserParams(
        body: UpdateUserDto(
          email: emailController.text,
          username: usernameController.text,
          firstname: firstnameController.text,
          lastname: lastnameController.text,
          image: image,
        ),
      ),
    );
    updating = false;
    notifyListeners();
    res.fold(
        (failire) =>
            ErrorHandler.showErrorSnack(context: context, failure: failire),
        (response) {
      Store.user = response;
      notifyListeners();
    });
    Navigator.pop(context);
  }
}
