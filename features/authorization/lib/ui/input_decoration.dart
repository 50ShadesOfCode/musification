import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration = const InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide.none,
  ),
  contentPadding: EdgeInsets.all(10),
  hintText: 'Username',
  fillColor: AppColors.secondary2,
  filled: true,
);
