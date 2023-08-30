import 'package:flutter/material.dart';

class UploadProgressWidget extends StatefulWidget {
  final double initialProgress;

  UploadProgressWidget({required this.initialProgress});

  @override
  _UploadProgressWidgetState createState() => _UploadProgressWidgetState();
}

class _UploadProgressWidgetState extends State<UploadProgressWidget> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _progress = widget.initialProgress;
  }

  void setProgress(double value) {
    setState(() {
      _progress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(value: _progress),
            SizedBox(height: 16.0),
            Text(
              "Uploading... ${(widget.initialProgress + (_progress - widget.initialProgress) * 0.6) * 100.0}%",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
