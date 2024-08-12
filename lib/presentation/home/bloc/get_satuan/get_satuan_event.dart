part of 'get_satuan_bloc.dart';

@freezed
class GetSatuanEvent with _$GetSatuanEvent {
  const factory GetSatuanEvent.started() = _Started;
  const factory GetSatuanEvent.getSatuan() = _GetSatuan;
}