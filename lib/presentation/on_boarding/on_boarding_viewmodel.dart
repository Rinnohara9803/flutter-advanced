import 'dart:async';

import 'package:flutteradvanced/domain/models/slider_object.dart';
import 'package:flutteradvanced/presentation/base/base_viewmodel.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream-controller

  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _sliderList;
  int _currentIndex = 0;

  // inputs

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderList();

    // pass data to the view

    _postDataToView();
  }

  // on-boarding view inputs

  @override
  int goToNextPage() {
    if (_currentIndex == _sliderList.length - 1) {
      return _currentIndex;
    }
    _currentIndex++;
    _postDataToView();

    return _currentIndex;
  }

  @override
  int goToPreviousPage() {
    if (_currentIndex == 0) {
      return _currentIndex;
    }
    _currentIndex--;
    _postDataToView();

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // private functions

  List<SliderObject> _getSliderList() => [
        SliderObject(
          AppString.onBoardingTitle1,
          AppString.onBoardingSubTitle1,
          ImageAssetsManager.onBoardingLogo1,
        ),
        SliderObject(
          AppString.onBoardingTitle2,
          AppString.onBoardingSubTitle2,
          ImageAssetsManager.onBoardingLogo2,
        ),
        SliderObject(
          AppString.onBoardingTitle3,
          AppString.onBoardingSubTitle3,
          ImageAssetsManager.onBoardingLogo3,
        ),
        SliderObject(
          AppString.onBoardingTitle4,
          AppString.onBoardingSubTitle4,
          ImageAssetsManager.onBoardingLogo4,
        ),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
          _sliderList[_currentIndex], _sliderList.length, _currentIndex),
    );
  }
}

// orders the view model will receive from the view

abstract class OnBoardingViewModelInputs {
  void goToNextPage();
  void goToPreviousPage();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

// data / results that will be sent from out view model to the view

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSliders;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSliders, this.currentIndex);
}
