
import 'dart:io';

abstract class BaseHomeRepository{
  Future<void> uploadImage (File img);
  Future<List<String>> getImages(String token);
}