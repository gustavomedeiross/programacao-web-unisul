import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_web_aula/repositories/image_repository.dart';
import 'package:flutter_web_aula/utils/api_response.dart';
import 'package:flutter_web_aula/utils/upload_helper.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String url;
  bool showProgress = false;
  final _uploadHelper = UploadHelper();
  final ImageRepository _imageRepository = ImageRepository();
  StreamSubscription<UploadState> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _uploadHelper.stream.listen((UploadState state) {
      _setUploadState(state);
    });
  }

  _setUploadState(UploadState state) {
    if(state.started) {
      setState(() {
        showProgress = true;
      });
    } else {
      _upload(state.fileUpload);
    }
  }

  _upload(FileUpload file) async {
    ApiResponse<String> response = await _imageRepository.store(file.fileName, file.mimeType, file.base64);

    if (response.ok) {
      String url = response.result;
      setState(() {
        this.url = url;
        this.showProgress = false;
      });
    }
  }

  _handlePress() {
    _uploadHelper.upload();
  }

  _mountScreen() {
    if (url == null || showProgress) {
      if(showProgress) {
        return CircularProgressIndicator();
      }

      return FlutterLogo(size: 50,);
    } else {
      return InkWell(
        onTap: () {
          html.window.open(url, 'site');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(url),
            Text(url),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
          child: RaisedButton(
            child: Text('Upload'),
            onPressed: _handlePress,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            color: Colors.grey[100],
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 250),
              child: Center(
                child: _mountScreen(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

