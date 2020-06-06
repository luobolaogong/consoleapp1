import 'package:xml/xml.dart';
import 'dart:convert';
import 'dart:io';


int calculate() {
  return 6 * 7;
}

//void doSomething() {
//  print("Maybe I'll do something");
////  <?xml version="1.0" encoding="UTF-8"?>
////  <museScore version="3.01">
////  <programVersion>3.2.3</programVersion>
////  <programRevision>d2d863f</programRevision>
////  <Score>
////  <LayerTag id="0" tag="default"></LayerTag>
////  <currentLayer>0</currentLayer>
////  <Division>480</Division>
////  <Style>
////  <pageWidth>8.5</pageWidth>
////  <pageHeight>11</pageHeight>
//
//  final museScoreXmlBuilder = XmlBuilder();
//  museScoreXmlBuilder.processing('xml', 'version="1.0" encoding="UTF-8"');
//  museScoreXmlBuilder.element('museScore', nest: ()
//  {
//    museScoreXmlBuilder.attribute('version', '3.01');
//    museScoreXmlBuilder.element('programVersion', nest: '3.2.3');
//    museScoreXmlBuilder.element('programRevision', nest: 'd2d863f');
//    museScoreXmlBuilder.element('Score', nest: ()
//    {
//      museScoreXmlBuilder.element('LayerTag', nest: ()
//      {
//        museScoreXmlBuilder.attribute('id', 0);
//        museScoreXmlBuilder.attribute('tag', 'default');
//        museScoreXmlBuilder.element('currentLayer', nest: 0);
//        museScoreXmlBuilder.element('Division', nest: 480);
//        museScoreXmlBuilder.element('Style', nest: ()
//        {
//          museScoreXmlBuilder.element('pageWidth', nest: 8.5);
//          museScoreXmlBuilder.element('pageHeight', nest: 11);
//        }