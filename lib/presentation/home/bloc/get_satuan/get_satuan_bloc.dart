// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sttal/data/datasources/attendance_remote_datasource.dart';
import 'package:sttal/data/models/response/satuan_response_model.dart';

part 'get_satuan_bloc.freezed.dart';
part 'get_satuan_event.dart';
part 'get_satuan_state.dart';

class GetSatuanBloc extends Bloc<GetSatuanEvent, GetSatuanState> {
  final AttendanceRemoteDatasource datasource;
  GetSatuanBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetSatuan>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getSatuanProfile();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r.satuan!)),
      );
    });
  }
}
