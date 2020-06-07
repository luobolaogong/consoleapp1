import 'package:xml/xml.dart';

// Here's the manual for MuseScore: https://musescore.org/en/handbook

XmlBuilder buildMuseScore(Map<String, dynamic> metronomeInputMap) {
  var now = DateTime.now();
  var museScoreFileName = metronomeInputMap['museScoreFileName'];
  var title = metronomeInputMap['title'] ?? museScoreFileName;
  var subTitle = metronomeInputMap['subTitle'] ?? museScoreFileName;
  var composer = metronomeInputMap['composer'] ?? '';
  var arranger = metronomeInputMap['arranger'] ?? '';
  var copyrightDate = metronomeInputMap['copyrightDate'] ?? 'copyleft ${now.year}';
  var creationDate = metronomeInputMap['creationDate'] ?? '${now.month}/${now.day}/${now.year}';
  var workingTitle = metronomeInputMap['workingTitle'] ?? '';
  var sigNumerator = metronomeInputMap['sigNumerator'] ?? '4';
  var sigDenominator = metronomeInputMap['sigDenominator'] ?? '4';
  var tempo = metronomeInputMap['tempo'] ?? '84';
  var nBars = metronomeInputMap['nBars'] ?? '32';

  final museScoreXmlBuilder = XmlBuilder();
  museScoreXmlBuilder.processing('xml', 'version="1.0" encoding="UTF-8"');
  museScoreXmlBuilder.element('museScore', nest: ()
  {
    museScoreXmlBuilder.attribute('version', '3.01');
    museScoreXmlBuilder.element('programVersion', nest: '3.2.3');
    museScoreXmlBuilder.element('programRevision', nest: 'd2d863f');
    museScoreXmlBuilder.element('Score', nest: ()
    {
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
        museScoreXmlBuilder.element('oddHeaderC', nest: '\n\n\n\n\n\n\$d');
        museScoreXmlBuilder.element('oddHeaderR', nest: '\$P/\$n');
        museScoreXmlBuilder.element('footerOddEven', nest: 0);
        museScoreXmlBuilder.element('oddFooterC', nest: '\$c');
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
      museScoreXmlBuilder.element('showInvisible', nest: 1); // ?
      museScoreXmlBuilder.element('showUnprintable', nest: 1); // ?
      museScoreXmlBuilder.element('showFrames', nest: 1);
      museScoreXmlBuilder.element('showMargins', nest: 1); // prob remove

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

        //museScoreXmlBuilder.element('trackName', nest: 'MDL Snare Line A'); // ?? here?
        museScoreXmlBuilder.element('Instrument', nest: () {
          museScoreXmlBuilder.element('longName', nest: 'Snare Line '); // change
          museScoreXmlBuilder.element('shortName', nest: 'S. L.');
          museScoreXmlBuilder.element('trackName', nest: 'MDL Snare Line A');
          museScoreXmlBuilder.element('instrumentId', nest: 'mdl.drum.snare-drum');
          museScoreXmlBuilder.element('useDrumset', nest: 1); // ??

//          <Drum pitch="21">
//          <head>normal</head>
//          <noteheads>
//          <whole>noteShapeTriangleLeftWhite</whole>
//          <half>noteShapeTriangleLeftWhite</half>
//          <quarter>noteShapeTriangleLeftBlack</quarter>
//          <breve>noteShapeTriangleLeftWhite</breve>
//          </noteheads>
//          <line>-1</line>
//          <voice>0</voice>
//          <name>Metronome</name>
//          <stem>1</stem>
//          <variants>
//          <variant pitch="34">
//          <articulation>sforzato</articulation>
//          </variant>
//          </variants>
//          </Drum>
//          <Drum pitch="23">
//          <head>normal</head>
//          <noteheads>
//          <whole>noteheadPlusWhole</whole>
//          <half>noteheadPlusHalf</half>
//          <quarter>noteheadPlusBlack</quarter>
//          <breve>noteheadPlusDoubleWhole</breve>
//          </noteheads>
//          <line>-1</line>
//          <voice>0</voice>
//          <name>Hand Clap</name>
//          <stem>1</stem>
//          </Drum>
//          <Drum pitch="27">
//          <head>normal</head>
//          <noteheads>
//          <whole>noteheadTriangleDownWhole</whole>
//          <half>noteheadTriangleDownHalf</half>
//          <quarter>noteheadTriangleDownBlack</quarter>
//          <breve>noteheadTriangleUpDoubleWhole</breve>
//          </noteheads>
//          <line>1</line>
//          <voice>0</voice>
//          <name>Dut</name>
//          <stem>1</stem>
//          </Drum>
//          <Drum pitch="28">
//          <head>normal</head>
//          <noteheads>
//          <whole>noteheadTriangleDownWhole</whole>
//          <half>noteheadTriangleDownHalf</half>
//          <quarter>noteheadTriangleDownBlack</quarter>
//          <breve>noteheadTriangleDownDoubleWhole</breve>
//          </noteheads>
//          <line>1</line>
//          <voice>0</voice>
//          <name>Dut Unison</name>
//          <stem>1</stem>
//          </Drum>

          museScoreXmlBuilder.element('Drum', nest: () {
            museScoreXmlBuilder.attribute('pitch', '60');
            museScoreXmlBuilder.element('head', nest: 'normal');
            museScoreXmlBuilder.element('line', nest: 0);
            museScoreXmlBuilder.element('voice', nest: 0);
            museScoreXmlBuilder.element('name', nest: 'Hit');
            museScoreXmlBuilder.element('stem', nest: 1);
            museScoreXmlBuilder.element('shortcut', nest: 'A');
            museScoreXmlBuilder.element('variants', nest: () {
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('articulation', nest: 'sforzato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('articulation', nest: 'tenuto');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('articulation', nest: 'marcato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('articulation', nest: 'staccato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('articulation', nest: 'staccatissimo');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '59');
                museScoreXmlBuilder.element('articulation', nest: 'portato');
                museScoreXmlBuilder.element('tremolo', nest: 'r16');
              });

              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('articulation', nest: 'sforzato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('articulation', nest: 'tenuto');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('articulation', nest: 'marcato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('articulation', nest: 'staccato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('articulation', nest: 'staccatissimo');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });
              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '57');
                museScoreXmlBuilder.element('articulation', nest: 'portato');
                museScoreXmlBuilder.element('tremolo', nest: 'buzzroll');
              });

              museScoreXmlBuilder.element('variant', nest: () {
                museScoreXmlBuilder.attribute('pitch', '58');
                museScoreXmlBuilder.element('articulation', nest: 'mordent-inverted');
              });
            });
          });
          museScoreXmlBuilder.element('clef', nest: 'PERC');
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.element('velocity', nest: '100');
            museScoreXmlBuilder.element('gateTime', nest: '100');
          });

          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'staccatissimo');
            museScoreXmlBuilder.element('velocity', nest: '100');
            museScoreXmlBuilder.element('gateTime', nest: '33');
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'staccato');
            museScoreXmlBuilder.element('velocity', nest: '100');
            museScoreXmlBuilder.element('gateTime', nest: '50');
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'portato');
            museScoreXmlBuilder.element('velocity', nest: '100');
            museScoreXmlBuilder.element('gateTime', nest: '33');
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'tenuto');
            museScoreXmlBuilder.element('velocity', nest: '115');
            museScoreXmlBuilder.element('gateTime', nest: '100');
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'marcato');
            museScoreXmlBuilder.element('velocity', nest: '127');
            museScoreXmlBuilder.element('gateTime', nest: '80');
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'sforzato');
            museScoreXmlBuilder.element('velocity', nest: '127');
            museScoreXmlBuilder.element('gateTime', nest: '100');
          });
          museScoreXmlBuilder.element('Articulation', nest: () {
            museScoreXmlBuilder.attribute('name', 'plusstop');
            museScoreXmlBuilder.element('velocity', nest: '80');
            museScoreXmlBuilder.element('gateTime', nest: '80');
          });
          museScoreXmlBuilder.element('Channel', nest: () {
            museScoreXmlBuilder.element('controller', nest: () {
              museScoreXmlBuilder.attribute('ctrl', '0');
              museScoreXmlBuilder.attribute('value', '0');
            });
            museScoreXmlBuilder.element('controller', nest: () {
              museScoreXmlBuilder.attribute('ctrl', '32');
              museScoreXmlBuilder.attribute('value', '0');
            });
            museScoreXmlBuilder.element('program', nest: () {
              museScoreXmlBuilder.attribute('value', 6);
            });
            museScoreXmlBuilder.element('controller', nest: () {
              museScoreXmlBuilder.attribute('ctrl', '7');
              museScoreXmlBuilder.attribute('value', '106');
            });
            museScoreXmlBuilder.element('synti', nest: 'Zerberus'); // ??
          });
        });
      });
      museScoreXmlBuilder.element('Staff', nest: () {
        museScoreXmlBuilder.attribute('id', 1);

        museScoreXmlBuilder.element('VBox', nest: () {
          museScoreXmlBuilder.element('height', nest: '10');
          museScoreXmlBuilder.element('Text', nest: () {
            museScoreXmlBuilder.element('style', nest: 'Title');
            museScoreXmlBuilder.element('text', nest: title);
          });
          museScoreXmlBuilder.element('Text', nest: () {
            museScoreXmlBuilder.element('style', nest: 'Subtitle');
            museScoreXmlBuilder.element('text', nest: subTitle);
          });
          museScoreXmlBuilder.element('Text', nest: () {
            museScoreXmlBuilder.element('style', nest: 'Composer');
            museScoreXmlBuilder.element('text', nest: composer);
          });
        });

        print('Starting to write ${nBars} bars.');
          print('Starting to write first bar');
          museScoreXmlBuilder.element('Measure', nest: () {
            museScoreXmlBuilder.element('voice', nest: () {
              // we only want to do this when there's a time sig change
              // Fix later
              //if (barCtr == 0) {
                museScoreXmlBuilder.element('TimeSig', nest: () {
                  museScoreXmlBuilder.element('sigN', nest: sigNumerator);
                  museScoreXmlBuilder.element('sigD', nest: sigDenominator);
                });
                print('Wrote timesig');
              //}
              // Why is this here, and not before the measure???
              museScoreXmlBuilder.element('Tempo', nest: () {
                // tempo value T in next line is a multiplier M, where M=1 means T=60
                // So, if you want a tempo of T, then divide it by 60 to get the value for 'tempo'
                museScoreXmlBuilder.element('tempo', nest: '${tempo / 60}');
                museScoreXmlBuilder.element('followText', nest: '1');
                museScoreXmlBuilder.element('text', nest: () {
                  museScoreXmlBuilder.element('sym', nest: 'metNoteQuarterUp');
                  museScoreXmlBuilder.text(' = ${tempo}'); // prob here???
                });
              });
              print('Wrote tempo which is strange here');
              // Here come the notes that make up the metronome
              // This section should therefore be some kind of looping within looping to account for
              // various metronome settings for a tune, with set of rolloff segments, or a set of tunes.
              //
              for (var noteCtr = 0; noteCtr < sigNumerator; noteCtr++) {
                museScoreXmlBuilder.element('Chord', nest: () {
                  museScoreXmlBuilder.element('durationType', nest: 'quarter');
                  museScoreXmlBuilder.element('StemDirection', nest: 'up');
                  museScoreXmlBuilder.element('Note', nest: () {
                    museScoreXmlBuilder.element('pitch', nest: '60');
                    museScoreXmlBuilder.element('tpc', nest: '14');
                  });
                });
                print('Did write note ${noteCtr}');
              }
//            print('Wrote chord/quarter note1');
//            museScoreXmlBuilder.element('Chord', nest: () {
//              museScoreXmlBuilder.element('durationType', nest: 'quarter');
//              museScoreXmlBuilder.element('StemDirection', nest: 'up');
//              museScoreXmlBuilder.element('Note', nest: () {
//                museScoreXmlBuilder.element('pitch', nest: '60');
//                museScoreXmlBuilder.element('tpc', nest: '14');
//              });
//            });
//            print('Wrote chord/quarter note2');
//            museScoreXmlBuilder.element('Chord', nest: () {
//              museScoreXmlBuilder.element('durationType', nest: 'quarter');
//              museScoreXmlBuilder.element('StemDirection', nest: 'up');
//              museScoreXmlBuilder.element('Note', nest: () {
//                museScoreXmlBuilder.element('pitch', nest: '60');
//                museScoreXmlBuilder.element('tpc', nest: '14');
//              });
//            });
//            print('Wrote chord/quarter note3');
//            museScoreXmlBuilder.element('Chord', nest: () {
//              museScoreXmlBuilder.element('durationType', nest: 'quarter');
//              museScoreXmlBuilder.element('StemDirection', nest: 'up');
//              museScoreXmlBuilder.element('Note', nest: () {
//                museScoreXmlBuilder.element('pitch', nest: '60');
//                museScoreXmlBuilder.element('tpc', nest: '14');
//              });
//            });
//            print('Wrote chord/quarter note4');
            }); // end what? voice
          }); // end what? measure
        print('Will write subsequent bars if there are any');
        for (var barCtr = 1; barCtr < nBars; barCtr++) {
          // I think this first bar should not be in a loop

          //
          // start new measure here?
          museScoreXmlBuilder.element('Measure', nest: () {
            museScoreXmlBuilder.element('voice', nest: () {
              for (var noteCtr = 0; noteCtr < sigNumerator; noteCtr++) {
                museScoreXmlBuilder.element('Chord', nest: () {
                  museScoreXmlBuilder.element('durationType', nest: 'quarter');
                  museScoreXmlBuilder.element('StemDirection', nest: 'up');
                  museScoreXmlBuilder.element('Note', nest: () {
                    museScoreXmlBuilder.element('pitch', nest: '60');
                    museScoreXmlBuilder.element('tpc', nest: '14');
                  });
                });
//            museScoreXmlBuilder.element('Chord', nest: () {
//              museScoreXmlBuilder.element('durationType', nest: 'quarter');
//              museScoreXmlBuilder.element('StemDirection', nest: 'up');
//              museScoreXmlBuilder.element('Note', nest: () {
//                museScoreXmlBuilder.element('pitch', nest: '60');
//                museScoreXmlBuilder.element('tpc', nest: '14');
//              });
//            });
//            museScoreXmlBuilder.element('Chord', nest: () {
//              museScoreXmlBuilder.element('durationType', nest: 'quarter');
//              museScoreXmlBuilder.element('StemDirection', nest: 'up');
//              museScoreXmlBuilder.element('Note', nest: () {
//                museScoreXmlBuilder.element('pitch', nest: '60');
//                museScoreXmlBuilder.element('tpc', nest: '14');
//              });
//            });
//            museScoreXmlBuilder.element('Chord', nest: () {
//              museScoreXmlBuilder.element('durationType', nest: 'quarter');
//              museScoreXmlBuilder.element('StemDirection', nest: 'up');
//              museScoreXmlBuilder.element('Note', nest: () {
//                museScoreXmlBuilder.element('pitch', nest: '60');
//                museScoreXmlBuilder.element('tpc', nest: '14');
//              });
//            });
              print('Wrote note ${noteCtr}');
              }
            });
          });
          print('Wrote bar ${barCtr}');
        } // end bars loop?
      });
    });
  });
//        museScoreXmlBuilder.element('Measure', nest: () {
//          museScoreXmlBuilder.element('voice', nest: () {
//            museScoreXmlBuilder.element('RepeatMeasure', nest: () {
//              museScoreXmlBuilder.element('offset', nest: () {
//                museScoreXmlBuilder.attribute('x', 0);
//                museScoreXmlBuilder.attribute('y', -2);
//              });
//              museScoreXmlBuilder.element('durationType', nest: 'measure');
//              museScoreXmlBuilder.element('duration', nest: '${sigNumerator}/${sigDenominator}');
//            });
//          });
//        });

  return museScoreXmlBuilder;
}
