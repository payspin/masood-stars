import '/flutter_flow/flutter_flow_util.dart';
import 'eventt_widget.dart' show EventtWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EventtModel extends FlutterFlowModel<EventtWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
