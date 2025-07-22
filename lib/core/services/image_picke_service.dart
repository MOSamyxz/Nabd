import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> pickImageFromCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> pickVideoFromGallery() async {
    return await _picker.pickVideo(source: ImageSource.gallery);
  }

  Future<XFile?> pickVideoFromCamera() async {
    return await _picker.pickVideo(source: ImageSource.camera);
  }

  Future<XFile?> pickFile() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<List<XFile>> pickMultiImage() async {
     return await _picker.pickMultiImage( );
  }


  
}
