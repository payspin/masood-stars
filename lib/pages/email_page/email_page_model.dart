import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'email_page_widget.dart' show EmailPageWidget;
import 'package:flutter/material.dart';

class EmailPageModel extends FlutterFlowModel<EmailPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? dbSV;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddressGuest widget.
  FocusNode? emailAddressGuestFocusNode;
  TextEditingController? emailAddressGuestTextController;
  String? Function(BuildContext, String?)?
      emailAddressGuestTextControllerValidator;
  String? _emailAddressGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Write correct email';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid email address, please enter a valid email address';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MasaoodDBRecord>? outputQueryDB;

  @override
  void initState(BuildContext context) {
    emailAddressGuestTextControllerValidator =
        _emailAddressGuestTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressGuestFocusNode?.dispose();
    emailAddressGuestTextController?.dispose();
  }
}
