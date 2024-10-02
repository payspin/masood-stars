import '/flutter_flow/flutter_flow_util.dart';
import 'q_rcode_scan_widget.dart' show QRcodeScanWidget;
import 'package:flutter/material.dart';

class QRcodeScanModel extends FlutterFlowModel<QRcodeScanWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  var qrCodeScanOutput = '';
  var qrCodeOutput = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
