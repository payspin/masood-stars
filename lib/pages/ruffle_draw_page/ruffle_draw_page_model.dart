import '/backend/backend.dart';
import '/components/listview_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'ruffle_draw_page_widget.dart' show RuffleDrawPageWidget;
import 'package:flutter/material.dart';

class RuffleDrawPageModel extends FlutterFlowModel<RuffleDrawPageWidget> {
  ///  Local state fields for this page.

  int? randomPick = 0;

  UsersRecord? randomDraw;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in RuffleDrawPage widget.
  List<UsersRecord>? drawList;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 5000;
  int timerMilliseconds = 5000;
  String timerValue = StopWatchTimer.getDisplayTime(
    5000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for listview component.
  late ListviewModel listviewModel;

  @override
  void initState(BuildContext context) {
    listviewModel = createModel(context, () => ListviewModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    listviewModel.dispose();
  }
}
