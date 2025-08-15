import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Build [AssetPickerPageRoute] with the given generic type.
/// 构建匹配泛型的 [AssetPickerPageRoute]
typedef AssetPickerPageRouteBuilder<T> = AssetPickerPageRoute<T> Function(
  Widget picker,
);

/// Built a Cupertino-style page transition for the picker.
/// 为选择器构造一个 Cupertino 风格的页面过渡动画
class AssetPickerPageRoute<T> extends PageRoute<T> with CupertinoRouteTransitionMixin<T> {
  /// Creates a page route for use in an iOS designed app.
  ///
  /// The [builder], [maintainState], and [fullscreenDialog] arguments must not
  /// be null.
  AssetPickerPageRoute({
    required this.builder,
    this.title,
    super.settings,
    super.requestFocus,
    this.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
    super.barrierDismissible = false,
  }) {
    assert(opaque);
  }

  @override
  DelegatedTransitionBuilder? get delegatedTransition =>
      CupertinoPageTransition.delegatedTransition;

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  final String? title;

  @override
  final bool maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}