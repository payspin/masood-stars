import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ruffle_draw_widget.dart' show RuffleDrawWidget;
import 'package:flutter/material.dart';

class RuffleDrawModel extends FlutterFlowModel<RuffleDrawWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NAVBAR component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
