import 'package:flutteradvanced/presentation/base/base_viewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // inputs

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  // on-boarding view inputs

  @override
  void goToNextPage() {
    // TODO: implement goToNextPage
  }

  @override
  void goToPreviousPage() {
    // TODO: implement goToPreviousPage
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

// orders the view model will receive from the view

abstract class OnBoardingViewModelInputs {
  void goToNextPage();
  void goToPreviousPage();
  void onPageChanged(int index);
}

// data / results that will be sent from out view model to the view

abstract class OnBoardingViewModelOutputs {}
