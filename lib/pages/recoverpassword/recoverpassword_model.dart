import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'recoverpassword_widget.dart' show RecoverpasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecoverpasswordModel extends FlutterFlowModel<RecoverpasswordWidget> {
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
