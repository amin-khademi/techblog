import 'dart:convert';

import 'package:flutter/material.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;
 

  PosterModel({
    required this.id,
    required this.title,
    required this.image,
  

  });
  PosterModel.fromjsom(Map<String,dynamic>element ){
  id=element["id"];
  title=element["title"];
  image=element["image"];
 
  }}
