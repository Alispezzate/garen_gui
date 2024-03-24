import 'package:garen_gui/models/game_data.dart';
import 'package:retrofit/http.dart' as retrofit;
import 'package:dio/dio.dart';

part 'game_data_service.g.dart';

@retrofit.RestApi()
abstract class GameDataService {
  factory GameDataService(Dio dio) => _GameDataService(dio);

  @retrofit.GET('http://127.0.0.1:2999/liveclientdata/allgamedata')
  @retrofit.Headers({
    'Content-Type': 'application/json',
  })
  Future<GameData> getGameData();
}
