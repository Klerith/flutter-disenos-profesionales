import 'package:flutter/material.dart';
import 'package:disenos/src/pages/slideshow_page.dart';


class LayoutModel with ChangeNotifier {

  Widget _currentPage = SlideshowPage();

  set currentPage( Widget page ) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;

}