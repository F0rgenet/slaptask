import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class AudioService {
  final AudioRecorder _recorder = AudioRecorder();

  Future<bool> hasPermission() async {
    if (kIsWeb || Platform.isLinux) return true;
    return await Permission.microphone.request().isGranted;
  }

  Future<String> startRecording() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/recording.m4a';

    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc, bitRate: 128000),
      path: path,
    );
    return path;
  }

  Future<String?> stopRecording() async {
    return await _recorder.stop();
  }

  Future<double> getAmplitude() async {
    final amplitude = await _recorder.getAmplitude();
    return amplitude.current;
  }

  void dispose() {
    _recorder.dispose();
  }
}