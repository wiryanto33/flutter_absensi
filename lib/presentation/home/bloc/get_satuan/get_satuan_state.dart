part of 'get_satuan_bloc.dart';

@freezed
class GetSatuanState with _$GetSatuanState {
  const factory GetSatuanState.initial() = _Initial;
  const factory GetSatuanState.loading() = _Loading;
  const factory GetSatuanState.success(Satuan data) = _Success;
  const factory GetSatuanState.error(String message) = _Error;
  
}
