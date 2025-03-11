import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_board_screen/core/base/view/base_view.dart';
import 'package:on_board_screen/core/components/container/random_color_container.dart';
import 'package:on_board_screen/core/constant/Svg/svg_path.dart';
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Spacer(flex: 1),
                  Expanded(flex: 6, child: BuildSvgPicture()),
                  BuildColumnText(context),
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

  Column BuildColumnText(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          textAlign: TextAlign.center,
          'Otomobilinizin Bakımını Kolaylaştırın!',
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AutoSizeText(
            textAlign: TextAlign.center,
            'Aracınızın bakım takvimini yönetin, hatırlatıcılar alın ve sorunsuz sürüşün keyfini çıkarın.',
          ),
        ),
      ],
    );
  }

  SvgPicture BuildSvgPicture() =>
      SvgPicture.asset(SVGImagePaths.instance.first);
}
