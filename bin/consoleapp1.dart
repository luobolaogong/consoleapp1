// ignore: library_prefixes
import 'package:consoleapp1/museScore.dart' as museScore;
import 'dart:convert';
import 'dart:io';

// For Dart API: https://api.dart.dev/stable/2.8.4/index.html

Future<void> main(List<String> arguments) async {
  // Load in a metronome definition.
  Map<String, dynamic> metronomeJsonFileMap = json.decode(await File('data/met.json').readAsString());

  // Build a MuseScore .mscx file and write it out for use by MuseScore.
  var museScoreXmlBuilder = museScore.buildMuseScore(metronomeJsonFileMap);
  final museScoreXml = museScoreXmlBuilder.build();
  var formattedMuseScoreString = museScoreXml.toXmlString(pretty: true, indent: '  ');
  final museScoreFileName = metronomeJsonFileMap['museScoreFileName'];
  await File(museScoreFileName).writeAsString(formattedMuseScoreString + '\n').then((File file) {
    print('Wrote file ${museScoreFileName}');
  });
  //print(formattedMuseScoreString);
}
