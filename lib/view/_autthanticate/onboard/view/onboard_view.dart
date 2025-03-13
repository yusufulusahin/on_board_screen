import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_board_screen/core/base/view/_product/_avatar/on_board_circle.dart';
import 'package:on_board_screen/core/base/view/base_view.dart';
import 'package:on_board_screen/view/_autthanticate/onboard/model/on_board_model.dart';
import 'package:on_board_screen/view/_autthanticate/onboard/viewmodel/onboard_viewmodel.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      viewModel: OnboardViewModel(),
      onBuilder:
          (context, OnboardViewModel viewModel) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Spacer(flex: 1),
                  Expanded(flex: 7, child: BuildPageView(viewModel)),
                  Expanded(flex: 2, child: BuildRowFooter(viewModel)),
                ],
              ),
            ),
          ),
    );
  }

  PageView BuildPageView(OnboardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) => viewModel.changeCurrentIndex(value),
      controller: _pageController,
      itemCount: viewModel.onboardItems.length,
      itemBuilder: (context, index) => BodyColumCard(context, viewModel, index),
    );
  }

  Padding BodyColumCard(
    BuildContext context,
    OnboardViewModel viewModel,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 211, 211),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: BuildColumnBody(context, viewModel.onboardItems[index]),
      ),
    );
  }

  Row BuildRowFooter(OnboardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 211, 211, 211),
            child: Icon(Icons.arrow_left),
            onPressed: () {},
          ),
        ),
        Spacer(), // Sol tarafta boşluk bırak
        Row(
          mainAxisSize: MainAxisSize.min, // Sadece içeriğe göre genişlik ayarla
          children: List.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Observer(
                builder: (_) {
                  return OnBoardCircle(
                    isSelected: viewModel.currentindex == index,
                  );
                },
              ),
            );
          }),
        ),
        Spacer(), // Sağ tarafta boşluk bırak
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 211, 211, 211),
          child: Icon(Icons.arrow_right),
          onPressed: () {},
        ),
      ],
    );
  }

  Column BuildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 6, child: BuildSvgPicture(model.imagePath)),
        BuildColumnText(context, model),
      ],
    );
  }

  Column BuildColumnText(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        AutoSizeTextTitle(model, context),
        AutoSizeTextDescription(model),
      ],
    );
  }

  Padding AutoSizeTextDescription(OnBoardModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: AutoSizeText(textAlign: TextAlign.center, model.description),
    );
  }

  AutoSizeText AutoSizeTextTitle(OnBoardModel model, BuildContext context) {
    return AutoSizeText(
      textAlign: TextAlign.center,
      model.title,
      style: Theme.of(
        context,
      ).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  SvgPicture BuildSvgPicture(String path) => SvgPicture.asset(path);
}
