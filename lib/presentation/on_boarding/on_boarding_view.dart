import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteradvanced/presentation/resources/assets_manager.dart';
import 'package:flutteradvanced/presentation/resources/colors_manager.dart';
import 'package:flutteradvanced/presentation/resources/strings_manager.dart';
import 'package:flutteradvanced/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _sliderList = _getSliderList();

  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  void _goToNextPage() {
    if (_currentIndex == _sliderList.length) {
      return;
    }
    _currentIndex++;
    _pageController.animateToPage(_currentIndex,
        duration: AppDuration.duration300, curve: Curves.bounceInOut);
  }

  void _goToPreviousPage() {
    if (_currentIndex == 0) {
      return;
    }
    _currentIndex--;
    _pageController.animateToPage(_currentIndex,
        duration: AppDuration.duration300, curve: Curves.bounceInOut);
  }

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        itemCount: _sliderList.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingWidget(sliderObject: _sliderList[index]);
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
            getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssetsManager.hollowCircleIcon);
    }
    return SvgPicture.asset(ImageAssetsManager.solidCircleIcon);
  }

  Widget getBottomSheetWidget() {
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
                _goToPreviousPage();
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
            for (int i = 0; i < _sliderList.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: getProperCircle(i),
              ),
          ]),

          // right-arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                _goToNextPage();
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

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
