import 'package:xml/xml.dart';
// This file is the start of a more modular/functional approach
// to put a piece together.  It's mostly a tree traversal, going
// depth first.  Visit node, go first child, repeat, then sibling.
// Tuplets are a bit different though.  Just markers as you
// traverse.

//
// For now, assume the MuseScore XML file is this:
// museScore
//  ...
//  Score
//    ...
//    Style
//      ...
//    ...
//    metaTag*
//    Part
//      Staff
//        StaffType
//          ...
//        ...
//      ...
//      Instrument
//        ...
//        Drum*
//          ...
//          noteheads
//            ...
//          ...
//          variants
//            variant*
//              articulation
//        clef
//        Articulation*
//          ...
//        Channel
//          ...
// end Instrument, and end Part
// I think that the stuff above remains constant, but below changes by piece
//    Staff (diff level)
//      VBox
//        ...
//        Text
//          ...
//      Measure*
//        voice
//          RepeatMeasure maybe
//          TimeSig
//            ...
//          Tempo
//            ...
//          Tuplet
//            ...
//          Chord*
//            ...
//            Note
//              ...
//          Articulation???
//              ...
//            Note

XmlBuilder buildMuseScore(Map<String, dynamic> metronomeInputMap) {
  var xmlBuilder = XmlBuilder();
  xmlBuilder.processing('xml', 'version="1.0" encoding="UTF-8"');
  xmlBuilder.element('museScore', nest: () {
    xmlBuilder.attribute('version', '3.01');
    xmlBuilder.element('programVersion', nest: '3.2.3');
    xmlBuilder.element('programRevision', nest: 'd2d863f');
    xmlBuilder = buildScore(xmlBuilder, metronomeInputMap);
  });
  return xmlBuilder;
}

XmlBuilder buildScore(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('Score', nest: () {
    xmlBuilder.element('LayerTag', nest: () {
      xmlBuilder.attribute('id', 0);
      xmlBuilder.attribute('tag', 'default');
    });
    xmlBuilder.element('currentLayer', nest: 0);
    xmlBuilder.element('Division', nest: 480);

    xmlBuilder = buildStyle(xmlBuilder, metronomeInputMap);

    xmlBuilder.element('showInvisible', nest: 1);
    xmlBuilder.element('showUnprintable', nest: 1);
    xmlBuilder.element('showFrames', nest: 1);
    xmlBuilder.element('showMargins', nest: 0);

    xmlBuilder = buildMetaTags(xmlBuilder, metronomeInputMap);

    xmlBuilder = buildPart(xmlBuilder, metronomeInputMap);

    // Here's where the piece comes in
    xmlBuilder = buildStaff(xmlBuilder, metronomeInputMap);
  });
  return xmlBuilder;
}

