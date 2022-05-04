// 搜索栏构建问题
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:music/config.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/models/search_result.dart';

class SearchAppbar extends StatefulWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  _SearchAppbarState createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  final TextEditingController _searchcontroller = TextEditingController();
  final FocusNode _node = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchcontroller,
      focusNode: _node,
      textInputAction: TextInputAction.search,
      onEditingComplete: _search,
      decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true, // 背景颜色 开启
          isCollapsed: true, //高度包裹 不考虑文字位置
          contentPadding: EdgeInsets.only(top: 12), // 与高度包裹搭配使用
          hintText: '输入歌曲/歌手/歌单',
          prefixIcon: Icon(Icons.search_rounded),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 4,
              ))),
    );
  }

  _search() async {
    try {
      ChangeController.to.getsearchres(_searchcontroller.text);
    } catch (e) {
      print('error is :' + e.toString());
    } finally {
      _node.unfocus();//解除焦点
    }
  }
}
