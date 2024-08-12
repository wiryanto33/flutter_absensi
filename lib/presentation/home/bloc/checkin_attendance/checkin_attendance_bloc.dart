// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sttal/data/datasources/attendance_remote_datasource.dart';
import 'package:sttal/data/models/request/chekinout_request_model.dart';
import 'package:sttal/data/models/response/checkinout_response_model.dart';

part 'checkin_attendance_bloc.freezed.dart';
part 'checkin_attendance_event.dart';
part 'checkin_attendance_state.dart';

class CheckinAttendanceBloc
    extends Bloc<CheckinAttendanceEvent, CheckinAttendanceState> {
  final AttendanceRemoteDatasource datasource;
  CheckinAttendanceBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Checkin>((event, emit) async {
      emit(const _Loading());
      final requestModel = CheckinOutRequestModel(
        latitude: event.latitude,
        longitude: event.longitude,
      );
      final result = await datasource.checkin(requestModel);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
