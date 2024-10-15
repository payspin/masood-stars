import '/flutter_flow/flutter_flow_util.dart';
import 'addguest_widget.dart' show AddguestWidget;
import 'package:flutter/material.dart';

class AddguestModel extends FlutterFlowModel<AddguestWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstNameGuest widget.
  FocusNode? firstNameGuestFocusNode;
  TextEditingController? firstNameGuestTextController;
  String? Function(BuildContext, String?)?
      firstNameGuestTextControllerValidator;
  // State field(s) for emailAddressGuest widget.
  FocusNode? emailAddressGuestFocusNode;
  TextEditingController? emailAddressGuestTextController;
  String? Function(BuildContext, String?)?
      emailAddressGuestTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameGuestFocusNode?.dispose();
    firstNameGuestTextController?.dispose();

    emailAddressGuestFocusNode?.dispose();
    emailAddressGuestTextController?.dispose();
  }
}
