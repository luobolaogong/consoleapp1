// ignore: library_prefixes
import 'package:xml/xml.dart';
import 'package:consoleapp1/museScore.dart' as museScore;
import 'package:consoleapp1/diffMetSounds.dart' as diffMetSounds;
import 'package:consoleapp1/Setup.dart' as Setup;
import 'package:consoleapp1/Swing.dart' as Swing;
import 'package:consoleapp1/Composite.dart' as Composite;
import 'dart:convert';
import 'dart:io';

// For Dart API: https://api.dart.dev/stable/2.8.4/index.html

Future<void> main(List<String> arguments) async {
  // Load in a metronome definition.
  Map<String, dynamic> metronomeJsonFileMap = json.decode(await File('data/met.json').readAsString());

  // Build a MuseScore XML (.mscx) file and write it out for use by MuseScore.
  //
  // A MuseScore XML file is a kind of MusicXML file.  There's a DTD and maybe
  // an XSD (or whatever it's called) to describe this stuff if you can parse it.
  // There are basically two
  // parts, a setup section for all the instrument definitions and notation
  // definitions, and then there's the music section.
  //
  // We want code that creates the setup, and other code that
  // creates the specific music.  And those two parts need to go into a complete
  // XML file, so that it can be read in by MuseScore and played and played.
  //
  // MuseScore may not be the optimum player for drum parts.  For one thing I'm
  // not sure it can handle things like a quintuple starting on the last 24th
  // note of a bar and ending on the 2nd beat of the next bar.  In other words,
  // 5 notes against 7 24ths, which is a common pipe band snare idiom.  But I
  // don't know a better player.  I need to create notes, not assemble WAV files,
  // which is what Audacity does.
  //
  // An XmlBuilder helps create an XmlNode in a sequential tree fashion, which
  // may mean that in order to add parts within an XMLDocument we need to
  // find a root, and children, and attach child trees.  But we can also
  // maybe just add siblings like this:
  /*
  buildBook(XmlBuilder builder, String title, String language, num price) {
    builder.element('book', nest: () {
      builder.element('title', nest: () {
        builder.attribute('lang', 'english');
        builder.text(title);
      });
      builder.element('price', nest: price);
    });
  }
  */
  //
  // The basic hierarchy as concerned here is:
  // museScore
  //  Score
  //    Style
  //    MetaTags
  //    Part
  //      Staff
  //      Instrument
  //        Drum*
  //        clef
  //        Articulation*
  //        Channel
  //          controller
  //    Staff (diff level)
  //      VBox
  //      Measure*
  //        voice
  //          TimeSig
  //          Tempo
  //          Chord*
  //            Note*


  var museScoreXmlBuilder = Composite.buildMuseScore(metronomeJsonFileMap);

  // So first create an XmlBuilder that just has the shell, and then add the sections
  // inside it as children.
  //



//  var museScoreXmlBuilder = Setup.createMuseScoreXmlShell(metronomeJsonFileMap);
//  var museScoreXmlBuilder = Setup.setupMuseScoreXmlBuilder(metronomeJsonFileMap);
//  museScoreXmlBuilder = Swing.addToMuseScoreXmlBuilder(metronomeJsonFileMap, museScoreXmlBuilder);
  
  //var museScoreXmlBuilder = museScore.buildMuseScore(metronomeJsonFileMap);
  //museScoreXmlBuilder = diffMetSounds.diffMetSounds(metronomeJsonFileMap);
  final museScoreXml = museScoreXmlBuilder.build();
  var formattedMuseScoreString = museScoreXml.toXmlString(pretty: true, indent: '  ');
  final museScoreFileName = metronomeJsonFileMap['museScoreFileName'];
  await File(museScoreFileName).writeAsString(formattedMuseScoreString + '\n').then((File file) {
    print('Wrote file ${museScoreFileName}');
  });
  //print(formattedMuseScoreString);
}
