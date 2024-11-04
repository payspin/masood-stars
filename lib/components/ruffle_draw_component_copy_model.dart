import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ruffle_draw_component_copy_widget.dart'
    show RuffleDrawComponentCopyWidget;
import 'package:flutter/material.dart';

class RuffleDrawComponentCopyModel
    extends FlutterFlowModel<RuffleDrawComponentCopyWidget> {
  ///  State fields for stateful widgets in this component.

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
