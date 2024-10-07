import '/comp/tap_bar_mob_view/tap_bar_mob_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'q_rcode_scan_page_widget.dart' show QRcodeScanPageWidget;
import 'package:flutter/material.dart';

class QRcodeScanPageModel extends FlutterFlowModel<QRcodeScanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  var qrCodeOutput = '';
  // Model for TapBarMobView component.
  late TapBarMobViewModel tapBarMobViewModel;

  @override
  void initState(BuildContext context) {
    tapBarMobViewModel = createModel(context, () => TapBarMobViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tapBarMobViewModel.dispose();
  }
}
