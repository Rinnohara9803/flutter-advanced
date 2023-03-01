import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteradvanced/presentation/on_boarding/on_boarding_viewmodel.dart';
import 'package:flutteradvanced/presentation/resources/assets_manager.dart';
import 'package:flutteradvanced/presentation/resources/colors_manager.dart';
import 'package:flutteradvanced/presentation/resources/strings_manager.dart';
import 'package:flutteradvanced/presentation/resources/values_manager.dart';

import '../../domain/models/slider_object.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _onBoardingViewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _onBoardingViewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: sliderViewObject.numOfSliders,
        onPageChanged: (index) {
          _onBoardingViewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnBoardingWidget(sliderObject: sliderViewObject.sliderObject);
        },
      ),
      bottomSheet: Container(
        color: AppColors.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppString.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            getBottomSheetWidget(sliderViewObject),
          ],
        ),
      ),
    );
  }

  Widget getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssetsManager.hollowCircleIcon);
    }
    return SvgPicture.asset(ImageAssetsManager.solidCircleIcon);
  }

  Widget getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left-arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(
                    _onBoardingViewModel.goToPreviousPage(),
                    duration: AppDuration.duration300,
                    curve: Curves.bounceInOut);
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssetsManager.leftArrowIcon,
                ),
              ),
            ),
          ),

          // indicator

          Row(children: [
            for (int i = 0; i < sliderViewObject.numOfSliders; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: getProperCircle(i, sliderViewObject.currentIndex),
              ),
          ]),

          // right-arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(
                    _onBoardingViewModel.goToNextPage(),
                    duration: AppDuration.duration300,
                    curve: Curves.bounceInOut);
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssetsManager.rightArrowIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// always create a stateless widget if no states are involved

class OnBoardingWidget extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingWidget({required this.sliderObject, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium, // use centralized theme data
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(
          sliderObject.image,
        ),
      ],
    );
  }
}
