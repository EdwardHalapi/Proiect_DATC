/*=============== Owned packages ===================*/
import 'package:citydanger/view_models/base_model.dart';
/*=============== Extern packages ==================*/
import 'dart:io';

class IssueViewModel extends BaseModel {
   File? _imageCertification;
  Future<File?> pickCertificaitonPhoto() async {
    _imageCertification = await mediaService.pickImageCertification();
    notifyListeners();
    return _imageCertification;
  }
}