XmlBuilder buildStyle(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('Style', nest: () {
    xmlBuilder.element('pageWidth', nest: 8.5);
    xmlBuilder.element('pageHeight', nest: 11);
    xmlBuilder.element('pagePrintableWidth', nest: 7.7126);
    xmlBuilder.element('pageEvenLeftMargin', nest: 0.393701);
    xmlBuilder.element('pageOddLeftMargin', nest: 0.393701);
    xmlBuilder.element('pageEvenTopMargin', nest: 0.393701);
    xmlBuilder.element('pageEvenBottomMargin', nest: 0.787403);
    xmlBuilder.element('pageOddTopMargin', nest: 0.393701);
    xmlBuilder.element('pageOddBottomMargin', nest: 0.787403);
    xmlBuilder.element('lyricsDashForce', nest: 0);
    xmlBuilder.element('lyricsOddFontFace', nest: 'Georgia');
    xmlBuilder.element('lyricsOddFontSize', nest: 10);
    xmlBuilder.element('lyricsOddFramePadding', nest: 0);
    xmlBuilder.element('lyricsOddFrameWidth', nest: 0);
    xmlBuilder.element('lyricsEvenFontFace', nest: 'Georgia');
    xmlBuilder.element('lyricsEvenFontSize', nest: 10);
    xmlBuilder.element('doubleBarDistance', nest: 0.46);
    xmlBuilder.element('endBarDistance', nest: 0.65);
    xmlBuilder.element('clefLeftMargin', nest: 0.64);
    xmlBuilder.element('clefKeyRightMargin', nest: 1.75);
    xmlBuilder.element('barNoteDistance', nest: 1.2);
    xmlBuilder.element('beamNoSlope', nest: 1);
    xmlBuilder.element('articulationAnchorDefault', nest: 3);
    xmlBuilder.element('hairpinFontFace', nest: 'Georgia');
    xmlBuilder.element('hairpinFramePadding', nest: 0);
    xmlBuilder.element('hairpinFrameWidth', nest: 0);
    xmlBuilder.element('pedalFontFace', nest: 'Georgia');
    xmlBuilder.element('pedalFramePadding', nest: 0);
    xmlBuilder.element('pedalFrameWidth', nest: 0);
    xmlBuilder.element('harmonyFretDist', nest: 0.5);
    xmlBuilder.element('chordSymbolAFontFace', nest: 'Georgia');
    xmlBuilder.element('chordSymbolAFramePadding', nest: 0);
    xmlBuilder.element('chordSymbolAFrameWidth', nest: 0);
    xmlBuilder.element('musicalSymbolFont', nest: 'Bravura');
    xmlBuilder.element('musicalTextFont', nest: 'Bravura Text');
    xmlBuilder.element('showHeader', nest: 1); // new
    xmlBuilder.element('headerFirstPage', nest: 1); // new
    xmlBuilder.element('evenHeaderL', nest: '\$P/\$n');
    xmlBuilder.element('evenHeaderC', nest: '\$d');
    xmlBuilder.element('oddHeaderL', nest: '\$d');
    xmlBuilder.element('oddHeaderR', nest: '\$P/\$n');
    xmlBuilder.element('footerOddEven', nest: 0);
    xmlBuilder.element('oddFooterC', nest: '\$F'); // \n works?
    xmlBuilder.element('voltaFontFace', nest: 'Georgia');
    xmlBuilder.element('voltaFramePadding', nest: 0);
    xmlBuilder.element('voltaFrameWidth', nest: 0);
    xmlBuilder.element('ottavaFontFace', nest: 'Georgia');
    xmlBuilder.element('ottavaFontStyle', nest: 2);
    xmlBuilder.element('ottavaFramePadding', nest: 0);
    xmlBuilder.element('ottavaFrameWidth', nest: 0);
    xmlBuilder.element('tupletFontFace', nest: 'Georgia');
    xmlBuilder.element('tupletFramePadding', nest: 0);
    xmlBuilder.element('tupletFrameWidth', nest: 0);
    xmlBuilder.element('textLineFramePadding', nest: 0);
    xmlBuilder.element('textLineFrameWidth', nest: 0);
    xmlBuilder.element('defaultFramePadding', nest: 0.5);
    xmlBuilder.element('defaultFrameWidth', nest: 0.2);
    xmlBuilder.element('defaultFrameRound', nest: 25);
    xmlBuilder.element('titleFontFace', nest: 'Arial Black');
    xmlBuilder.element('titleFontStyle', nest: 1);
    xmlBuilder.element('titleFramePadding', nest: 0);
    xmlBuilder.element('titleFrameWidth', nest: 0);
    xmlBuilder.element('titleFrameRound', nest: 25);
    xmlBuilder.element('subTitleFontFace', nest: 'Georgia');
    xmlBuilder.element('subTitleFontStyle', nest: 2);
    xmlBuilder.element('subTitleFramePadding', nest: 0);
    xmlBuilder.element('subTitleFrameWidth', nest: 0);
    xmlBuilder.element('subTitleFrameRound', nest: 25);
    xmlBuilder.element('composerFontFace', nest: 'Georgia');
    xmlBuilder.element('composerFontSize', nest: 11);
    xmlBuilder.element('composerFramePadding', nest: 0);
    xmlBuilder.element('composerFrameWidth', nest: 0);
    xmlBuilder.element('composerFrameRound', nest: 25);
    xmlBuilder.element('lyricistFontFace', nest: 'Georgia');
    xmlBuilder.element('lyricistFramePadding', nest: 0);
    xmlBuilder.element('lyricistFrameWidth', nest: 0);
    xmlBuilder.element('lyricistFrameRound', nest: 25);
    xmlBuilder.element('fingeringFontFace', nest: 'Arial');
    xmlBuilder.element('fingeringFramePadding', nest: 0);
    xmlBuilder.element('fingeringFrameWidth', nest: 0);
    xmlBuilder.element('fingeringFrameRound', nest: 25);
    xmlBuilder.element('lhGuitarFingeringFontFace', nest: 'Arial');
    xmlBuilder.element('lhGuitarFingeringFramePadding', nest: 0);
    xmlBuilder.element('lhGuitarFingeringFrameWidth', nest: 0);
    xmlBuilder.element('lhGuitarFingeringFrameRound', nest: 25);
    xmlBuilder.element('rhGuitarFingeringFontFace', nest: 'Arial');
    xmlBuilder.element('rhGuitarFingeringFramePadding', nest: 0);
    xmlBuilder.element('rhGuitarFingeringFrameWidth', nest: 0);
    xmlBuilder.element('rhGuitarFingeringFrameRound', nest: 25);
    xmlBuilder.element('stringNumberFontFace', nest: 'Arial');
    xmlBuilder.element('longInstrumentFontFace', nest: 'Georgia');
    xmlBuilder.element('longInstrumentFontSize', nest: 11);
    xmlBuilder.element('longInstrumentFramePadding', nest: 0);
    xmlBuilder.element('longInstrumentFrameWidth', nest: 0);
    xmlBuilder.element('shortInstrumentFontFace', nest: 'Georgia');
    xmlBuilder.element('shortInstrumentFontSize', nest: 11);
    xmlBuilder.element('shortInstrumentFramePadding', nest: 0);
    xmlBuilder.element('shortInstrumentFrameWidth', nest: 0);
    xmlBuilder.element('partInstrumentFontFace', nest: 'Arial Black');
    xmlBuilder.element('partInstrumentFontSize', nest: 14);
    xmlBuilder.element('partInstrumentFramePadding', nest: 0);
    xmlBuilder.element('partInstrumentFrameWidth', nest: 0);
    xmlBuilder.element('partInstrumentFrameRound', nest: 25);
    xmlBuilder.element('dynamicsFontFace', nest: 'Georgia');
    xmlBuilder.element('dynamicsFramePadding', nest: 0);
    xmlBuilder.element('dynamicsFrameWidth', nest: 0);
    xmlBuilder.element('expressionFontFace', nest: 'Georgia');
    xmlBuilder.element('expressionFontSize', nest: 12);
    xmlBuilder.element('expressionFramePadding', nest: 0);
    xmlBuilder.element('expressionFrameWidth', nest: 0);
    xmlBuilder.element('tempoFontFace', nest: 'Palatino');
    xmlBuilder.element('tempoFontSize', nest: 11);
    xmlBuilder.element('tempoFramePadding', nest: 0);
    xmlBuilder.element('tempoFrameWidth', nest: 0);
    xmlBuilder.element('tempoFrameRound', nest: 25);
    xmlBuilder.element('metronomeFontFace', nest: 'Georgia');
    xmlBuilder.element('metronomeFramePadding', nest: 0);
    xmlBuilder.element('metronomeFrameWidth', nest: 0);
    xmlBuilder.element('measureNumberFontFace', nest: 'Georgia');
    xmlBuilder.element('measureNumberAlign', nest: 'center,bottom');
    xmlBuilder.element('measureNumberFramePadding', nest: 0);
    xmlBuilder.element('measureNumberFrameWidth', nest: 0);
    xmlBuilder.element('translatorFontFace', nest: 'Georgia');
    xmlBuilder.element('translatorAlign', nest: 'center,top');
    xmlBuilder.element('translatorFramePadding', nest: 0);
    xmlBuilder.element('translatorFrameWidth', nest: 0);
    xmlBuilder.element('systemFontFace', nest: 'Georgia');
    xmlBuilder.element('systemFontStyle', nest: 2);
    xmlBuilder.element('systemAlign', nest: 'left,top');
    xmlBuilder.element('systemFramePadding', nest: 0);
    xmlBuilder.element('systemFrameWidth', nest: 0);
    xmlBuilder.element('systemFrameRound', nest: 25);
    xmlBuilder.element('staffFontFace', nest: 'Georgia');
    xmlBuilder.element('staffFontStyle', nest: 2);
    xmlBuilder.element('staffAlign', nest: 'left,top');
    xmlBuilder.element('staffPosAbove', nest: () {
      xmlBuilder.attribute('x', 0);
      xmlBuilder.attribute('y', -4);
    });
    xmlBuilder.element('staffFramePadding', nest: 0);
    xmlBuilder.element('staffFrameWidth', nest: 0);
    xmlBuilder.element('staffFrameRound', nest: 25);
    xmlBuilder.element('rehearsalMarkFontFace', nest: 'Palatino');
    xmlBuilder.element('rehearsalMarkFrameType', nest: 2);
    xmlBuilder.element('rehearsalMarkFramePadding', nest: 0.2);
    xmlBuilder.element('repeatLeftFontFace', nest: 'Georgia');
    xmlBuilder.element('repeatLeftFramePadding', nest: 0);
    xmlBuilder.element('repeatLeftFrameWidth', nest: 0);
    xmlBuilder.element('repeatLeftFrameRound', nest: 25);
    xmlBuilder.element('repeatRightFontFace', nest: 'Georgia');
    xmlBuilder.element('repeatRightFramePadding', nest: 0);
    xmlBuilder.element('repeatRightFrameWidth', nest: 0);
    xmlBuilder.element('repeatRightFrameRound', nest: 25);
    xmlBuilder.element('frameFontFace', nest: 'Georgia');
    xmlBuilder.element('frameFramePadding', nest: 0);
    xmlBuilder.element('frameFrameWidth', nest: 0);
    xmlBuilder.element('textLineFontFace', nest: 'Georgia');
    xmlBuilder.element('glissandoFontFace', nest: 'Georgia');
    xmlBuilder.element('glissandoAlign', nest: 'center,baseline');
    xmlBuilder.element('glissandoFramePadding', nest: 0);
    xmlBuilder.element('glissandoFrameWidth', nest: 0);
    xmlBuilder.element('bendFontFace', nest: 'Georgia');
    xmlBuilder.element('bendAlign', nest: 'center,center');
    xmlBuilder.element('bendFramePadding', nest: 0);
    xmlBuilder.element('bendFrameWidth', nest: 0);
    xmlBuilder.element('headerFontFace', nest: 'Palatino');
    xmlBuilder.element('headerAlign', nest: 'center,top');
    xmlBuilder.element('headerFramePadding', nest: 0);
    xmlBuilder.element('headerFrameWidth', nest: 0);
    xmlBuilder.element('footerFontFace', nest: 'Palatino');
    xmlBuilder.element('footerAlign', nest: 'center,bottom');
    xmlBuilder.element('footerFramePadding', nest: 0);
    xmlBuilder.element('footerFrameWidth', nest: 0);
    xmlBuilder.element('instrumentChangeFontFace', nest: 'Arial');
    xmlBuilder.element('instrumentChangeFontSize', nest: 11);
    xmlBuilder.element('instrumentChangeFontStyle', nest: 0);
    xmlBuilder.element('instrumentChangeAlign', nest: 'left,bottom');
    xmlBuilder.element('instrumentChangeFramePadding', nest: 0);
    xmlBuilder.element('instrumentChangeFrameWidth', nest: 0);
    xmlBuilder.element('user1Name', nest: 'Repeat Text');
    xmlBuilder.element('user1FontFace', nest: 'Georgia');
    xmlBuilder.element('user1FontSize', nest: 12);
    xmlBuilder.element('user1Align', nest: 'right,baseline');
    xmlBuilder.element('user1FramePadding', nest: 0);
    xmlBuilder.element('user1FrameWidth', nest: 0);
    xmlBuilder.element('Spatium', nest: 1.76389);
  });
  return xmlBuilder;
}

