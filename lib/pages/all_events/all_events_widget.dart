import '/backend/sqlite/sqlite_manager.dart';
import '/components/event_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'all_events_model.dart';
export 'all_events_model.dart';

class AllEventsWidget extends StatefulWidget {
  const AllEventsWidget({super.key});

  @override
  State<AllEventsWidget> createState() => _AllEventsWidgetState();
}

class _AllEventsWidgetState extends State<AllEventsWidget> {
  late AllEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllEventsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('AddEvent');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'All Events',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<List<GetEventsRow>>(
                  future: SQLiteManager.instance.getEvents(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final listViewGetEventsRowList = snapshot.data!;
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewGetEventsRowList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewGetEventsRow =
                            listViewGetEventsRowList[listViewIndex];
                        return wrapWithModel(
                          model: _model.eventListItemModels.getModel(
                            listViewGetEventsRow.id.toString(),
                            listViewIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: Hero(
                            tag: 'event_list_item',
                            transitionOnUserGestures: true,
                            child: Material(
                              color: Colors.transparent,
                              child: EventListItemWidget(
                                key: Key(
                                  'Keytdt_${listViewGetEventsRow.id.toString()}',
                                ),
                                parameter1: listViewGetEventsRow.name,
                                parameter2: listViewGetEventsRow.desc,
                                parameter3: listViewGetEventsRow.status,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
