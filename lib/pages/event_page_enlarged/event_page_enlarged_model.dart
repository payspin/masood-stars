import '/backend/backend.dart';
import '/comp/tap_bar_mob_view/tap_bar_mob_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_page_enlarged_widget.dart' show EventPageEnlargedWidget;
import 'package:flutter/material.dart';

class EventPageEnlargedModel extends FlutterFlowModel<EventPageEnlargedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Model for TapBarMobView component.
  late TapBarMobViewModel tapBarMobViewModel;

  @override
  void initState(BuildContext context) {
    tapBarMobViewModel = createModel(context, () => TapBarMobViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    tapBarMobViewModel.dispose();
  }
}
