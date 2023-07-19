import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

const String USER_COLLECTION = "Users";

class CloudStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CloudStorageService() {}

  Future<String?> saveUserImageToStorage(
      String _uid, PlatformFile _file) async {
    try {
      Reference _ref = _storage
          .ref()
          .child('images/Users/$_uid/empty_person.${_file.extension}');
      UploadTask _task = _ref.putFile(
        File(_file.path!),
      );
      return await _task.then(
        ((_result) => _result.ref.getDownloadURL()),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<String?> saveChatImageToStorage(
      String _chatID, String _userID, PlatformFile _file) async {
    try {
      Reference _ref = _storage.ref().child(
          'images/chats/$_chatID/${_userID} ${Timestamp.now().millisecondsSinceEpoch}.${_file.extension}');
      UploadTask _task = _ref.putFile(
        File(_file.path!),
      );
      return await _task.then(
        ((_result) => _result.ref.getDownloadURL()),
      );
    } catch (e) {
      print(e);
    }
  }
}
