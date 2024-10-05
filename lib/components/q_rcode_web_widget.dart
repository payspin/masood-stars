import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'q_rcode_web_model.dart';
export 'q_rcode_web_model.dart';

class QRcodeWebWidget extends StatefulWidget {
  const QRcodeWebWidget({super.key});

  @override
  State<QRcodeWebWidget> createState() => _QRcodeWebWidgetState();
}

class _QRcodeWebWidgetState extends State<QRcodeWebWidget> {
  late QRcodeWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRcodeWebModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: custom_widgets.QrCodeScannerWeb(
              width: 300.0,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}
