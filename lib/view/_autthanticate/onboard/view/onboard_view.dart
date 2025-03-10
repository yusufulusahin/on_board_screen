import 'package:flutter/material.dart';
import 'package:on_board_screen/core/base/view/base_view.dart';
import 'package:on_board_screen/core/components/container/random_color_container.dart';
import 'package:on_board_screen/view/_autthanticate/onboard/viewmodel/onboard_viewmodel.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onBuilder:
          (context, value) => Scaffold(
            body: Column(
              children: [
                Expanded(flex: 6, child: RandomColorContainer()),
                Expanded(flex: 3, child: RandomColorContainer()),
                Expanded(flex: 1, child: RandomColorContainer()),
              ],
            ),
          ),
    );
  }
}
