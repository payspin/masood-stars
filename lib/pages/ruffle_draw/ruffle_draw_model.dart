import '/comp/tap_bar_mob_view/tap_bar_mob_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ruffle_draw_widget.dart' show RuffleDrawWidget;
import 'package:flutter/material.dart';

class RuffleDrawModel extends FlutterFlowModel<RuffleDrawWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TapBarMobView component.
  late TapBarMobViewModel tapBarMobViewModel;

  @override
  void initState(BuildContext context) {
    tapBarMobViewModel = createModel(context, () => TapBarMobViewModel());
  }

  @override
  void dispose() {
    tapBarMobViewModel.dispose();
  }
}
