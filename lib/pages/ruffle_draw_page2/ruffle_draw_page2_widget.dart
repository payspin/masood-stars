import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'ruffle_draw_page2_model.dart';
export 'ruffle_draw_page2_model.dart';

class RuffleDrawPage2Widget extends StatefulWidget {
  const RuffleDrawPage2Widget({super.key});

  @override
  State<RuffleDrawPage2Widget> createState() => _RuffleDrawPage2WidgetState();
}

class _RuffleDrawPage2WidgetState extends State<RuffleDrawPage2Widget>
    with TickerProviderStateMixin {
  late RuffleDrawPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RuffleDrawPage2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.drawList = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'UserStateStatus',
              isEqualTo: 'Registered',
            )
            .where(
              'RuffleDraw',
              isNotEqualTo: true,
            ),
      );
    });

    animationsMap.addAll({
      'pageViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(1.7, 1.7),
            end: const Offset(1.0, 1.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(0.0, 200.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(36.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(36.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Visibility(
          visible:
              valueOrDefault<bool>(currentUserDocument?.eventManager, false) ==
                  true,
          child: AuthUserStreamWidget(
            builder: (context) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: Image.asset(
                            'assets/images/Background.png',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: PageView(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 100.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Picture6.png',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.85,
                                                fit: BoxFit.contain,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'imageOnPageLoadAnimation1']!),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 100.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Picture7.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.85,
                                              fit: BoxFit.contain,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'imageOnPageLoadAnimation2']!),
                                        ),
                                      ],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 9,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                      safeSetState(() {});
                                    },
                                    effect: smooth_page_indicator.SlideEffect(
                                      spacing: 8.0,
                                      radius: 8.0,
                                      dotWidth: 36.0,
                                      dotHeight: 16.0,
                                      dotColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      activeDotColor:
                                          FlutterFlowTheme.of(context).primary,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['pageViewOnPageLoadAnimation']!),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GradientText(
                                    valueOrDefault<String>(
                                      FFAppState().RdRandomPick.toString(),
                                      '00000',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF15161E),
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    colors: [
                                      FlutterFlowTheme.of(context).warning,
                                      FlutterFlowTheme.of(context).customColor2,
                                      FlutterFlowTheme.of(context).logoOr1
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.arrivedList =
                                            await queryUsersRecordOnce(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'UserStateStatus',
                                            isEqualTo: 'Arrived',
                                          ),
                                        );
                                        FFAppState().RdRandomPick =
                                            valueOrDefault<int>(
                                          random_data.randomInteger(
                                              1,
                                              valueOrDefault<int>(
                                                _model.arrivedList?.length,
                                                0,
                                              )),
                                          00000000,
                                        );
                                        safeSetState(() {});
                                        _model.indexselectionXX =
                                            await queryUsersRecordOnce(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'Index',
                                            isEqualTo:
                                                FFAppState().RdRandomPick,
                                          ),
                                        );
                                        FFAppState().RdPickResult =
                                            valueOrDefault<String>(
                                          _model.indexselectionXX?.first.email,
                                          'Email',
                                        );
                                        safeSetState(() {});

                                        await _model
                                            .indexselectionXX!.first.reference
                                            .update(createUsersRecordData(
                                          ruffleDraw: true,
                                        ));

                                        safeSetState(() {});
                                      },
                                      text: 'Draw',
                                      icon: const Icon(
                                        Icons.play_circle_outline_sharp,
                                        size: 35.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0x831EFF00),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Colors.white,
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 10.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                        hoverElevation: 5.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'RuffleDrawPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: '',
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0x00315BA8),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Space Grotesk',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].addToEnd(const SizedBox(height: 38.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
