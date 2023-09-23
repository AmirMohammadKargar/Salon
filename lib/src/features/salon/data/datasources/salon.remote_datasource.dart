import 'package:injectable/injectable.dart';
import 'package:salon/src/features/salon/data/dtos/salons.dto.dart';
import 'package:salon/src/features/salon/data/models/salon.model.dart';
import 'package:salon/src/features/salon/data/models/salons.model.dart';
import 'package:salon/src/shared/constants/urls.dart';

import '../../../../core/network/http_client.dart';

abstract class SalonRemoteDatasource {
  Future<SalonsModel> salons(SalonsDto queryParams);
  Future<SalonModel> salon(int id);
}

@Injectable(as: SalonRemoteDatasource)
class SalonRemoteDatasourceImpl implements SalonRemoteDatasource {
  final AppHttpClient httpClient;
  SalonRemoteDatasourceImpl(this.httpClient);

  @override
  Future<SalonsModel> salons(SalonsDto queryParams) async {
    var jsonRes =
        await httpClient.get(Urls.salons, queryParams: queryParams.toJson());
    return SalonsModel.fromJson(jsonRes);
  }

  @override
  Future<SalonModel> salon(int id) async {
    var jsonRes =
        await httpClient.get(Urls.salon.replaceAll('{id}', id.toString()));
    return SalonModel.fromJson(jsonRes);
  }
}
