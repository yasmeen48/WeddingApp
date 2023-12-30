import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class SoundRecorder {
  Record? recorder;
  bool isRecording = false;
  String? path;
  void init() {
    recorder = Record();
  }

  void dispose() async {
    await recorder!.dispose();
  }

  Future startRecord() async {
    var tempDir = await getTemporaryDirectory();
    //path = '$tempDir/audio.aac';

    try {
      if (await recorder!.hasPermission()) {
        recorder!.start();
      }
    } catch (e) {
      print(e);
    }
  }

  Future stopRecord() async {
    path = await recorder!.stop();
  }
}
