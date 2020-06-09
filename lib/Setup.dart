import 'package:xml/xml.dart';

XmlNode createXmlShell(Map<String, dynamic> metronomeInputMap) {
  final museScoreXmlBuilder = XmlBuilder();
  museScoreXmlBuilder.processing('xml', 'version="1.0" encoding="UTF-8"');
  museScoreXmlBuilder.element('museScore', nest: () {
    museScoreXmlBuilder.attribute('version', '3.01');
    museScoreXmlBuilder.element('programVersion', nest: '3.2.3');
    museScoreXmlBuilder.element('programRevision', nest: 'd2d863f');
  });
  return museScoreXmlBuilder.build();
}

XmlNode createScore(XmlNode shell) {
//  shell.
//  shell.element('Score', nest: () {
//
//  });
  return shell;
}

XmlBuilder setupMuseScoreXmlBuilder(Map<String, dynamic> metronomeInputMap) {
  var now = DateTime.now();
  var museScoreFileName = metronomeInputMap['museScoreFileName'];
  var title = metronomeInputMap['title'] ?? museScoreFileName;
  var subTitle = metronomeInputMap['subTitle'] ?? '';
  var composer = metronomeInputMap['composer'] ?? '';
  var arranger = metronomeInputMap['arranger'] ?? '';
  var copyrightDate = metronomeInputMap['copyrightDate'] ?? 'copyleft ${now.year}';
  var creationDate = metronomeInputMap['creationDate'] ?? '${now.month}/${now.day}/${now.year}';
  var workingTitle = metronomeInputMap['workingTitle'] ?? '';
  // following are unused because we just want to have one note for each sound
  var sigNumerator = metronomeInputMap['sigNumerator'] ?? 4;
  var sigDenominator = metronomeInputMap['sigDenominator'] ?? 4;
  var tempo = metronomeInputMap['tempo'] ?? 84;
  var nBars = metronomeInputMap['nBars'] ?? 32;

  final museScoreXmlBuilder = XmlBuilder();
  museScoreXmlBuilder.processing('xml', 'version="1.0" encoding="UTF-8"');
  museScoreXmlBuilder.element('museScore', nest: () {
    museScoreXmlBuilder.attribute('version', '3.01');
    museScoreXmlBuilder.element('programVersion', nest: '3.2.3');
    museScoreXmlBuilder.element('programRevision', nest: 'd2d863f');
    museScoreXmlBuilder.element('Score', nest: () {
      museScoreXmlBuilder.element('LayerTag', nest: () {
        museScoreXmlBuilder.attribute('id', 0);
        museScoreXmlBuilder.attribute('tag', 'default');
      });
      museScoreXmlBuilder.element('currentLayer', nest: 0);
      museScoreXmlBuilder.element('Division', nest: 480);
      museScoreXmlBuilder.element('Style', nest: () {
        museScoreXmlBuilder.element('pageWidth', nest: 8.5);
        museScoreXmlBuilder.element('pageHeight', nest: 11);
        museScoreXmlBuilder.element('pagePrintableWidth', nest: 7.7126);
        museScoreXmlBuilder.element('pageEvenLeftMargin', nest: 0.393701);
        museScoreXmlBuilder.element('pageOddLeftMargin', nest: 0.393701);
        museScoreXmlBuilder.element('pageEvenTopMargin', nest: 0.393701);
        museScoreXmlBuilder.element('pageEvenBottomMargin', nest: 0.787403);
        museScoreXmlBuilder.element('pageOddTopMargin', nest: 0.393701);
        museScoreXmlBuilder.element('pageOddBottomMargin', nest: 0.787403);
        museScoreXmlBuilder.element('lyricsDashForce', nest: 0);
        museScoreXmlBuilder.element('lyricsOddFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('lyricsOddFontSize', nest: 10);
        museScoreXmlBuilder.element('lyricsOddFramePadding', nest: 0);
        museScoreXmlBuilder.element('lyricsOddFrameWidth', nest: 0);
        museScoreXmlBuilder.element('lyricsEvenFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('lyricsEvenFontSize', nest: 10);
        museScoreXmlBuilder.element('doubleBarDistance', nest: 0.46);
        museScoreXmlBuilder.element('endBarDistance', nest: 0.65);
        museScoreXmlBuilder.element('clefLeftMargin', nest: 0.64);
        museScoreXmlBuilder.element('clefKeyRightMargin', nest: 1.75);
        museScoreXmlBuilder.element('barNoteDistance', nest: 1.2);
        museScoreXmlBuilder.element('beamNoSlope', nest: 1);
        museScoreXmlBuilder.element('articulationAnchorDefault', nest: 3);
        museScoreXmlBuilder.element('hairpinFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('hairpinFramePadding', nest: 0);
        museScoreXmlBuilder.element('hairpinFrameWidth', nest: 0);
        museScoreXmlBuilder.element('pedalFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('pedalFramePadding', nest: 0);
        museScoreXmlBuilder.element('pedalFrameWidth', nest: 0);
        museScoreXmlBuilder.element('harmonyFretDist', nest: 0.5);
        museScoreXmlBuilder.element('chordSymbolAFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('chordSymbolAFramePadding', nest: 0);
        museScoreXmlBuilder.element('chordSymbolAFrameWidth', nest: 0);
        museScoreXmlBuilder.element('musicalSymbolFont', nest: 'Bravura');
        museScoreXmlBuilder.element('musicalTextFont', nest: 'Bravura Text');
        museScoreXmlBuilder.element('showHeader', nest: 1); // new
        museScoreXmlBuilder.element('headerFirstPage', nest: 1); // new
        museScoreXmlBuilder.element('evenHeaderL', nest: '\$P/\$n');
        museScoreXmlBuilder.element('evenHeaderC', nest: '\$d');
        museScoreXmlBuilder.element('oddHeaderL', nest: '\$d');
        museScoreXmlBuilder.element('oddHeaderR', nest: '\$P/\$n');
        museScoreXmlBuilder.element('footerOddEven', nest: 0);
        museScoreXmlBuilder.element('oddFooterC', nest: '\$F'); // \n works?
        museScoreXmlBuilder.element('voltaFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('voltaFramePadding', nest: 0);
        museScoreXmlBuilder.element('voltaFrameWidth', nest: 0);
        museScoreXmlBuilder.element('ottavaFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('ottavaFontStyle', nest: 2);
        museScoreXmlBuilder.element('ottavaFramePadding', nest: 0);
        museScoreXmlBuilder.element('ottavaFrameWidth', nest: 0);
        museScoreXmlBuilder.element('tupletFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('tupletFramePadding', nest: 0);
        museScoreXmlBuilder.element('tupletFrameWidth', nest: 0);
        museScoreXmlBuilder.element('textLineFramePadding', nest: 0);
        museScoreXmlBuilder.element('textLineFrameWidth', nest: 0);
        museScoreXmlBuilder.element('defaultFramePadding', nest: 0.5);
        museScoreXmlBuilder.element('defaultFrameWidth', nest: 0.2);
        museScoreXmlBuilder.element('defaultFrameRound', nest: 25);
        museScoreXmlBuilder.element('titleFontFace', nest: 'Arial Black');
        museScoreXmlBuilder.element('titleFontStyle', nest: 1);
        museScoreXmlBuilder.element('titleFramePadding', nest: 0);
        museScoreXmlBuilder.element('titleFrameWidth', nest: 0);
        museScoreXmlBuilder.element('titleFrameRound', nest: 25);
        museScoreXmlBuilder.element('subTitleFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('subTitleFontStyle', nest: 2);
        museScoreXmlBuilder.element('subTitleFramePadding', nest: 0);
        museScoreXmlBuilder.element('subTitleFrameWidth', nest: 0);
        museScoreXmlBuilder.element('subTitleFrameRound', nest: 25);
        museScoreXmlBuilder.element('composerFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('composerFontSize', nest: 11);
        museScoreXmlBuilder.element('composerFramePadding', nest: 0);
        museScoreXmlBuilder.element('composerFrameWidth', nest: 0);
        museScoreXmlBuilder.element('composerFrameRound', nest: 25);
        museScoreXmlBuilder.element('lyricistFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('lyricistFramePadding', nest: 0);
        museScoreXmlBuilder.element('lyricistFrameWidth', nest: 0);
        museScoreXmlBuilder.element('lyricistFrameRound', nest: 25);
        museScoreXmlBuilder.element('fingeringFontFace', nest: 'Arial');
        museScoreXmlBuilder.element('fingeringFramePadding', nest: 0);
        museScoreXmlBuilder.element('fingeringFrameWidth', nest: 0);
        museScoreXmlBuilder.element('fingeringFrameRound', nest: 25);
        museScoreXmlBuilder.element('lhGuitarFingeringFontFace', nest: 'Arial');
        museScoreXmlBuilder.element('lhGuitarFingeringFramePadding', nest: 0);
        museScoreXmlBuilder.element('lhGuitarFingeringFrameWidth', nest: 0);
        museScoreXmlBuilder.element('lhGuitarFingeringFrameRound', nest: 25);
        museScoreXmlBuilder.element('rhGuitarFingeringFontFace', nest: 'Arial');
        museScoreXmlBuilder.element('rhGuitarFingeringFramePadding', nest: 0);
        museScoreXmlBuilder.element('rhGuitarFingeringFrameWidth', nest: 0);
        museScoreXmlBuilder.element('rhGuitarFingeringFrameRound', nest: 25);
        museScoreXmlBuilder.element('stringNumberFontFace', nest: 'Arial');
        museScoreXmlBuilder.element('longInstrumentFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('longInstrumentFontSize', nest: 11);
        museScoreXmlBuilder.element('longInstrumentFramePadding', nest: 0);
        museScoreXmlBuilder.element('longInstrumentFrameWidth', nest: 0);
        museScoreXmlBuilder.element('shortInstrumentFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('shortInstrumentFontSize', nest: 11);
        museScoreXmlBuilder.element('shortInstrumentFramePadding', nest: 0);
        museScoreXmlBuilder.element('shortInstrumentFrameWidth', nest: 0);
        museScoreXmlBuilder.element('partInstrumentFontFace', nest: 'Arial Black');
        museScoreXmlBuilder.element('partInstrumentFontSize', nest: 14);
        museScoreXmlBuilder.element('partInstrumentFramePadding', nest: 0);
        museScoreXmlBuilder.element('partInstrumentFrameWidth', nest: 0);
        museScoreXmlBuilder.element('partInstrumentFrameRound', nest: 25);
        museScoreXmlBuilder.element('dynamicsFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('dynamicsFramePadding', nest: 0);
        museScoreXmlBuilder.element('dynamicsFrameWidth', nest: 0);
        museScoreXmlBuilder.element('expressionFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('expressionFontSize', nest: 12);
        museScoreXmlBuilder.element('expressionFramePadding', nest: 0);
        museScoreXmlBuilder.element('expressionFrameWidth', nest: 0);
        museScoreXmlBuilder.element('tempoFontFace', nest: 'Palatino');
        museScoreXmlBuilder.element('tempoFontSize', nest: 11);
        museScoreXmlBuilder.element('tempoFramePadding', nest: 0);
        museScoreXmlBuilder.element('tempoFrameWidth', nest: 0);
        museScoreXmlBuilder.element('tempoFrameRound', nest: 25);
        museScoreXmlBuilder.element('metronomeFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('metronomeFramePadding', nest: 0);
        museScoreXmlBuilder.element('metronomeFrameWidth', nest: 0);
        museScoreXmlBuilder.element('measureNumberFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('measureNumberAlign', nest: 'center,bottom');
        museScoreXmlBuilder.element('measureNumberFramePadding', nest: 0);
        museScoreXmlBuilder.element('measureNumberFrameWidth', nest: 0);
        museScoreXmlBuilder.element('translatorFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('translatorAlign', nest: 'center,top');
        museScoreXmlBuilder.element('translatorFramePadding', nest: 0);
        museScoreXmlBuilder.element('translatorFrameWidth', nest: 0);
        museScoreXmlBuilder.element('systemFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('systemFontStyle', nest: 2);
        museScoreXmlBuilder.element('systemAlign', nest: 'left,top');
        museScoreXmlBuilder.element('systemFramePadding', nest: 0);
        museScoreXmlBuilder.element('systemFrameWidth', nest: 0);
        museScoreXmlBuilder.element('systemFrameRound', nest: 25);
        museScoreXmlBuilder.element('staffFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('staffFontStyle', nest: 2);
        museScoreXmlBuilder.element('staffAlign', nest: 'left,top');
        museScoreXmlBuilder.element('staffPosAbove', nest: () {
          museScoreXmlBuilder.attribute('x', 0);
          museScoreXmlBuilder.attribute('y', -4);
        });
        museScoreXmlBuilder.element('staffFramePadding', nest: 0);
        museScoreXmlBuilder.element('staffFrameWidth', nest: 0);
        museScoreXmlBuilder.element('staffFrameRound', nest: 25);
        museScoreXmlBuilder.element('rehearsalMarkFontFace', nest: 'Palatino');
        museScoreXmlBuilder.element('rehearsalMarkFrameType', nest: 2);
        museScoreXmlBuilder.element('rehearsalMarkFramePadding', nest: 0.2);
        museScoreXmlBuilder.element('repeatLeftFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('repeatLeftFramePadding', nest: 0);
        museScoreXmlBuilder.element('repeatLeftFrameWidth', nest: 0);
        museScoreXmlBuilder.element('repeatLeftFrameRound', nest: 25);
        museScoreXmlBuilder.element('repeatRightFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('repeatRightFramePadding', nest: 0);
        museScoreXmlBuilder.element('repeatRightFrameWidth', nest: 0);
        museScoreXmlBuilder.element('repeatRightFrameRound', nest: 25);
        museScoreXmlBuilder.element('frameFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('frameFramePadding', nest: 0);
        museScoreXmlBuilder.element('frameFrameWidth', nest: 0);
        museScoreXmlBuilder.element('textLineFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('glissandoFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('glissandoAlign', nest: 'center,baseline');
        museScoreXmlBuilder.element('glissandoFramePadding', nest: 0);
        museScoreXmlBuilder.element('glissandoFrameWidth', nest: 0);
        museScoreXmlBuilder.element('bendFontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('bendAlign', nest: 'center,center');
        museScoreXmlBuilder.element('bendFramePadding', nest: 0);
        museScoreXmlBuilder.element('bendFrameWidth', nest: 0);
        museScoreXmlBuilder.element('headerFontFace', nest: 'Palatino');
        museScoreXmlBuilder.element('headerAlign', nest: 'center,top');
        museScoreXmlBuilder.element('headerFramePadding', nest: 0);
        museScoreXmlBuilder.element('headerFrameWidth', nest: 0);
        museScoreXmlBuilder.element('footerFontFace', nest: 'Palatino');
        museScoreXmlBuilder.element('footerAlign', nest: 'center,bottom');
        museScoreXmlBuilder.element('footerFramePadding', nest: 0);
        museScoreXmlBuilder.element('footerFrameWidth', nest: 0);
        museScoreXmlBuilder.element('instrumentChangeFontFace', nest: 'Arial');
        museScoreXmlBuilder.element('instrumentChangeFontSize', nest: 11);
        museScoreXmlBuilder.element('instrumentChangeFontStyle', nest: 0);
        museScoreXmlBuilder.element('instrumentChangeAlign', nest: 'left,bottom');
        museScoreXmlBuilder.element('instrumentChangeFramePadding', nest: 0);
        museScoreXmlBuilder.element('instrumentChangeFrameWidth', nest: 0);
        museScoreXmlBuilder.element('user1Name', nest: 'Repeat Text');
        museScoreXmlBuilder.element('user1FontFace', nest: 'Georgia');
        museScoreXmlBuilder.element('user1FontSize', nest: 12);
        museScoreXmlBuilder.element('user1Align', nest: 'right,baseline');
        museScoreXmlBuilder.element('user1FramePadding', nest: 0);
        museScoreXmlBuilder.element('user1FrameWidth', nest: 0);
        museScoreXmlBuilder.element('Spatium', nest: 1.76389);
      });
      museScoreXmlBuilder.element('showInvisible', nest: 1);
      museScoreXmlBuilder.element('showUnprintable', nest: 1);
      museScoreXmlBuilder.element('showFrames', nest: 1);
      museScoreXmlBuilder.element('showMargins', nest: 0);

      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'arranger');
        museScoreXmlBuilder.text(arranger);
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'composer');
        museScoreXmlBuilder.text(composer);
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'copyright');
        museScoreXmlBuilder.text(copyrightDate);
      });

      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'creationDate');
        museScoreXmlBuilder.text(creationDate);
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'lyricist');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'movementNumber');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'movementTitle');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'platform');
        museScoreXmlBuilder.text('Linux');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'poet');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'source');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'translator');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'workNumber');
        museScoreXmlBuilder.text('');
      });
      museScoreXmlBuilder.element('metaTag', nest: () {
        museScoreXmlBuilder.attribute('name', 'workTitle');
        museScoreXmlBuilder.text(workingTitle);
      });

      museScoreXmlBuilder.element('Part', nest: () {
        museScoreXmlBuilder.element('Staff', nest: () {
          museScoreXmlBuilder.attribute('id', 1);
          museScoreXmlBuilder.element('StaffType', nest: () {
            museScoreXmlBuilder.attribute('group', 'percussion');
            museScoreXmlBuilder.element('name', nest: 'perc5Line');
            museScoreXmlBuilder.element('lines', nest: 1);
            museScoreXmlBuilder.element('keysig', nest: 0);
          });
          museScoreXmlBuilder.element('defaultClef', nest: 'PERC');
        });

        museScoreXmlBuilder.element('trackName', nest: 'MDL Snare Line A');
        museScoreXmlBuilder.element('Instrument', nest: () {
          museScoreXmlBuilder.element('longName', nest: 'Snare Line');
          museScoreXmlBuilder.element('shortName', nest: 'S. L.');
          museScoreXmlBuilder.element('trackName', nest: 'MDL Snare Line A');
          museScoreXmlBuilder.element('instrumentId', nest: 'mdl.drum.snare-drum');
          museScoreXmlBuilder.element('useDrumset', nest: 1);

          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 21);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteShapeTriangleLeftWhite');
              museScoreXmlBuilder.element('half', nest: 'noteShapeTriangleLeftWhite');
              museScoreXmlBuilder.element('quarter', nest: 'noteShapeTriangleLeftBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteShapeTriangleLeftWhite');
            });
            museScoreXmlBuilder.element('line', nest: -1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Metronome');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('variants', nest: () {
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 34);
                museScoreXmlBuilder.element('articulation', nest: 'sforzato');
              });
            });
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 23);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadPlusWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadPlusHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadPlusBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadPlusDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: -1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Hand Clap');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 27);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadTriangleDownWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadTriangleDownHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadTriangleDownBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadTriangleUpDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: 1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Dut');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 28);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadTriangleDownWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadTriangleDownHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadTriangleDownBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadTriangleDownDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: 1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Dut Unison');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 60);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Hit');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'A');

            museScoreXmlBuilder.element('variants', nest: () {
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('articulation', nest: 'sforzato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('articulation', nest: 'tenuto');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('articulation', nest: 'marcato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('articulation', nest: 'staccato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('articulation', nest: 'staccatissimo');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 59);
                museScoreXmlBuilder.element('articulation', nest: 'portato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll ');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('articulation', nest: 'sforzato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('articulation', nest: 'tenuto');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('articulation', nest: 'marcato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('articulation', nest: 'staccato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('articulation', nest: 'staccatissimo');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 57);
                museScoreXmlBuilder.element('articulation', nest: 'portato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', 58);
                museScoreXmlBuilder.element('articulation', nest: 'mordent-inverted');
              });
            });
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 61);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadXOrnate');
              museScoreXmlBuilder.element('half', nest: 'noteheadXOrnate');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadXOrnate');
              museScoreXmlBuilder.element('breve', nest: 'noteheadXOrnate');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Rim Shot');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'B');
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 62);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadSlashedWhole1');
              museScoreXmlBuilder.element('half', nest: 'noteheadSlashedHalf1');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadSlashedBlack1');
              museScoreXmlBuilder.element('breve', nest: 'noteheadSlashedDoubleWhole1');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Rim Knock');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 63);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadXWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadXHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadXBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadXDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: -1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Rim');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'E');
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 64);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadRoundWhiteWithDot');
              museScoreXmlBuilder.element('half', nest: 'noteheadRoundWhiteWithDot');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadRoundWhiteWithDot');
              museScoreXmlBuilder.element('breve', nest: 'noteheadRoundWhiteWithDot');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Ping Shot');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'C');
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 65);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadSlashedWhole2');
              museScoreXmlBuilder.element('half', nest: 'noteheadSlashedHalf2');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadSlashedBlack2');
              museScoreXmlBuilder.element('breve', nest: 'noteheadSlashedDoubleWhole2');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Stick Shot');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'D');
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 67);

            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteShapeTriangleRoundWhite');
              museScoreXmlBuilder.element('half', nest: 'noteShapeTriangleRoundWhite');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadTriangleRoundDownBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteShapeTriangleRoundWhite');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Backstick/Visual');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'F');
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 68);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadPlusWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadPlusHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadPlusBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadPlusDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: -1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Hand Hit');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 72);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadDiamondWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadDiamondHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadDiamondBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadDiamondDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Rods');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 73);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadTriangleUpWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadTriangleUpHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadTriangleUpBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadTriangleUpDoubleWhole');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Brushes');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 74);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadMoonWhite');
              museScoreXmlBuilder.element('half', nest: 'noteheadMoonWhite');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadMoonBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadMoonWhite');
            });
            museScoreXmlBuilder.element('line', nest: 1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Shells');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 75);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadCircleSlash');
              museScoreXmlBuilder.element('half', nest: 'noteheadCircleSlash');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadCircleSlash');
              museScoreXmlBuilder.element('breve', nest: 'noteheadCircleSlash');
            });
            museScoreXmlBuilder.element('line', nest: 1);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Harness Hit');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 76);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteheadXWhole');
              museScoreXmlBuilder.element('half', nest: 'noteheadXHalf');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadXBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteheadMoonBlack');
            });
            museScoreXmlBuilder.element('line', nest: '                        -2');
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Stick Click');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'G');
          });
          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', 77);
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('noteheads', nest: () {
              museScoreXmlBuilder.element('whole', nest: 'noteShapeTriangleLeftWhite');
              museScoreXmlBuilder.element('half', nest: 'noteShapeTriangleLeftWhite');
              museScoreXmlBuilder.element('quarter', nest: 'noteheadSquareBlack');
              museScoreXmlBuilder.element('breve', nest: 'noteShapeTriangleLeftWhite');
            });
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Sticks In');
            museScoreXmlBuilder.element('stem', nest: 1);
          });
          museScoreXmlBuilder.element('clef', nest: 'PERC');
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.element('velocity', nest: 100);
            museScoreXmlBuilder.element('gateTime', nest: 100);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'staccatissimo');

            museScoreXmlBuilder.element('velocity', nest: 100);
            museScoreXmlBuilder.element('gateTime', nest: 33);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'staccato');

            museScoreXmlBuilder.element('velocity', nest: 100);
            museScoreXmlBuilder.element('gateTime', nest: 50);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'portato');

            museScoreXmlBuilder.element('velocity', nest: 100);
            museScoreXmlBuilder.element('gateTime', nest: 100);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'tenuto');

            museScoreXmlBuilder.element('velocity', nest: 115);
            museScoreXmlBuilder.element('gateTime', nest: 100);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'marcato');

            museScoreXmlBuilder.element('velocity', nest: 127);
            museScoreXmlBuilder.element('gateTime', nest: 80);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'sforzato');

            museScoreXmlBuilder.element('velocity', nest: 127);
            museScoreXmlBuilder.element('gateTime', nest: 100);
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'plusstop');

            museScoreXmlBuilder.element('velocity', nest: 80);
            museScoreXmlBuilder.element('gateTime', nest: 80);
          });
          museScoreXmlBuilder.element('Channel', nest: () {
            museScoreXmlBuilder.element('controller', nest: () {
              museScoreXmlBuilder.attribute('ctrl', 0);
              museScoreXmlBuilder.attribute('value', 0);
            });
            museScoreXmlBuilder.element('controller', nest: () {
              museScoreXmlBuilder.attribute('ctrl', 32);
              museScoreXmlBuilder.attribute('value', 0);
            });
            museScoreXmlBuilder.element('program', nest: () {
              museScoreXmlBuilder.attribute('value', 6);
            });
            museScoreXmlBuilder.element('controller', nest: () {
              museScoreXmlBuilder.attribute('ctrl', 7);
              museScoreXmlBuilder.attribute('value', 106);
            });
            museScoreXmlBuilder.element('synti', nest: 'Zerberus');
          });
        });
      });


    });
  });
  return museScoreXmlBuilder;
}
