import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _scrollController = ScrollController();
  List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10Images();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview"),
      ),
      body: Stack(children: [_createList(), _createLoading()]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];
          return FadeInImage(
              width: 300,
              height: 200,
              fit: BoxFit.fill,
              placeholder: const AssetImage("assets/placeholder.gif"),
              image:
                  NetworkImage("https://picsum.photos/300/200?image=$image"));
        },
      ),
    );
  }

  void _add10Images() {
    for (int i = 0; i < 10; i++) {
      _numberList.add(_lastItem);
      _lastItem++;
    }
    setState(() {});
  }

  Future<void> fetchData() async {
    setState(() => _isLoading = true);
    Timer(const Duration(seconds: 2), responseHTTP);
  }

  void responseHTTP() {
    setState(() => _isLoading = false);

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500));
    _add10Images();
  }

  Widget _createLoading() {
    return _isLoading
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                )
              ])
        : Container();
  }

  Future<void> _getPage() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      _numberList.clear();
      _lastItem++;
      _add10Images();
    });
  }
}
