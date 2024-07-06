import '/components/event_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_events_widget.dart' show AllEventsWidget;
import 'package:flutter/material.dart';

class AllEventsModel extends FlutterFlowModel<AllEventsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for EventListItem dynamic component.
  late FlutterFlowDynamicModels<EventListItemModel> eventListItemModels;

  @override
  void initState(BuildContext context) {
    eventListItemModels = FlutterFlowDynamicModels(() => EventListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    eventListItemModels.dispose();
  }
}
