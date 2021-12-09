import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<dynamic> checkPermission({
    required Permission permission,
    bool asString = false,
  }) async {
    final PermissionStatus status = await permission.status;
    if (asString) return status.toString();
    return status;
  }
}
