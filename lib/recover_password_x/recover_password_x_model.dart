import '/flutter_flow/flutter_flow_util.dart';
import 'recover_password_x_widget.dart' show RecoverPasswordXWidget;
import 'package:flutter/material.dart';

class RecoverPasswordXModel extends FlutterFlowModel<RecoverPasswordXWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddressRecover widget.
  FocusNode? emailAddressRecoverFocusNode;
  TextEditingController? emailAddressRecoverTextController;
  String? Function(BuildContext, String?)?
      emailAddressRecoverTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressRecoverFocusNode?.dispose();
    emailAddressRecoverTextController?.dispose();
  }
}
