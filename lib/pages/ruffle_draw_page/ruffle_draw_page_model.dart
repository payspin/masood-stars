import '/backend/backend.dart';
import '/components/ruffle_draw_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ruffle_draw_page_widget.dart' show RuffleDrawPageWidget;
import 'package:flutter/material.dart';

class RuffleDrawPageModel extends FlutterFlowModel<RuffleDrawPageWidget> {
  ///  Local state fields for this page.

  int? randomPick = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in RuffleDrawPage widget.
  List<UsersRecord>? drawList;
  // Model for RuffleDrawComponent component.
  late RuffleDrawComponentModel ruffleDrawComponentModel;

  @override
  void initState(BuildContext context) {
    ruffleDrawComponentModel =
        createModel(context, () => RuffleDrawComponentModel());
  }

  @override
  void dispose() {
    ruffleDrawComponentModel.dispose();
  }
}
