import '/backend/backend.dart';
import '/comp/listview/listview_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ruffle_draw_component_widget.dart' show RuffleDrawComponentWidget;
import 'package:flutter/material.dart';

class RuffleDrawComponentModel
    extends FlutterFlowModel<RuffleDrawComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? registeredList;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? indexselectionXX;
  // Model for listview component.
  late ListviewModel listviewModel;

  @override
  void initState(BuildContext context) {
    listviewModel = createModel(context, () => ListviewModel());
  }

  @override
  void dispose() {
    listviewModel.dispose();
  }
}
