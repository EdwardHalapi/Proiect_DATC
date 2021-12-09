/*=============== Owned packages ===================*/
import 'package:citydanger/locator.dart';
import 'package:citydanger/services/permission_service.dart';

/*=============== Extern packages ==================*/
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  final picker = ImagePicker();
  PermissionService permissionService = locator<PermissionService>();
  Future<File?> pickImageCertification() async {
    File? _image;
    XFile? pickedFile;
    PermissionStatus permissionStatus =
        await permissionService.checkPermission(permission: Permission.storage);
    print("PermissionStatus: $permissionStatus");

    try {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } catch (e) {
      print(e);
    }
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    return _image;
  }
}
