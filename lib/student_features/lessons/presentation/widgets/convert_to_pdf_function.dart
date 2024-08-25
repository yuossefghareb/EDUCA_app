import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> convertToPDF(
    {required String base64Content, required String fileName}) async {
  // Decode the Base64 content
  List<int> bytes = base64.decode(base64Content);

  // Get the application documents directory
  final directory = await getExternalStorageDirectory();

  // Create a file to save the PDF content
  File file = File('${directory!.path}/$fileName');

  // Write the bytes to the file
  await file.writeAsBytes(bytes);

  // Open the PDF file
  OpenFile.open(file.path).then((result) {}).catchError((error) {});
}
