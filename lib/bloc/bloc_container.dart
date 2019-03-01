import 'package:flutter/material.dart';
import 'package:video_test_app/bloc/video_bloc.dart';

class BlocContainer extends InheritedWidget {
  final VideoBloc videoBloc;
  final Widget child;
  final Key key;

  BlocContainer( {@required this.child,@required this.videoBloc,@required this.key}) : super(key: key);

  @override
  bool updateShouldNotify(BlocContainer oldWidget) {
    return this.videoBloc != oldWidget.videoBloc&& key != oldWidget.key;
  }
  static BlocContainer of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocContainer) as BlocContainer);
  }
}
