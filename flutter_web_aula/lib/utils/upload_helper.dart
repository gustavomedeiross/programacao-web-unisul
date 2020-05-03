import 'dart:async';
import 'dart:html';

class UploadState {
  bool started;
  FileUpload fileUpload;

  UploadState({ this.started = false, this.fileUpload });
}

class FileUpload {
  String fileName;
  String mimeType;
  String base64;

  FileUpload({ this.fileName, this.mimeType, this.base64 });
}

class UploadHelper {
  final _controller = StreamController<UploadState>();
  Stream<UploadState> get stream => _controller.stream;

  upload() {
    InputElement uploadInput = FileUploadInputElement();

    uploadInput.click();

    uploadInput.onChange.listen((e) {
      List<File> files = uploadInput.files;

      if (files.length > 0) {
        final file = files[0];

        _controller.add(UploadState(started: true));

        final reader = new FileReader();
        reader.onLoadEnd.listen((e) {
          Object result = reader.result;
          String s = result;

          String base64 = s.substring(s.indexOf(',') + 1);
          String mimeType = s.substring(s.indexOf(':') + 1, s.indexOf(';'));
          final fileUpload = FileUpload(fileName: file.name, mimeType: mimeType, base64: base64);
          _controller.add(UploadState(fileUpload: fileUpload));
        });

        reader.readAsDataUrl(file);
      }

    });
  }
}