import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';

class NewPasswordModel extends FlutterFlowModel<NewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddressAdmin widget.
  FocusNode? emailAddressAdminFocusNode;
  TextEditingController? emailAddressAdminTextController;
  String? Function(BuildContext, String?)?
      emailAddressAdminTextControllerValidator;
  String? _emailAddressAdminTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Write correct email';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressAdminTextControllerValidator =
        _emailAddressAdminTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressAdminFocusNode?.dispose();
    emailAddressAdminTextController?.dispose();
  }
}
