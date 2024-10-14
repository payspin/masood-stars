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
      width: 400.0,
      height: 850.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Output',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Space Grotesk',
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            valueOrDefault<String>(
              _model.outputQrCode,
              'zoz1',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Space Grotesk',
                  letterSpacing: 0.0,
                ),
          ),
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: custom_widgets.QrSCannerWidget(
              width: 300.0,
              height: 300.0,
              onValueChanged: (selectedValue) async {
                _model.outputQrCode = selectedValue;
                safeSetState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