XmlBuilder buildMetaTags(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'arranger');
    xmlBuilder.text(metronomeInputMap['arranger'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'composer');
    xmlBuilder.text(metronomeInputMap['composer'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'copyright');
    xmlBuilder.text(metronomeInputMap['copyright'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'creationDate');
    xmlBuilder.text(metronomeInputMap['creationDate'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'lyricist');
    xmlBuilder.text(metronomeInputMap['lyricist'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'movementNumber');
    xmlBuilder.text(metronomeInputMap['movementNumber'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'movementTitle');
    xmlBuilder.text(metronomeInputMap['movementTitle'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'platform');
    xmlBuilder.text('Linux');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'poet');
    xmlBuilder.text(metronomeInputMap['poet'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'source');
    xmlBuilder.text(metronomeInputMap['source'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'translator');
    xmlBuilder.text(metronomeInputMap['translator'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'workNumber');
    xmlBuilder.text(metronomeInputMap['workNumber'] ?? '');
  });
  xmlBuilder.element('metaTag', nest: () {
    xmlBuilder.attribute('name', 'workTitle');
    xmlBuilder.text(metronomeInputMap['workTitle'] ?? '');
  });
  return xmlBuilder;
}

XmlBuilder buildPart(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('Part', nest: () {
    xmlBuilder.element('Staff', nest: () {
      xmlBuilder.attribute('id', 1);
      xmlBuilder.element('StaffType', nest: () {
        xmlBuilder.attribute('group', 'percussion');
        xmlBuilder.element('name', nest: 'perc5Line');
        xmlBuilder.element('lines', nest: 1);
        xmlBuilder.element('keysig', nest: 0);
      });
      xmlBuilder.element('defaultClef', nest: 'PERC');
    });
    xmlBuilder.element('trackName', nest: 'MDL Snare Line A');
    xmlBuilder = buildInstrument(xmlBuilder, metronomeInputMap);
  });

  return xmlBuilder;
}
XmlBuilder buildInstrument(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('Instrument', nest: () {
    xmlBuilder.element('longName', nest: 'Snare Line');
    xmlBuilder.element('shortName', nest: 'S. L.');
    xmlBuilder.element('trackName', nest: 'MDL Snare Line A');
    xmlBuilder.element('instrumentId', nest: 'mdl.drum.snare-drum');
    xmlBuilder.element('useDrumset', nest: 1);

    // Here comes a bunch of drum definitions.  Should come in from a table?
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '21');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteShapeTriangleLeftWhite');
        xmlBuilder.element('half', nest: 'noteShapeTriangleLeftWhite');
        xmlBuilder.element('quarter', nest: 'noteShapeTriangleLeftBlack');
        xmlBuilder.element('breve', nest: 'noteShapeTriangleLeftWhite');
      });
      xmlBuilder.element('line', nest: '-1');
      xmlBuilder.element('voice', nest: 0);
      xmlBuilder.element('name', nest: 'Metronome');
      xmlBuilder.element('stem', nest: 1);
      xmlBuilder.element('variants', nest: () {
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '34');
          xmlBuilder.element('articulation', nest: 'sforzato');
        });
      });
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '23');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadPlusWhole');
        xmlBuilder.element('half', nest: 'noteheadPlusHalf');
        xmlBuilder.element('quarter', nest: 'noteheadPlusBlack');
        xmlBuilder.element('breve', nest: 'noteheadPlusDoubleWhole');
      });
      xmlBuilder.element('line', nest: '-1');
      xmlBuilder.element('voice', nest: 0);
      xmlBuilder.element('name', nest: 'Hand Clap');
      xmlBuilder.element('stem', nest: 1);
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '27');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadTriangleDownWhole');
        xmlBuilder.element('half', nest: 'noteheadTriangleDownHalf');
        xmlBuilder.element('quarter', nest: 'noteheadTriangleDownBlack');
        xmlBuilder.element('breve', nest: 'noteheadTriangleUpDoubleWhole');
      });
      xmlBuilder.element('line', nest: 1);
      xmlBuilder.element('voice', nest: 0);
      xmlBuilder.element('name', nest: 'Dut');
      xmlBuilder.element('stem', nest: 1);
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '28');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadTriangleDownWhole');
        xmlBuilder.element('half', nest: 'noteheadTriangleDownHalf');
        xmlBuilder.element('quarter', nest: 'noteheadTriangleDownBlack');
        xmlBuilder.element('breve', nest: 'noteheadTriangleDownDoubleWhole');
      });
      xmlBuilder.element('line', nest: 1);
      xmlBuilder.element('voice', nest: 0);
      xmlBuilder.element('name', nest: 'Dut Unison');
      xmlBuilder.element('stem', nest: 1);
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '60');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('line', nest: 0);
      xmlBuilder.element('voice', nest: 0);
      xmlBuilder.element('name', nest: 'Hit');
      xmlBuilder.element('stem', nest: 1);
      xmlBuilder.element('shortcut', nest: 'A');
      xmlBuilder.element('variants', nest: () {
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('tremolo', nest: 'r16');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('articulation', nest: 'sforzato');
          xmlBuilder.element('tremolo', nest: 'r16');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('articulation', nest: 'tenuto');
          xmlBuilder.element('tremolo', nest: 'r16');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('articulation', nest: 'marcato');
          xmlBuilder.element('tremolo', nest: 'r16');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('articulation', nest: 'staccato');
          xmlBuilder.element('tremolo', nest: 'r16');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('articulation', nest: 'staccatissimo');
          xmlBuilder.element('tremolo', nest: 'r16');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '59');
          xmlBuilder.element('articulation', nest: 'portato');
          xmlBuilder.element('tremolo', nest: 'r16');
        });

        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('articulation', nest: 'sforzato');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('articulation', nest: 'tenuto');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('articulation', nest: 'marcato');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('articulation', nest: 'staccato');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('articulation', nest: 'staccatissimo');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });
        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '57');
          xmlBuilder.element('articulation', nest: 'portato');
          xmlBuilder.element('tremolo', nest: 'buzzroll');
        });

        xmlBuilder.element('variant', nest: () {
          xmlBuilder.attribute('pitch', '58');
          xmlBuilder.element('articulation', nest: 'mordent-inverted');
        });
      });
    });

    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '61');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadXOrnate');
        xmlBuilder.element('half', nest: 'noteheadXOrnate');
        xmlBuilder.element('quarter', nest: 'noteheadXOrnate');
        xmlBuilder.element('breve', nest: 'noteheadXOrnate');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Rim Shot');
      xmlBuilder.element('stem', nest: '1');
      xmlBuilder.element('shortcut', nest: 'B');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '62');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadSlashedWhole1');
        xmlBuilder.element('half', nest: 'noteheadSlashedHalf1');
        xmlBuilder.element('quarter', nest: 'noteheadSlashedBlack1');
        xmlBuilder.element('breve', nest: 'noteheadSlashedDoubleWhole1');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Rim Knock');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '63');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadXWhole');
        xmlBuilder.element('half', nest: 'noteheadXHalf');
        xmlBuilder.element('quarter', nest: 'noteheadXBlack');
        xmlBuilder.element('breve', nest: 'noteheadXDoubleWhole');
      });
      xmlBuilder.element('line', nest: '-1');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Rim');
      xmlBuilder.element('stem', nest: '1');
      xmlBuilder.element('shortcut', nest: 'E');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '64');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadRoundWhiteWithDot');
        xmlBuilder.element('half', nest: 'noteheadRoundWhiteWithDot');
        xmlBuilder.element('quarter', nest: 'noteheadRoundWhiteWithDot');
        xmlBuilder.element('breve', nest: 'noteheadRoundWhiteWithDot');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Ping Shot');
      xmlBuilder.element('stem', nest: '1');
      xmlBuilder.element('shortcut', nest: 'C');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '65');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadSlashedWhole2');
        xmlBuilder.element('half', nest: 'noteheadSlashedHalf2');
        xmlBuilder.element('quarter', nest: 'noteheadSlashedBlack2');
        xmlBuilder.element('breve', nest: 'noteheadSlashedDoubleWhole2');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Stick Shot');
      xmlBuilder.element('stem', nest: '1');
      xmlBuilder.element('shortcut', nest: 'D');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '67');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteShapeTriangleRoundWhite');
        xmlBuilder.element('half', nest: 'noteShapeTriangleRoundWhite');
        xmlBuilder.element('quarter', nest: 'noteheadTriangleRoundDownBlack');
        xmlBuilder.element('breve', nest: 'noteShapeTriangleRoundWhite');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Backstick/Visual');
      xmlBuilder.element('stem', nest: '1');
      xmlBuilder.element('shortcut', nest: 'F');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '68');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadPlusWhole');
        xmlBuilder.element('half', nest: 'noteheadPlusHalf');
        xmlBuilder.element('quarter', nest: 'noteheadPlusBlack');
        xmlBuilder.element('breve', nest: 'noteheadPlusDoubleWhole');
      });
      xmlBuilder.element('line', nest: '-1');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Hand Hit');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '72');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadDiamondWhole');
        xmlBuilder.element('half', nest: 'noteheadDiamondHalf');
        xmlBuilder.element('quarter', nest: 'noteheadDiamondBlack');
        xmlBuilder.element('breve', nest: 'noteheadDiamondDoubleWhole');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Rods');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '73');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadTriangleUpWhole');
        xmlBuilder.element('half', nest: 'noteheadTriangleUpHalf');
        xmlBuilder.element('quarter', nest: 'noteheadTriangleUpBlack');
        xmlBuilder.element('breve', nest: 'noteheadTriangleUpDoubleWhole');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Brushes');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '74');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadMoonWhite');
        xmlBuilder.element('half', nest: 'noteheadMoonWhite');
        xmlBuilder.element('quarter', nest: 'noteheadMoonBlack');
        xmlBuilder.element('breve', nest: 'noteheadMoonWhite');
      });
      xmlBuilder.element('line', nest: '1');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Shells');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '75');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadCircleSlash');
        xmlBuilder.element('half', nest: 'noteheadCircleSlash');
        xmlBuilder.element('quarter', nest: 'noteheadCircleSlash');
        xmlBuilder.element('breve', nest: 'noteheadCircleSlash');
      });
      xmlBuilder.element('line', nest: '1');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Harness Hit');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '76');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteheadXWhole');
        xmlBuilder.element('half', nest: 'noteheadXHalf');
        xmlBuilder.element('quarter', nest: 'noteheadXBlack');
        xmlBuilder.element('breve', nest: 'noteheadMoonBlack');
      });
      xmlBuilder.element('line', nest: '-2');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Stick Click');
      xmlBuilder.element('stem', nest: '1');
      xmlBuilder.element('shortcut', nest: 'G');
    });
    xmlBuilder.element('Drum', nest: () {
      xmlBuilder.attribute('pitch', '77');
      xmlBuilder.element('head', nest: 'normal');
      xmlBuilder.element('noteheads', nest: () {
        xmlBuilder.element('whole', nest: 'noteShapeTriangleLeftWhite');
        xmlBuilder.element('half', nest: 'noteShapeTriangleLeftWhite');
        xmlBuilder.element('quarter', nest: 'noteheadSquareBlack');
        xmlBuilder.element('breve', nest: 'noteShapeTriangleLeftWhite');
      });
      xmlBuilder.element('line', nest: '0');
      xmlBuilder.element('voice', nest: '0');
      xmlBuilder.element('name', nest: 'Sticks In');
      xmlBuilder.element('stem', nest: '1');
    });
    xmlBuilder.element('clef', nest: 'PERC');

    // Here comes some Articulation elements
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.element('velocity', nest: 100);
      xmlBuilder.element('gateTime', nest: 100);
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'staccatissimo');

      xmlBuilder.element('velocity', nest: 100);
      xmlBuilder.element('gateTime', nest: '33');
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'staccato');
      xmlBuilder.element('velocity', nest: 100);
      xmlBuilder.element('gateTime', nest: '50');
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'portato');
      xmlBuilder.element('velocity', nest: '100');
      xmlBuilder.element('gateTime', nest: '100');
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'tenuto');
      xmlBuilder.element('velocity', nest: '115');
      xmlBuilder.element('gateTime', nest: '100');
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'marcato');
      xmlBuilder.element('velocity', nest: '127');
      xmlBuilder.element('gateTime', nest: '80');
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'sforzato');
      xmlBuilder.element('velocity', nest: '127');
      xmlBuilder.element('gateTime', nest: '100');
    });
    xmlBuilder.element('Articulation', nest: () {
      xmlBuilder.attribute('name', 'plusstop');
      xmlBuilder.element('velocity', nest: '80');
      xmlBuilder.element('gateTime', nest: '80');
    });

    // and a channel
    xmlBuilder.element('Channel', nest: () {
      xmlBuilder.element('controller', nest: () {
        xmlBuilder.attribute('ctrl', '0');
        xmlBuilder.attribute('value', '0');
      });
      xmlBuilder.element('controller', nest: () {
        xmlBuilder.attribute('ctrl', '32');
        xmlBuilder.attribute('value', '0');
      });
      xmlBuilder.element('program', nest: () {
        xmlBuilder.attribute('value', 6);
      });
      xmlBuilder.element('controller', nest: () {
        xmlBuilder.attribute('ctrl', '7');
        xmlBuilder.attribute('value', '106');
      });
      xmlBuilder.element('synti', nest: 'Zerberus'); // ??
    });  // end of channel
  });

  return xmlBuilder;
}

