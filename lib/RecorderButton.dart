import 'package:flutter/material.dart';
import 'package:record/record.dart';

typedef RecordCallback = void Function(String);

class RecorderButton extends StatefulWidget {
  const RecorderButton({required this.recordingFinishedCallback, super.key});
  final RecordCallback recordingFinishedCallback;

  @override
  State<RecorderButton> createState() => _RecorderButtonState();
}

class _RecorderButtonState extends State<RecorderButton> {
  bool _isRecording = false;
  final _audioRecorder = Record();
  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();

    widget.recordingFinishedCallback(path!);

    setState(() => _isRecording = false);
  }

  @override
  Widget build(BuildContext context) {
    late final IconData icon;
    late final Color? color;
    if (_isRecording) {
      icon = Icons.stop;
      color = Colors.red.withOpacity(0.3);
    } else {
      color = Colors.purple;
      icon = Icons.mic;
    }
    return GestureDetector(
      onTap: () {
        _isRecording ? _stop() : _start();
      },
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
