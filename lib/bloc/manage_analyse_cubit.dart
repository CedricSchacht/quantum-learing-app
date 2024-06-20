import 'package:flutter_bloc/flutter_bloc.dart';

///Global State Wrapper for Analyse Step
///[stepIndex]
class ManageAnalyseState {
  late final int stepIndex;
  ManageAnalyseState(this.stepIndex);
  ManageAnalyseState.start() {
    stepIndex = 0;
  }
}

///Global State Manager according to BLoC Cubit pattern
///used in Cube diagram Page
class ManageAnalyseCubit extends Cubit<ManageAnalyseState> {
  ManageAnalyseCubit() : super(ManageAnalyseState.start());

  ///increment the current stepIndex by one
  void next() {
    emit(ManageAnalyseState(state.stepIndex + 1));
  }

  ///back to beginning
  void start() {
    emit(ManageAnalyseState.start());
  }

  ///decrementing the current stepIndex by one
  ///stepIndex will not decrement below zero
  void prev() {
    if (state.stepIndex > 0) emit(ManageAnalyseState(state.stepIndex - 1));
  }
}
