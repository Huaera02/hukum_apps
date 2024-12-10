import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginn/input_gambar/camera_page.dart';

// import '../../app/shared/layouts/camera_page.dart';

class DImagePicker {
  Future<XFile?> camera() async {
    dynamic listCamera = await availableCameras();
    XFile? file = await Get.to(() => CameraPage(cameras: listCamera));
    return file;
  }

  Future<XFile?> gallery() async {
    return await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
  }

  Future<List<XFile>?> multiImage() async {
    return await ImagePicker().pickMultiImage(
      imageQuality: 50,
    );
  }
}
