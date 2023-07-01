import 'dart:convert';

import 'package:flutter/material.dart';

class TagsModel {
  String? id;
  String? title;

 

  TagsModel({
    required this.id,
    required this.title,

  

  });
  TagsModel.fromjsom(Map<String,dynamic>element ){
  id=element["id"];
  title=element["title"];
 
 
  }}
