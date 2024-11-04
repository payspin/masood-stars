import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ruffle_draw_page2_widget.dart' show RuffleDrawPage2Widget;
import 'package:flutter/material.dart';

class RuffleDrawPage2Model extends FlutterFlowModel<RuffleDrawPage2Widget> {
  ///  Local state fields for this page.

  int? randomPick = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in RuffleDrawPage2 widget.
  List<UsersRecord>? drawList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? arrivedList;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? indexselectionXX;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
