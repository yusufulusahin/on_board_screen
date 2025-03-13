import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:on_board_screen/core/base/model/base_view_model.dart';
import 'package:on_board_screen/core/base/view/_product/_constant/Svg/svg_path.dart';
import 'package:on_board_screen/view/_autthanticate/onboard/model/on_board_model.dart';
part 'onboard_viewmodel.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.viewContext = context;
  List<OnBoardModel> onboardItems = [];

  @observable
  int currentindex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentindex = value;
  }

  @override
  void init() {
    onboardItems.add(
      OnBoardModel(
        "Otomobilinizin Bakımını Kolaylaştırın!",
        "Aracınızın bakım takvimini yönetin, hatırlatıcılar alın ve sorunsuz sürüşün keyfini çıkarın.",
        SVGImagePaths.instance.first,
      ),
    );
    onboardItems.add(
      OnBoardModel(
        "Önerilen Bakımlar ve Arıza Kodu Analizi!",
        "Araç üreticisine özel bakım önerilerini görün ve arıza kodlarını analiz edin.",
        SVGImagePaths.instance.second,
      ),
    );
    onboardItems.add(
      OnBoardModel(
        "Hatırlatıcılar ve Servis Takibi!",
        "Yağ değişimi, lastik bakımı ve daha fazlası için akıllı hatırlatıcılarla hiçbir bakımı kaçırmayın.",
        SVGImagePaths.instance.third,
      ),
    );
  }
}
