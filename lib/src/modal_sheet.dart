/*
 * @Author: 王鹏 peng.wang@bigmarker.com
 * @Date: 2025-04-09 19:56:04
 * @LastEditors: 王鹏 peng.wang@bigmarker.com
 * @LastEditTime: 2025-04-10 08:44:19
 * @FilePath: /bottom_sheet/lib/src/modal_sheet.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/widgets.dart';

import '../cupertino_modal_sheet.dart';

/// Shows a modal iOS-style sheet that slides up from the bottom of the screen.
Future<T?> showCupertinoModalSheet<T>(
    {required BuildContext context,
    required WidgetBuilder builder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    bool fullscreenDialog = true,
    bool barrierDismissible = true,
    CupertinoModalSheetRouteTransition firstTransition =
        CupertinoModalSheetRouteTransition.none}) {
  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    CupertinoModalSheetRoute<T>(
      builder: builder,
      settings: routeSettings,
      fullscreenDialog: fullscreenDialog,
      barrierDismissible: barrierDismissible,
      firstTransition: firstTransition,
    ),
  );
}

/// A page that creates a cupertino modal sheet [PageRoute].
class CupertinoModalSheetPage<T> extends Page<T> {
  final Widget child;
  final CupertinoModalSheetRouteTransition firstTransition;

  const CupertinoModalSheetPage({
    super.key,
    required this.child,
    super.name,
    super.arguments,
    super.restorationId,
    this.firstTransition = CupertinoModalSheetRouteTransition.none,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoModalSheetRoute<T>(
      builder: (_) => child,
      settings: this,
      firstTransition: firstTransition,
    );
  }
}