XmlBuilder buildStaff(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('Staff', nest: ()
  {
    xmlBuilder.attribute('id', 1);

    xmlBuilder.element('VBox', nest: () {
      xmlBuilder.element('height', nest: '10');
      xmlBuilder.element('Text', nest: () {
        xmlBuilder.element('style', nest: 'Title');
        xmlBuilder.element('text', nest: metronomeInputMap['title']);
      });
      xmlBuilder.element('Text', nest: () {
        xmlBuilder.element('style', nest: 'Subtitle');
        xmlBuilder.element('text', nest: metronomeInputMap['subTitle']);
      });
      xmlBuilder.element('Text', nest: () {
        xmlBuilder.element('style', nest: 'Composer');
        xmlBuilder.element('text', nest: metronomeInputMap['composer']);
      });
    }); // end VBox
    xmlBuilder = buildMeasures(xmlBuilder, metronomeInputMap);
  });
  //measures here
  return xmlBuilder;
}
XmlBuilder buildMeasures(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  // This is going to be for the Roll Off
  // This is perhaps where I start to read the drum music language data file, in JSON.
  // This is what contains my drum language.
  // But for now I'm just putting in the rolloff stuff.
  // The following is 6 4/4 bars.  First bar just quarter notes.
  // Next 5 bars are 16th note swing (12th 24th, 12th 24th, ...)
  //
  // First bar:
  xmlBuilder.element('Measure', nest: () {
    xmlBuilder.element('voice', nest: () {
      xmlBuilder.element('TimeSig', nest: () {
        xmlBuilder.element('sigN', nest: '4');
        xmlBuilder.element('sigD', nest: '4');
      });
      xmlBuilder.element('Tempo', nest: () {
        xmlBuilder.element('tempo', nest: metronomeInputMap['tempo'] / 60.0);
        xmlBuilder.element('followText', nest: '1');
        xmlBuilder.element('text', nest: () {
          xmlBuilder.element('sym', nest: 'metNoteQuarterUp');
          xmlBuilder.text(' = ${metronomeInputMap['tempo']}');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'quarter');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '21');
          xmlBuilder.element('tpc', nest: '17');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'quarter');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '21');
          xmlBuilder.element('tpc', nest: '17');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'quarter');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '21');
          xmlBuilder.element('tpc', nest: '17');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'quarter');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '21');
          xmlBuilder.element('tpc', nest: '17');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
    });
  });

  // Second bar:
  xmlBuilder.element('Measure', nest: () {
    xmlBuilder.element('LayoutBreak', nest: () {
      xmlBuilder.element('subtype', nest: 'line');
    });
    xmlBuilder.element('voice', nest: () {
      // Indicate start of a tuplet, but don't nest the notes in this object
      xmlBuilder.element('Tuplet', nest: () {
        xmlBuilder.element('normalNotes', nest: '4');
        xmlBuilder.element('actualNotes', nest: '6');
        xmlBuilder.element('baseNote', nest: '16th');
        xmlBuilder.element('Number', nest: () {
          xmlBuilder.element('style', nest: 'Tuplet');
          xmlBuilder.element('text', nest: '6');
        });
      });
      // 12th note
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      // 24th note
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      // 12th note
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      // 24th note
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });

      // Don't know why they did it this way, but this marks the end
      // of the tuplet.  They don't nest everything in a tuplet.
      // Is it so it can go ver a bar line, or off beat?
      xmlBuilder.element('endTuplet');

      // Start a new tuplet
      xmlBuilder.element('Tuplet', nest: () {
        xmlBuilder.element('normalNotes', nest: '4');
        xmlBuilder.element('actualNotes', nest: '6');
        xmlBuilder.element('baseNote', nest: '16th');
        xmlBuilder.element('Number', nest: () {
          xmlBuilder.element('style', nest: 'Tuplet');
          xmlBuilder.element('text', nest: '6');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth'); // 8th note but in tuple
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th'); // 16th == 24th
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('endTuplet'); // marker to end previoustuple

      xmlBuilder.element('Tuplet', nest: () {
        xmlBuilder.element('normalNotes', nest: '4');
        xmlBuilder.element('actualNotes', nest: '6');
        xmlBuilder.element('baseNote', nest: '16th');
        xmlBuilder.element('Number', nest: () {
          xmlBuilder.element('style', nest: 'Tuplet');
          xmlBuilder.element('text', nest: '6');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });

      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('endTuplet'); // marks end of tuple

      xmlBuilder.element('Tuplet', nest: () {
        xmlBuilder.element('normalNotes', nest: '4');
        xmlBuilder.element('actualNotes', nest: '6');
        xmlBuilder.element('baseNote', nest: '16th');
        xmlBuilder.element('Number', nest: () {
          xmlBuilder.element('style', nest: 'Tuplet');
          xmlBuilder.element('text', nest: '6');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: 'eighth');
        xmlBuilder.element('Articulation', nest: () {
          xmlBuilder.element('direction', nest: 'up');
          xmlBuilder.element('subtype', nest: 'articAccentAbove');
        });
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      });
      xmlBuilder.element('Chord', nest: () {
        xmlBuilder.element('durationType', nest: '16th');
        xmlBuilder.element('StemDirection', nest: 'up');
        xmlBuilder.element('Note', nest: () {
          xmlBuilder.element('pitch', nest: '62');
          xmlBuilder.element('tpc', nest: '16');
          xmlBuilder.element('head', nest: 'custom');
        });
      }); // end Chord
      xmlBuilder.element('endTuplet'); // not sure why this is here or if nec?
    }); // end voice?????
  }); // end measure

  // The remaining bars are repeats
  xmlBuilder.element('Measure', nest: () {
    xmlBuilder.element('voice', nest: () {
      xmlBuilder.element('RepeatMeasure', nest: () {
        xmlBuilder.element('offset', nest: () {
          xmlBuilder.attribute('x', '0');
          xmlBuilder.attribute('y', '-2');
        });
        xmlBuilder.element('durationType', nest: 'measure');
        xmlBuilder.element('duration', nest: '4/4');
      });
    }); // end voice
  }); // end measure
  xmlBuilder.element('Measure', nest: () {
    xmlBuilder.element('voice', nest: () {
      xmlBuilder.element('RepeatMeasure', nest: () {
        xmlBuilder.element('offset', nest: () {
          xmlBuilder.attribute('x', '0');
          xmlBuilder.attribute('y', '-2');
        });
        xmlBuilder.element('durationType', nest: 'measure');
        xmlBuilder.element('duration', nest: '4/4');
      });
    }); // end voice
  }); // end measure
  xmlBuilder.element('Measure', nest: () {
    xmlBuilder.element('voice', nest: () {
      xmlBuilder.element('RepeatMeasure', nest: () {
        xmlBuilder.element('offset', nest: () {
          xmlBuilder.attribute('x', '0');
          xmlBuilder.attribute('y', '-2');
        });
        xmlBuilder.element('durationType', nest: 'measure');
        xmlBuilder.element('duration', nest: '4/4');
      }); // end RepeatMeasure
    }); // end voice
  }); // end Measure

  xmlBuilder.element('Measure', nest: () {
    xmlBuilder.element('voice', nest: () {
      xmlBuilder.element('RepeatMeasure', nest: () {
        xmlBuilder.element('offset', nest: () {
          xmlBuilder.attribute('x', '0');
          xmlBuilder.attribute('y', '-2');
        });
        xmlBuilder.element('durationType', nest: 'measure');
        xmlBuilder.element('duration', nest: '4/4');
      });
    });
  });
  return xmlBuilder;
}

XmlBuilder buildDrum(XmlBuilder xmlBuilder, Map<String, dynamic> metronomeInputMap) {
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '61');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadXOrnate');
      xmlBuilder.element('half', nest: 'noteheadXOrnate');
      xmlBuilder.element('quarter', nest: 'noteheadXOrnate');
      xmlBuilder.element('breve', nest: 'noteheadXOrnate');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Rim Shot');
    xmlBuilder.element('stem', nest: 1);
    xmlBuilder.element('shortcut', nest: 'B');
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '62');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadSlashedWhole1');
      xmlBuilder.element('half', nest: 'noteheadSlashedHalf1');
      xmlBuilder.element('quarter', nest: 'noteheadSlashedBlack1');
      xmlBuilder.element('breve', nest: 'noteheadSlashedDoubleWhole1');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Rim Knock');
    xmlBuilder.element('stem', nest: 1);
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '63');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadXWhole');
      xmlBuilder.element('half', nest: 'noteheadXHalf');
      xmlBuilder.element('quarter', nest: 'noteheadXBlack');
      xmlBuilder.element('breve', nest: 'noteheadXDoubleWhole');
    });
    xmlBuilder.element('line', nest: '-1');
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Rim');
    xmlBuilder.element('stem', nest: 1);
    xmlBuilder.element('shortcut', nest: 'E');
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '64');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadRoundWhiteWithDot');
      xmlBuilder.element('half', nest: 'noteheadRoundWhiteWithDot');
      xmlBuilder.element('quarter', nest: 'noteheadRoundWhiteWithDot');
      xmlBuilder.element('breve', nest: 'noteheadRoundWhiteWithDot');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Ping Shot');
    xmlBuilder.element('stem', nest: 1);
    xmlBuilder.element('shortcut', nest: 'C');
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '65');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadSlashedWhole2');
      xmlBuilder.element('half', nest: 'noteheadSlashedHalf2');
      xmlBuilder.element('quarter', nest: 'noteheadSlashedBlack2');
      xmlBuilder.element('breve', nest: 'noteheadSlashedDoubleWhole2');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Stick Shot');
    xmlBuilder.element('stem', nest: 1);
    xmlBuilder.element('shortcut', nest: 'D');
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '67');

    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteShapeTriangleRoundWhite');
      xmlBuilder.element('half', nest: 'noteShapeTriangleRoundWhite');
      xmlBuilder.element('quarter', nest: 'noteheadTriangleRoundDownBlack');
      xmlBuilder.element('breve', nest: 'noteShapeTriangleRoundWhite');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Backstick/Visual');
    xmlBuilder.element('stem', nest: 1);
    xmlBuilder.element('shortcut', nest: 'F');
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '68');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadPlusWhole');
      xmlBuilder.element('half', nest: 'noteheadPlusHalf');
      xmlBuilder.element('quarter', nest: 'noteheadPlusBlack');
      xmlBuilder.element('breve', nest: 'noteheadPlusDoubleWhole');
    });
    xmlBuilder.element('line', nest: '                    -1');
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Hand Hit');
    xmlBuilder.element('stem', nest: 1);
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '72');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadDiamondWhole');
      xmlBuilder.element('half', nest: 'noteheadDiamondHalf');
      xmlBuilder.element('quarter', nest: 'noteheadDiamondBlack');
      xmlBuilder.element('breve', nest: 'noteheadDiamondDoubleWhole');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Rods');
    xmlBuilder.element('stem', nest: 1);
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '73');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadTriangleUpWhole');
      xmlBuilder.element('half', nest: 'noteheadTriangleUpHalf');
      xmlBuilder.element('quarter', nest: 'noteheadTriangleUpBlack');
      xmlBuilder.element('breve', nest: 'noteheadTriangleUpDoubleWhole');
    });
    xmlBuilder.element('line', nest: 0);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Brushes');
    xmlBuilder.element('stem', nest: 1);
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '74');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadMoonWhite');
      xmlBuilder.element('half', nest: 'noteheadMoonWhite');
      xmlBuilder.element('quarter', nest: 'noteheadMoonBlack');
      xmlBuilder.element('breve', nest: 'noteheadMoonWhite');
    });
    xmlBuilder.element('line', nest: 1);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Shells');
    xmlBuilder.element('stem', nest: 1);
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '75');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadCircleSlash');
      xmlBuilder.element('half', nest: 'noteheadCircleSlash');
      xmlBuilder.element('quarter', nest: 'noteheadCircleSlash');
      xmlBuilder.element('breve', nest: 'noteheadCircleSlash');
    });
    xmlBuilder.element('line', nest: 1);
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Harness Hit');
    xmlBuilder.element('stem', nest: 1);
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '76');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteheadXWhole');
      xmlBuilder.element('half', nest: 'noteheadXHalf');
      xmlBuilder.element('quarter', nest: 'noteheadXBlack');
      xmlBuilder.element('breve', nest: 'noteheadMoonBlack');
    });
    xmlBuilder.element('line', nest: '-2');
    xmlBuilder.element('voice', nest: 0);
    xmlBuilder.element('name', nest: 'Stick Click');
    xmlBuilder.element('stem', nest: 1);
    xmlBuilder.element('shortcut', nest: 'G');
  });
  xmlBuilder.element('Drum', nest: () {
    xmlBuilder.attribute('pitch', '77');
    xmlBuilder.element('head', nest: 'normal');
    xmlBuilder.element('noteheads', nest: () {
      xmlBuilder.element('whole', nest: 'noteShapeTriangleLeftWhite');
      xmlBuilder.element('half', nest: 'noteShapeTriangleLeftWhite');
      xmlBuilder.element('quarter', nest: 'noteheadSquareBlack');
      xmlBuilder.element('breve', nest: 'noteShapeTriangleLeftWhite');
    });

  });
  return xmlBuilder;
}
