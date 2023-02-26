abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used throughout the view model
}

abstract class BaseViewModelInputs {
  void start(); // will be called for the init. of view model
  void dispose(); // will be called for the dispose. of view model
}

abstract class BaseViewModelOutputs {}
