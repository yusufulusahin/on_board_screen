import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:on_board_screen/core/base/model/base_view_model.dart';
import 'package:on_board_screen/core/base/view/base_view.dart';
part 'onboard_viewmodel.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store {}
