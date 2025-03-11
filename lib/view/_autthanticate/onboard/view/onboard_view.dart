import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: viewModel.onboardItems.length,
                      itemBuilder:
                          (context, index) => BuildColumnBody(
                            context,
                            viewModel.onboardItems[index],
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            },
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.arrow_right),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        AutoSizeText(
          textAlign: TextAlign.center,
          model.title,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AutoSizeText(textAlign: TextAlign.center, model.description),
        ),
      ],
    );
  }

  SvgPicture BuildSvgPicture(String path) => SvgPicture.asset(path);
}
