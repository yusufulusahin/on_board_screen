import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onBuilder;
  final T viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView({
    super.key,
    required this.viewModel,
    required this.onBuilder,
    this.onModelReady,
    this.onDispose,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    super.initState();
    widget.onModelReady?.call(widget.viewModel);
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onBuilder(context, model);
  }
}
