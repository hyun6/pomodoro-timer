import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodoro_timer/services/tray.dart';

part 'tray_state.dart';

class TrayCubit extends Cubit<TrayState> {
  TrayCubit() : super(TrayInitial());
  final _trayService = TrayService();

  void init() {
    _trayService.init();
  }

  void setTitle(String title) {
    _trayService.setTitle(title);
  }
}
