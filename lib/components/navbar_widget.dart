import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
  })  : selectedPageIndex = selectedPageIndex ?? 1,
        hidden = hidden ?? false;

  final int selectedPageIndex;
  final bool hidden;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget>
    with TickerProviderStateMixin {
  late NavbarModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    animationsMap.addAll({
      'dividerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.5, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.5, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.5, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 50.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3F1E8C), Color(0xFF3EB0ED)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, 1.0),
                  end: AlignmentDirectional(0, -1.0),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity: widget.selectedPageIndex == 1 ? 1.0 : 0.5,
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.add_task_rounded,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 25.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                'EventPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                        if (widget.selectedPageIndex == 1)
                          SizedBox(
                            width: 40.0,
                            child: Divider(
                              height: 5.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation1']!),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.qr_code_scanner_rounded,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 25.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                'QRcodeScanPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                        if (widget.selectedPageIndex == 2)
                          SizedBox(
                            width: 40.0,
                            child: Divider(
                              height: 5.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation2']!),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity: widget.selectedPageIndex == 3 ? 1.0 : 0.5,
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.spinner,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 25.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                'RuffleDraw',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                        if (widget.selectedPageIndex == 3)
                          SizedBox(
                            width: 40.0,
                            child: Divider(
                              height: 5.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation3']!),
                      ],
                    ),
                  ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 69.0,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF3F1E8C), Color(0xFF3EB0ED)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, 1.0),
              end: AlignmentDirectional(0, -1.0),
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/footer-logo-white.png',
                      width: 100.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.settings_suggest,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 40.0,
                    ),
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('Login', context.mounted);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
